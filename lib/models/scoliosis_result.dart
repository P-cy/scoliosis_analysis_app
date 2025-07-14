import 'dart:ui';

class ScoliosisResult {
  final List<Keypoint> keypoints;
  final String classification;
  final double confidence;
  final String message;
  final bool isNormal;

  ScoliosisResult({
    required this.keypoints,
    required this.classification,
    required this.confidence,
    required this.message,
    required this.isNormal,
  });

  factory ScoliosisResult.noResult() {
    return ScoliosisResult(
      keypoints: [],
      classification: "ไม่สามารถวิเคราะห์ได้",
      confidence: 0.0,
      message: "ไม่สามารถวิเคราะห์ได้ กรุณาตรวจสอบรูปภาพอีกครั้ง",
      isNormal: false,
    );
  }

  factory ScoliosisResult.normal(List<Keypoint> keypoints, double confidence) {
    return ScoliosisResult(
      keypoints: keypoints,
      classification: "Normal",
      confidence: confidence,
      message: "ผลการวิเคราะห์แสดงว่าคุณอยู่ในภาวะปกติ",
      isNormal: true,
    );
  }

  factory ScoliosisResult.scoliosis(List<Keypoint> keypoints, double confidence) {
    return ScoliosisResult(
      keypoints: keypoints,
      classification: "Scoliosis",
      confidence: confidence,
      message: "พบว่าคุณอาจมีภาวะกระดูกสันหลังคด แนะนำให้ไปพบแพทย์",
      isNormal: false,
    );
  }
}

class Keypoint {
  final Offset position;
  final double confidence;
  final int index;

  Keypoint({
    required this.position,
    required this.confidence,
    required this.index,
  });

  factory Keypoint.fromJson(Map<String, dynamic> json) {
    return Keypoint(
      position: Offset(json['x']?.toDouble() ?? 0.0, json['y']?.toDouble() ?? 0.0),
      confidence: json['confidence']?.toDouble() ?? 0.0,
      index: json['index']?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'x': position.dx,
      'y': position.dy,
      'confidence': confidence,
      'index': index,
    };
  }
}