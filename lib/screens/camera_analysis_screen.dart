import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:scoliosis_analysis_app/models/scoliosis_result.dart';
import 'package:scoliosis_analysis_app/services/scoliosis_analyzer.dart';
import 'package:scoliosis_analysis_app/widgets/keypoint_painter.dart';
import 'package:scoliosis_analysis_app/widgets/scoliosis_result_overlay.dart';

class CameraAnalysisScreen extends StatefulWidget {
  const CameraAnalysisScreen({super.key});

  @override
  State<CameraAnalysisScreen> createState() => _CameraAnalysisScreenState();
}

class _CameraAnalysisScreenState extends State<CameraAnalysisScreen> 
    with WidgetsBindingObserver {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  bool _isAnalyzing = false;
  ScoliosisResult? _currentResult;
  Timer? _analysisTimer;
  final ScoliosisAnalyzer _analyzer = ScoliosisAnalyzer();
  
  // Analysis settings
  static const Duration _analysisInterval = Duration(milliseconds: 1000);
  int _cameraIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
    _initializeAnalyzer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _analysisTimer?.cancel();
    _cameraController?.dispose();
    _analyzer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      _cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }

  Future<void> _initializeAnalyzer() async {
    try {
      await _analyzer.initialize();
    } catch (e) {
      if (mounted) {
        _showErrorDialog('ไม่สามารถเริ่มต้นระบบวิเคราะห์ได้: $e');
      }
    }
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      
      if (_cameras == null || _cameras!.isEmpty) {
        _showErrorDialog('ไม่พบกล้องในอุปกรณ์');
        return;
      }

      // Prefer back camera for pose detection
      int backCameraIndex = _cameras!.indexWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
      );
      
      if (backCameraIndex != -1) {
        _cameraIndex = backCameraIndex;
      }

      _cameraController = CameraController(
        _cameras![_cameraIndex],
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await _cameraController!.initialize();
      
      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
        _startRealTimeAnalysis();
      }
    } catch (e) {
      _showErrorDialog('ไม่สามารถเริ่มต้นกล้องได้: $e');
    }
  }

  void _startRealTimeAnalysis() {
    _analysisTimer = Timer.periodic(_analysisInterval, (timer) {
      if (_isCameraInitialized && !_isAnalyzing) {
        _captureAndAnalyze();
      }
    });
  }

  Future<void> _captureAndAnalyze() async {
    if (!_isCameraInitialized || _isAnalyzing) return;

    setState(() {
      _isAnalyzing = true;
    });

    try {
      final XFile imageFile = await _cameraController!.takePicture();
      final result = await _analyzer.analyzeImage(File(imageFile.path));
      
      if (mounted) {
        setState(() {
          _currentResult = result;
        });
      }
      
      // Clean up temporary file
      await File(imageFile.path).delete();
    } catch (e) {
      print('Error during real-time analysis: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isAnalyzing = false;
        });
      }
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras == null || _cameras!.length < 2) return;

    setState(() {
      _isCameraInitialized = false;
      _currentResult = null;
    });

    _analysisTimer?.cancel();
    await _cameraController?.dispose();

    _cameraIndex = (_cameraIndex + 1) % _cameras!.length;
    
    _cameraController = CameraController(
      _cameras![_cameraIndex],
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    try {
      await _cameraController!.initialize();
      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
        _startRealTimeAnalysis();
      }
    } catch (e) {
      _showErrorDialog('ไม่สามารถเปลี่ยนกล้องได้: $e');
    }
  }

  void _pauseResumeAnalysis() {
    if (_analysisTimer?.isActive == true) {
      _analysisTimer?.cancel();
      setState(() {
        _currentResult = null;
      });
    } else {
      _startRealTimeAnalysis();
    }
  }

  void _showErrorDialog(String message) {
    if (!mounted) return;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'แจ้งเตือน',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ตกลง'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        elevation: 0,
        title: const Text(
          'วิเคราะห์แบบเรียลไทม์',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (_cameras != null && _cameras!.length > 1)
            IconButton(
              icon: const Icon(Icons.flip_camera_ios, color: Colors.white),
              onPressed: _switchCamera,
              tooltip: 'เปลี่ยนกล้อง',
            ),
          IconButton(
            icon: Icon(
              _analysisTimer?.isActive == true ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: _pauseResumeAnalysis,
            tooltip: _analysisTimer?.isActive == true ? 'หยุดชั่วคราว' : 'เริ่มวิเคราะห์',
          ),
        ],
      ),
      body: Stack(
        children: [
          // Camera Preview
          if (_isCameraInitialized)
            Positioned.fill(
              child: AspectRatio(
                aspectRatio: _cameraController!.value.aspectRatio,
                child: _currentResult != null && _currentResult!.keypoints.isNotEmpty
                    ? KeypointOverlay(
                        keypoints: _currentResult!.keypoints,
                        imageSize: Size(
                          _cameraController!.value.previewSize!.height,
                          _cameraController!.value.previewSize!.width,
                        ),
                        child: CameraPreview(_cameraController!),
                      )
                    : CameraPreview(_cameraController!),
              ),
            )
          else
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.white),
                  SizedBox(height: 20),
                  Text(
                    'กำลังเริ่มต้นกล้อง...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

          // Instructions overlay
          if (_isCameraInitialized && _currentResult == null && !_isAnalyzing)
            const Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  'วางตัวให้หันหลังเข้ากล้อง\nยืนตรงให้เห็นกระดูกสันหลังชัดเจน\nระบบจะวิเคราะห์อัตโนมัติ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

          // Real-time result overlay
          RealTimeResultOverlay(
            result: _currentResult,
            isAnalyzing: _isAnalyzing,
          ),

          // Camera controls
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Capture button (optional for taking screenshot)
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: IconButton(
                    onPressed: _isCameraInitialized ? () async {
                      // Optional: Save current frame with keypoints
                      try {
                        final XFile imageFile = await _cameraController!.takePicture();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('บันทึกภาพเรียบร้อย'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } catch (e) {
                        _showErrorDialog('ไม่สามารถบันทึกภาพได้: $e');
                      }
                    } : null,
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Analysis status indicator
          if (_isAnalyzing)
            const Positioned(
              top: 80,
              left: 20,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'กำลังวิเคราะห์...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}