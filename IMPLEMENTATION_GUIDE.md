# Flutter Scoliosis Detection App - Implementation Guide

## Overview
This Flutter application implements real-time scoliosis detection using YOLOv8 keypoint detection for analyzing spine curvature. The app provides both real-time camera analysis and single image analysis modes.

## Architecture

### Core Components

#### Models
- `lib/models/scoliosis_result.dart` - Data models for analysis results and keypoints

#### Services
- `lib/services/scoliosis_analyzer.dart` - Core analysis logic with YOLO integration

#### Screens
- `lib/screens/home_screen.dart` - Main selection screen
- `lib/screens/camera_analysis_screen.dart` - Real-time camera analysis
- `lib/screens/single_image_screen.dart` - Single image analysis

#### Widgets
- `lib/widgets/keypoint_painter.dart` - Custom painter for spine keypoints visualization
- `lib/widgets/scoliosis_result_overlay.dart` - Result display components

## Key Features

### YOLOv8 Keypoint Detection
- Detects 12 keypoints along the spine (C7 to L5)
- Supports both real-time and static image analysis
- Confidence-based filtering for reliable results

### Spine Analysis
- Calculates spine curvature using keypoint angles
- Implements Cobb angle measurement
- Classifies as Normal or Scoliosis based on curvature thresholds

### UI/UX Features
- Thai language interface
- Real-time keypoint overlay on camera feed
- Confidence scores and medical recommendations
- Professional medical disclaimers

## YOLO Model Integration

### Current Status
The app is structured to support YOLOv8 keypoint detection via the `ultralytics_yolo` package. Currently using placeholder logic until the model is available.

### Required Model Specifications
- **Task**: Pose/Keypoint Detection
- **Classes**: 2 (normal, scoliosis)
- **Keypoints**: 12 points along spine
- **Format**: PyTorch (.pt) or ONNX (.onnx)

### Integration Steps
1. Train YOLOv8 model with spine keypoint dataset
2. Replace placeholder logic in `ScoliosisAnalyzer`
3. Update model path in assets
4. Test with real model predictions

## Dependencies

### Core Packages
- `ultralytics_yolo: ^0.0.4` - YOLO model integration
- `camera: ^0.11.1` - Camera functionality
- `image_picker: ^1.1.2` - Image selection
- `image: ^4.5.2` - Image processing

### UI Packages
- `font_awesome_flutter: ^10.8.0` - Icons
- `google_fonts: ^6.2.1` - Typography
- `flutter_vector_icons: ^2.0.0` - Additional icons

## File Structure
```
lib/
├── main.dart                          # App entry point
├── models/
│   └── scoliosis_result.dart         # Data models
├── screens/
│   ├── home_screen.dart              # Main selection
│   ├── camera_analysis_screen.dart   # Real-time analysis
│   └── single_image_screen.dart      # Single image analysis
├── widgets/
│   ├── keypoint_painter.dart         # Keypoint visualization
│   └── scoliosis_result_overlay.dart # Result display
├── services/
│   └── scoliosis_analyzer.dart       # Analysis logic
└── pages/ (legacy)
    └── [existing pages]              # Original app pages
```

## Usage

### Real-time Analysis
1. Launch app and select "วิเคราะห์แบบเรียลไทม์"
2. Position subject with back facing camera
3. System automatically detects and analyzes spine keypoints
4. Results displayed in real-time overlay

### Single Image Analysis
1. Select "วิเคราะห์จากรูปภาพ"
2. Choose image from gallery or take new photo
3. Wait for analysis to complete
4. View results with keypoint overlay

## Medical Disclaimers

The app includes appropriate medical disclaimers stating that:
- This is a screening tool, not a diagnostic device
- Professional medical consultation is recommended
- Results should not replace professional medical advice

## Future Enhancements

1. **Model Training**: Train custom YOLOv8 model with spine datasets
2. **Performance Optimization**: Optimize for mobile inference
3. **Additional Metrics**: Implement more spine analysis algorithms
4. **Data Export**: Allow saving and sharing of analysis results
5. **Multi-language Support**: Extend beyond Thai language