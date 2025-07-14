import 'package:flutter/material.dart';
import 'package:scoliosis_analysis_app/models/scoliosis_result.dart';

class KeypointPainter extends CustomPainter {
  final List<Keypoint> keypoints;
  final Size imageSize;
  final bool showConnections;

  KeypointPainter({
    required this.keypoints,
    required this.imageSize,
    this.showConnections = true,
  });

  // Define spine keypoint connections (12 points along spine)
  static const List<List<int>> spineConnections = [
    [0, 1], // C7 to T1
    [1, 2], // T1 to T3
    [2, 3], // T3 to T5
    [3, 4], // T5 to T7
    [4, 5], // T7 to T9
    [5, 6], // T9 to T11
    [6, 7], // T11 to L1
    [7, 8], // L1 to L2
    [8, 9], // L2 to L3
    [9, 10], // L3 to L4
    [10, 11], // L4 to L5
  ];

  @override
  void paint(Canvas canvas, Size size) {
    if (keypoints.isEmpty) return;

    final paint = Paint()
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;

    final linePaint = Paint()
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..color = Colors.blue.withOpacity(0.8);

    // Calculate scaling factors
    final scaleX = size.width / imageSize.width;
    final scaleY = size.height / imageSize.height;

    // Draw connections between keypoints first
    if (showConnections) {
      for (final connection in spineConnections) {
        final startIndex = connection[0];
        final endIndex = connection[1];

        if (startIndex < keypoints.length && endIndex < keypoints.length) {
          final startKeypoint = keypoints[startIndex];
          final endKeypoint = keypoints[endIndex];

          // Only draw connection if both keypoints have sufficient confidence
          if (startKeypoint.confidence > 0.3 && endKeypoint.confidence > 0.3) {
            final startPoint = Offset(
              startKeypoint.position.dx * scaleX,
              startKeypoint.position.dy * scaleY,
            );
            final endPoint = Offset(
              endKeypoint.position.dx * scaleX,
              endKeypoint.position.dy * scaleY,
            );

            // Draw line with varying opacity based on confidence
            final avgConfidence = (startKeypoint.confidence + endKeypoint.confidence) / 2;
            linePaint.color = Colors.blue.withOpacity(avgConfidence);
            canvas.drawLine(startPoint, endPoint, linePaint);
          }
        }
      }
    }

    // Draw keypoints
    for (int i = 0; i < keypoints.length; i++) {
      final keypoint = keypoints[i];
      
      // Only draw keypoint if confidence is sufficient
      if (keypoint.confidence > 0.3) {
        final point = Offset(
          keypoint.position.dx * scaleX,
          keypoint.position.dy * scaleY,
        );

        // Color based on confidence level
        Color pointColor;
        if (keypoint.confidence > 0.8) {
          pointColor = Colors.green;
        } else if (keypoint.confidence > 0.6) {
          pointColor = Colors.orange;
        } else {
          pointColor = Colors.red;
        }

        paint.color = pointColor;
        canvas.drawCircle(point, 8.0, paint);

        // Draw keypoint index
        final textPainter = TextPainter(
          text: TextSpan(
            text: '${i + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(
            point.dx - textPainter.width / 2,
            point.dy - textPainter.height / 2,
          ),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is KeypointPainter) {
      return oldDelegate.keypoints != keypoints ||
          oldDelegate.imageSize != imageSize ||
          oldDelegate.showConnections != showConnections;
    }
    return true;
  }
}

class KeypointOverlay extends StatelessWidget {
  final List<Keypoint> keypoints;
  final Size imageSize;
  final Widget child;
  final bool showConnections;

  const KeypointOverlay({
    super.key,
    required this.keypoints,
    required this.imageSize,
    required this.child,
    this.showConnections = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: CustomPaint(
            painter: KeypointPainter(
              keypoints: keypoints,
              imageSize: imageSize,
              showConnections: showConnections,
            ),
          ),
        ),
      ],
    );
  }
}