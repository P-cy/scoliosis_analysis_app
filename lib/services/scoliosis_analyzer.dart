import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';
import 'package:scoliosis_analysis_app/models/scoliosis_result.dart';
import 'package:image/image.dart' as img;

class ScoliosisAnalyzer {
  static const double _confidenceThreshold = 0.3;
  static const double _scoliosisThreshold = 15.0; // degrees
  
  // Singleton pattern
  static final ScoliosisAnalyzer _instance = ScoliosisAnalyzer._internal();
  factory ScoliosisAnalyzer() => _instance;
  ScoliosisAnalyzer._internal();

  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;
    
    try {
      // TODO: Initialize YOLO model here when ultralytics_yolo is available
      // Example code for when the package is ready:
      // await UltralyticsYOLO.initializeModel(
      //   modelPath: 'assets/ml/scoliosis_yolo_keypoint.pt',
      //   task: YOLOTask.pose,
      //   numClasses: 2,
      //   numKeypoints: 12,
      // );
      
      // For now, we'll use placeholder logic
      _isInitialized = true;
    } catch (e) {
      throw Exception('Failed to initialize YOLO model: $e');
    }
  }

  Future<ScoliosisResult> analyzeImage(File imageFile) async {
    if (!_isInitialized) {
      await initialize();
    }

    try {
      // Load and preprocess image
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);
      
      if (image == null) {
        return ScoliosisResult.noResult();
      }

      // Run YOLO keypoint detection
      final keypoints = await _detectKeypoints(image);
      
      if (keypoints.isEmpty) {
        return ScoliosisResult.noResult();
      }

      // Analyze spine curvature
      final analysisResult = _analyzeScoliosis(keypoints);
      
      return analysisResult;
    } catch (e) {
      print('Error analyzing image: $e');
      return ScoliosisResult.noResult();
    }
  }

  Future<List<Keypoint>> _detectKeypoints(img.Image image) async {
    // TODO: Replace with actual YOLO keypoint detection
    // Example code for when ultralytics_yolo is available:
    // final results = await UltralyticsYOLO.detectKeypoints(
    //   image: image,
    //   confidenceThreshold: _confidenceThreshold,
    // );
    // return results.keypoints;
    
    // For now, generate mock keypoints for demonstration
    return _generateMockKeypoints(image.width, image.height);
  }

  List<Keypoint> _generateMockKeypoints(int imageWidth, int imageHeight) {
    final random = Random();
    final keypoints = <Keypoint>[];
    
    // Generate 12 keypoints along a simulated spine
    final centerX = imageWidth * 0.5;
    final startY = imageHeight * 0.15;
    final endY = imageHeight * 0.85;
    final spineHeight = endY - startY;
    
    for (int i = 0; i < 12; i++) {
      final progress = i / 11.0;
      final baseY = startY + (spineHeight * progress);
      
      // Add some randomness to simulate natural spine variation
      final xVariation = (random.nextDouble() - 0.5) * 30;
      final yVariation = (random.nextDouble() - 0.5) * 20;
      
      final x = centerX + xVariation;
      final y = baseY + yVariation;
      
      keypoints.add(Keypoint(
        position: Offset(x, y),
        confidence: 0.7 + (random.nextDouble() * 0.3), // 0.7-1.0
        index: i,
      ));
    }
    
    return keypoints;
  }

  ScoliosisResult _analyzeScoliosis(List<Keypoint> keypoints) {
    if (keypoints.length < 3) {
      return ScoliosisResult.noResult();
    }

    // Filter keypoints by confidence
    final validKeypoints = keypoints.where((kp) => kp.confidence > _confidenceThreshold).toList();
    
    if (validKeypoints.length < 3) {
      return ScoliosisResult.noResult();
    }

    // Calculate spine curvature
    final maxCurvature = _calculateMaxCurvature(validKeypoints);
    final avgConfidence = validKeypoints.map((kp) => kp.confidence).reduce((a, b) => a + b) / validKeypoints.length;
    
    // Determine if scoliosis is present
    final hasScoliosis = maxCurvature > _scoliosisThreshold;
    
    if (hasScoliosis) {
      return ScoliosisResult.scoliosis(keypoints, avgConfidence);
    } else {
      return ScoliosisResult.normal(keypoints, avgConfidence);
    }
  }

  double _calculateMaxCurvature(List<Keypoint> keypoints) {
    if (keypoints.length < 3) return 0.0;

    double maxCurvature = 0.0;
    
    // Calculate curvature using groups of 3 consecutive points
    for (int i = 0; i < keypoints.length - 2; i++) {
      final p1 = keypoints[i].position;
      final p2 = keypoints[i + 1].position;
      final p3 = keypoints[i + 2].position;
      
      final curvature = _calculateAngle(p1, p2, p3);
      maxCurvature = math.max(maxCurvature, curvature.abs());
    }
    
    return maxCurvature;
  }

  double _calculateAngle(Offset p1, Offset p2, Offset p3) {
    final v1 = Offset(p1.dx - p2.dx, p1.dy - p2.dy);
    final v2 = Offset(p3.dx - p2.dx, p3.dy - p2.dy);
    
    final dot = v1.dx * v2.dx + v1.dy * v2.dy;
    final mag1 = math.sqrt(v1.dx * v1.dx + v1.dy * v1.dy);
    final mag2 = math.sqrt(v2.dx * v2.dx + v2.dy * v2.dy);
    
    if (mag1 == 0 || mag2 == 0) return 0.0;
    
    final cosAngle = dot / (mag1 * mag2);
    final clampedCos = cosAngle.clamp(-1.0, 1.0);
    
    return math.acos(clampedCos) * 180 / math.pi;
  }

  // Calculate Cobb angle for more precise scoliosis measurement
  double calculateCobbAngle(List<Keypoint> keypoints) {
    if (keypoints.length < 4) return 0.0;

    final validKeypoints = keypoints.where((kp) => kp.confidence > _confidenceThreshold).toList();
    if (validKeypoints.length < 4) return 0.0;

    // Find the most tilted segments
    double maxAngle = 0.0;
    
    for (int i = 0; i < validKeypoints.length - 3; i++) {
      final upperLine = _getLineAngle(validKeypoints[i].position, validKeypoints[i + 1].position);
      final lowerLine = _getLineAngle(validKeypoints[i + 2].position, validKeypoints[i + 3].position);
      
      final angleDiff = (upperLine - lowerLine).abs();
      maxAngle = math.max(maxAngle, angleDiff);
    }
    
    return maxAngle;
  }

  double _getLineAngle(Offset p1, Offset p2) {
    return math.atan2(p2.dy - p1.dy, p2.dx - p1.dx) * 180 / math.pi;
  }

  void dispose() {
    // Clean up resources
    _isInitialized = false;
  }
}