// ignore_for_file: avoid_print, deprecated_member_use, sort_child_properties_last

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:scoliosis_analysis_app/pages/exercise_page.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? image;
  late ImagePicker imagePicker;
  late ImageLabeler labeler;
  Interpreter? interpreter; // เพิ่ม TensorFlow Lite interpreter
  String diagnosisResult = '';
  double confidenceScore = 0.0;
  String diagnosisType = "";
  bool isProcessing = false;

  void resetAnalysis() {
    setState(() {
      image = null;
      diagnosisResult = '';
      confidenceScore = 0.0;
      diagnosisType = "";
      isProcessing = false;
    });
  }

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    loadModel();
  }

  @override
  void dispose() {
    labeler.close();
    interpreter?.close(); // ปิด TensorFlow Lite interpreter
    super.dispose();
  }

  Future<void> loadModel() async {
    try {
      // โหลดโมเดลสำหรับ Google ML Kit
      final modelPath =
          await getModelPath('assets/ml/model_b0.tflite');
      labeler = ImageLabeler(
        options: LocalLabelerOptions(
          confidenceThreshold: 0.5, // ลดค่า threshold สำหรับโมเดลใหม่
          modelPath: modelPath,
        ),
      );

      // โหลดโมเดลสำหรับ TensorFlow Lite โดยตรง
      try {
        interpreter = await Interpreter.fromAsset('assets/ml/model_b0.tflite');
        print('TensorFlow Lite model B0 loaded successfully');
        
        // แสดงข้อมูลโมเดล
        final inputTensors = interpreter!.getInputTensors();
        final outputTensors = interpreter!.getOutputTensors();
        
        print('Number of input tensors: ${inputTensors.length}');
        print('Number of output tensors: ${outputTensors.length}');
        
        for (int i = 0; i < inputTensors.length; i++) {
          print('Input tensor $i: shape=${inputTensors[i].shape}, type=${inputTensors[i].type}');
        }
        
        for (int i = 0; i < outputTensors.length; i++) {
          print('Output tensor $i: shape=${outputTensors[i].shape}, type=${outputTensors[i].type}');
        }
      } catch (e) {
        print('Error loading TensorFlow Lite model B0: $e');
        // ยังคงใช้ Google ML Kit ได้ถ้า TensorFlow Lite ไม่ทำงาน
      }
    } catch (e) {
      print('Error loading model: $e');
      showErrorDialog('ไม่สามารถโหลดโมเดล AI ได้ กรุณาลองใหม่อีกครั้ง');
    }
  }

  Future<void> chooseImage() async {
    try {
      // ล้าง image cache ก่อน
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
      
      setState(() {
        image = null;
        diagnosisResult = '';
        confidenceScore = 0.0;
        diagnosisType = "";
        isProcessing = true;
      });

      XFile? selectedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (selectedImage != null) {
        final newImageFile = File(selectedImage.path);
        print('New image selected: ${newImageFile.path}');
        
        setState(() {
          image = newImageFile;
        });

        await processAndAnalyzeImage(newImageFile);
      } else {
        setState(() {
          isProcessing = false;
        });
      }
    } catch (e) {
      print('Error choosing image: $e');
      showErrorDialog('เกิดข้อผิดพลาดในการเลือกรูปภาพ');
      setState(() {
        image = null;
        diagnosisResult = '';
        confidenceScore = 0.0;
        diagnosisType = "";
        isProcessing = false;
      });
    }
  }

  Future<void> captureImage() async {
    try {
      // ล้าง image cache ก่อน
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
      
      // เคลียร์ข้อมูล
      setState(() {
        image = null;
        diagnosisResult = '';
        confidenceScore = 0.0;
        diagnosisType = "";
        isProcessing = true;
      });

      XFile? selectedImage =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (selectedImage != null) {
        final newImageFile = File(selectedImage.path);
        print('New image captured: ${newImageFile.path}');
        
        setState(() {
          image = newImageFile;
        });

        await processAndAnalyzeImage(newImageFile);
      } else {
        setState(() {
          isProcessing = false;
        });
      }
    } catch (e) {
      print('Error capturing image: $e');
      showErrorDialog('เกิดข้อผิดพลาดในการถ่ายภาพ');
      setState(() {
        image = null;
        diagnosisResult = '';
        confidenceScore = 0.0;
        diagnosisType = "";
        isProcessing = false;
      });
    }
  }

  Future<void> processAndAnalyzeImage(File imageFile) async {
    try {
      if (!(await imageFile.exists()) || await imageFile.length() == 0) {
        setNoSpineFoundResult();
        return;
      }

      final processedImage = await preprocessImage(imageFile);
      if (processedImage != null) {
        image = processedImage;
        
        // ลองใช้ TensorFlow Lite ก่อน ถ้าไม่ได้ค่อยใช้ Google ML Kit
        final tensorflowResult = await predictWithTensorFlowLite(processedImage);
        if (tensorflowResult != null && tensorflowResult['confidence'] > 0.5) {
          // ตรวจสอบว่ามี error หรือไม่
          if (tensorflowResult.containsKey('error')) {
            diagnosisType = "Uncertain";
            diagnosisResult = tensorflowResult['error'];
            confidenceScore = 0.0;
            setState(() {});
            return;
          }
          
          // ใช้ผลลัพธ์จาก TensorFlow Lite
          diagnosisType = tensorflowResult['class'];
          confidenceScore = (tensorflowResult['confidence'] * 100);
          
          // ตรวจสอบความน่าเชื่อถือเพิ่มเติม
          final normalConf = tensorflowResult['normal_confidence'] * 100;
          final scoliosisConf = tensorflowResult['scoliosis_confidence'] * 100;
          final confidenceDiff = (normalConf - scoliosisConf).abs();
          
          print('Using TensorFlow Lite result: $diagnosisType with confidence: $confidenceScore%');
          print('Confidence difference: $confidenceDiff%');
          
          if (diagnosisType == "Scoliosis") {
            if (confidenceScore > 80 && confidenceDiff < 20) {
              diagnosisResult = "⚠️ ผลการวิเคราะห์ไม่แน่นอน\nแนะนำให้ถ่ายภาพใหม่หรือปรึกษาแพทย์\nTensorFlow Lite: ${confidenceScore.toStringAsFixed(1)}%\n(ความแตกต่าง: ${confidenceDiff.toStringAsFixed(1)}%)";
            } else {
              diagnosisResult = "พบภาวะกระดูกสันหลังคด\nควรปรึกษาแพทย์เพื่อการตรวจสอบเพิ่มเติม\nTensorFlow Lite: ${confidenceScore.toStringAsFixed(1)}%\nNormal: ${normalConf.toStringAsFixed(1)}% | Scoliosis: ${scoliosisConf.toStringAsFixed(1)}%";
            }
          } else {
            diagnosisResult = "กระดูกสันหลังดูปกติ\nแต่ควรตรวจสอบเป็นประจำ\nTensorFlow Lite: ${confidenceScore.toStringAsFixed(1)}%\nNormal: ${normalConf.toStringAsFixed(1)}% | Scoliosis: ${scoliosisConf.toStringAsFixed(1)}%";
          }
          
          setState(() {});
        } else {
          // ใช้ Google ML Kit เป็น fallback
          print('TensorFlow Lite failed or low confidence, falling back to Google ML Kit');
          await performImageLabeling();
        }
      } else {
        setNoSpineFoundResult();
      }
    } catch (e) {
      print('Error processing image: $e');
      setNoSpineFoundResult();
    } finally {
      setState(() {
        isProcessing = false;
      });
    }
  }

  Future<File?> preprocessImage(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final originalImage = img.decodeImage(bytes);

      if (originalImage == null) return null;

      // ตรวจสอบคุณภาพรูปภาพ
      if (!_isImageQualityGood(originalImage)) {
        showErrorDialog('คุณภาพรูปภาพไม่เหมาะสม กรุณาถ่ายรูปใหม่ในที่ที่มีแสงสว่างเพียงพอ');
        return null;
      }

      final width = 640;
      final height = 640;

      // ปรับปรุงการ resize เพื่อรักษาสัดส่วน
      final resizedImage = _resizeWithAspectRatio(originalImage, width, height);

      // เพิ่มการปรับปรุงคุณภาพรูป
      final enhancedImage = _enhanceImageQuality(resizedImage);

      final directory = await getApplicationDocumentsDirectory();
      final processedImagePath = '${directory.path}/processed_spine_image.png';
      final processedImageFile = File(processedImagePath);

      await processedImageFile.writeAsBytes(img.encodePng(enhancedImage));

      return processedImageFile;
    } catch (e) {
      print('Error preprocessing image: $e');
      return null;
    }
  }

  // ฟังก์ชันตรวจสอบว่ารูปภาพเหมาะสมสำหรับการวิเคราะห์กระดูกสันหลังหรือไม่
  bool _isImageSuitableForSpineAnalysis(img.Image image) {
    // ตรวจสอบขนาดรูป - ถ้าเล็กเกินไปอาจไม่มีรายละเอียดเพียงพอ
    if (image.width < 100 || image.height < 100) {
      print('Image too small: ${image.width}x${image.height}');
      return false;
    }

    // ตรวจสอบอัตราส่วนของรูป - ภาพกระดูกสันหลังควรเป็นแนวตั้ง
    final aspectRatio = image.height / image.width;
    if (aspectRatio < 0.8) {
      print('Image aspect ratio too wide: $aspectRatio (should be > 0.8 for spine images)');
      return false;
    }

    // ตรวจสอบความสว่างเฉลี่ย
    double totalBrightness = 0;
    int sampleCount = 0;
    
    // สุ่มตัวอย่าง pixel แทนการตรวจสอบทุกจุด
    final stepX = (image.width / 20).ceil();
    final stepY = (image.height / 20).ceil();
    
    for (int y = 0; y < image.height; y += stepY) {
      for (int x = 0; x < image.width; x += stepX) {
        final pixel = image.getPixel(x, y);
        final brightness = (pixel.r + pixel.g + pixel.b) / 3;
        totalBrightness += brightness;
        sampleCount++;
      }
    }
    
    final averageBrightness = totalBrightness / sampleCount;
    
    // รูปมืดเกินไป (< 30) หรือสว่างเกินไป (> 220)
    if (averageBrightness < 30 || averageBrightness > 220) {
      print('Poor brightness: $averageBrightness (should be 30-220)');
      return false;
    }

    // คำนวณ contrast โดยประมาณ
    double brightnessVariance = 0;
    sampleCount = 0;
    
    for (int y = 0; y < image.height; y += stepY) {
      for (int x = 0; x < image.width; x += stepX) {
        final pixel = image.getPixel(x, y);
        final brightness = (pixel.r + pixel.g + pixel.b) / 3;
        brightnessVariance += (brightness - averageBrightness) * (brightness - averageBrightness);
        sampleCount++;
      }
    }
    
    final contrastLevel = brightnessVariance / sampleCount;
    
    // Contrast ต่ำเกินไป = รูปเบลอหรือไม่ชัด
    if (contrastLevel < 100) {
      print('Low contrast: $contrastLevel (should be > 100)');
      return false;
    }

    print('Image quality check passed - Size: ${image.width}x${image.height}, Aspect: $aspectRatio, Brightness: $averageBrightness, Contrast: $contrastLevel');
    return true;
  }

  // ฟังก์ชันตรวจสอบคุณภาพรูปภาพ
  bool _isImageQualityGood(img.Image image) {
    // ตรวจสอบความสว่าง
    double totalBrightness = 0;
    int pixelCount = image.width * image.height;
    
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        final r = pixel.r;
        final g = pixel.g;
        final b = pixel.b;
        totalBrightness += ((r + g + b) / 3);
      }
    }
    
    double averageBrightness = totalBrightness / pixelCount;
    
    // ตรวจสอบว่าภาพไม่มืดเกินไปหรือสว่างเกินไป
    return averageBrightness > 30 && averageBrightness < 220;
  }

  // ฟังก์ชัน resize ที่รักษาสัดส่วน
  img.Image _resizeWithAspectRatio(img.Image original, int targetWidth, int targetHeight) {
    // คำนวณสัดส่วนที่เหมาะสม
    double aspectRatio = original.width / original.height;
    int newWidth, newHeight;
    
    if (aspectRatio > 1) {
      newWidth = targetWidth;
      newHeight = (targetWidth / aspectRatio).round();
    } else {
      newHeight = targetHeight;
      newWidth = (targetHeight * aspectRatio).round();
    }
    
    // Resize ตามสัดส่วน
    final resized = img.copyResize(original,
        width: newWidth,
        height: newHeight,
        interpolation: img.Interpolation.cubic);
    
    // สร้างภาพขนาด target โดยเพิ่มพื้นหลังสีดำ
    final finalImage = img.Image(width: targetWidth, height: targetHeight);
    img.fill(finalImage, color: img.ColorRgb8(0, 0, 0));
    
    // วางภาพตรงกลาง
    final offsetX = (targetWidth - newWidth) ~/ 2;
    final offsetY = (targetHeight - newHeight) ~/ 2;
    img.compositeImage(finalImage, resized, dstX: offsetX, dstY: offsetY);
    
    return finalImage;
  }

  // ฟังก์ชันปรับปรุงคุณภาพรูป
  img.Image _enhanceImageQuality(img.Image image) {
    // เพิ่ม contrast และ brightness เล็กน้อย
    final enhanced = img.adjustColor(image,
        contrast: 1.1,
        brightness: 1.05,
        saturation: 0.95);
    
    // ลด noise
    return img.gaussianBlur(enhanced, radius: 1);
  }

  void setNoSpineFoundResult() {
    if (mounted) {
      setState(() {
        diagnosisType = "ไม่สามารถวิเคราะห์ได้";
        diagnosisResult =
            "ไม่สามารถวิเคราะห์ได้ กรุณาตรวจสอบรูปภาพอีกครั้ง";
        confidenceScore = 0.0;
        isProcessing = false;
      });
    }
  }

  Future<void> performImageLabeling() async {
    try {
      diagnosisResult = "";
      confidenceScore = 0.0;
      diagnosisType = "";

      InputImage inputImage = InputImage.fromFile(image!);
      final List<ImageLabel> labels = await labeler.processImage(inputImage);

      // เพิ่มการ log ข้อมูลเพื่อ debug
      print('AI Labels found: ${labels.length}');
      for (var label in labels) {
        print('Label: ${label.label}, Confidence: ${label.confidence}');
      }

      bool foundDiagnosis = false;
      double highestConfidence = 0.0;
      String bestDiagnosis = "";
      String bestLabel = "";

      // ปรับปรุงการจำแนกประเภทสำหรับโมเดล model_b0
      for (ImageLabel label in labels) {
        final String text = label.label.toLowerCase().trim();
        final double confidence = label.confidence;

        // ตรวจสอบทุก label ที่มี confidence มากกว่า 0.3
        if (confidence > 0.3 && confidence > highestConfidence) {
          highestConfidence = confidence;
          bestLabel = label.label;
          bestDiagnosis = _classifySpineConditionV2(text, confidence);
          foundDiagnosis = true;
        }
      }

      // เพิ่มเงื่อนไขการตรวจสอบความน่าเชื่อถือสำหรับโมเดลใหม่
      if (foundDiagnosis && highestConfidence >= 0.4) {
        diagnosisType = bestDiagnosis;
        confidenceScore = highestConfidence * 100;

        // สร้างข้อความผลลัพธ์ที่ละเอียดมากขึ้น
        if (bestDiagnosis == "Scoliosis") {
          diagnosisResult = "พบภาวะกระดูกสันหลังคด\nควรปรึกษาแพทย์เพื่อการตรวจสอบเพิ่มเติม\nDetected: $bestLabel";
        } else if (bestDiagnosis == "Normal") {
          diagnosisResult = "กระดูกสันหลังดูปกติ\nแต่ควรตรวจสอบเป็นประจำ\nDetected: $bestLabel";
        } else {
          diagnosisResult = "ไม่สามารถวิเคราะห์ได้ชัดเจน\nกรุณาถ่ายภาพใหม่ในท่าที่เหมาะสม\nDetected: $bestLabel";
        }
      } else {
        // ไม่พบข้อมูลที่เชื่อถือได้
        setNoSpineFoundResult();
      }

      setState(() {});
    } catch (e) {
      print('Error performing image labeling: $e');
      setNoSpineFoundResult();
    } finally {
      // ตรวจสอบให้แน่ใจว่า isProcessing ถูกปิดเสมอ
      if (mounted) {
        setState(() {
          isProcessing = false;
        });
      }
    }
  }

  // ฟังก์ชันทำนายด้วย TensorFlow Lite โดยตรง
  Future<Map<String, dynamic>?> predictWithTensorFlowLite(File imageFile) async {
    if (interpreter == null) {
      print('TensorFlow Lite interpreter not loaded');
      return null;
    }

    try {
      // เช็ค input และ output tensor shapes
      final inputTensor = interpreter!.getInputTensor(0);
      final outputTensor = interpreter!.getOutputTensor(0);
      print('Input tensor shape: ${inputTensor.shape}');
      print('Output tensor shape: ${outputTensor.shape}');

      // อ่านและประมวลผลรูปภาพ
      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);
      if (image == null) return null;

      // ตรวจสอบความเหมาะสมของรูปภาพก่อน predict
      if (!_isImageSuitableForSpineAnalysis(image)) {
        print('Image not suitable for spine analysis');
        return {
          'class': 'Uncertain',
          'confidence': 0.0,
          'normal_confidence': 0.5,
          'scoliosis_confidence': 0.5,
          'error': 'รูปภาพไม่เหมาะสมสำหรับการวิเคราะห์กระดูกสันหลัง'
        };
      }

      // ดึง input size จาก tensor shape จริง
      final inputShape = inputTensor.shape;
      final batchSize = inputShape[0];
      final height = inputShape[1];
      final width = inputShape[2];
      final channels = inputShape[3];

      print('Model expects: batch=$batchSize, height=$height, width=$width, channels=$channels');

      // ปรับขนาดรูปภาพให้ตรงกับ input shape ของโมเดล B0 (224x224)
      final resizedImage = img.copyResize(image, width: 224, height: 224);

      // แปลงเป็น input tensor ตาม shape ที่โมเดลต้องการ
      dynamic input;
      
      if (batchSize == 1 && channels == 3) {
        // แบบปกติ: [1, height, width, 3]
        input = List.generate(1, (b) => 
          List.generate(height, (y) => 
            List.generate(width, (x) => 
              List.generate(3, (c) {
                final pixel = resizedImage.getPixel(x, y);
                // Normalize ค่า pixel ให้อยู่ในช่วง 0-1
                switch (c) {
                  case 0: return pixel.r / 255.0; // Red
                  case 1: return pixel.g / 255.0; // Green  
                  case 2: return pixel.b / 255.0; // Blue
                  default: return 0.0;
                }
              })
            )
          )
        );
      } else if (batchSize == 1 && channels == 1) {
        // Grayscale: [1, height, width, 1]
        input = List.generate(1, (b) => 
          List.generate(height, (y) => 
            List.generate(width, (x) => 
              List.generate(1, (c) {
                final pixel = resizedImage.getPixel(x, y);
                // แปลงเป็น grayscale
                final gray = (pixel.r * 0.299 + pixel.g * 0.587 + pixel.b * 0.114) / 255.0;
                return gray;
              })
            )
          )
        );
      } else {
        // รูปแบบอื่นๆ - ลองใช้ flat array
        final totalPixels = height * width * channels;
        final flatInput = List<double>.filled(totalPixels, 0.0);
        
        for (int y = 0; y < height; y++) {
          for (int x = 0; x < width; x++) {
            final pixel = resizedImage.getPixel(x, y);
            final index = (y * width + x) * channels;
            
            if (channels >= 3) {
              flatInput[index] = pixel.r / 255.0;
              flatInput[index + 1] = pixel.g / 255.0;
              flatInput[index + 2] = pixel.b / 255.0;
            } else if (channels == 1) {
              final gray = (pixel.r * 0.299 + pixel.g * 0.587 + pixel.b * 0.114) / 255.0;
              flatInput[index] = gray;
            }
          }
        }
        
        input = [flatInput];
      }

      // เตรียม output tensor ตาม shape ที่โมเดลให้
      final outputShape = outputTensor.shape;
      print('Output shape: $outputShape');
      
      dynamic output;
      
      if (outputShape.length == 2) {
        // แบบปกติ: [batch_size, num_classes]
        final outputBatch = outputShape[0];
        final outputClasses = outputShape[1];
        output = List.generate(outputBatch, (i) => List.filled(outputClasses, 0.0));
      } else if (outputShape.length == 1) {
        // แบบ flat: [num_classes]
        final outputClasses = outputShape[0];
        output = List.filled(outputClasses, 0.0);
      } else {
        // รูปแบบอื่นๆ
        int totalElements = outputShape.reduce((a, b) => a * b);
        output = List.filled(totalElements, 0.0);
      }

      print('Running inference...');
      // รัน inference
      interpreter!.run(input, output);

      // ประมวลผลผลลัพธ์
      List<double> predictions;
      
      if (output is List<List<double>>) {
        predictions = output[0]; // หลายมิติ - ใช้ batch แรก
      } else if (output is List<double>) {
        predictions = output; // มิติเดียว
      } else {
        print('Unexpected output format: ${output.runtimeType}');
        return null;
      }
      
      print('Raw predictions: $predictions');

      String predictedClass;
      double confidence;
      double normalConfidence = 0.0;
      double scoliosisConfidence = 0.0;

      // โมเดลใช้ softmax แล้ว ไม่ต้อง normalize อีก
      if (predictions.length == 2) {
        normalConfidence = predictions[0];     // ค่าแรกคือ normal
        scoliosisConfidence = predictions[1];  // ค่าที่สองคือ scoliosis
      } else if (predictions.length == 1) {
        // Single output (sigmoid activation)
        scoliosisConfidence = predictions[0];
        normalConfidence = 1.0 - scoliosisConfidence;
      } else {
        print('Unexpected output shape: ${predictions.length}');
        return null;
      }

      // ตรวจสอบความสมเหตุสมผลของผลลัพธ์
      final confidenceDifference = (normalConfidence - scoliosisConfidence).abs();
      final maxConfidence = normalConfidence > scoliosisConfidence ? normalConfidence : scoliosisConfidence;
      
      // ถ้า confidence สูงเกินไป แต่ความแตกต่างน้อย = ไม่น่าเชื่อถือ
      if (maxConfidence > 0.85 && confidenceDifference < 0.3) {
        print('Suspicious high confidence with low difference - treating as uncertain');
        return {
          'class': 'Uncertain',
          'confidence': 0.5,
          'normal_confidence': normalConfidence,
          'scoliosis_confidence': scoliosisConfidence,
          'error': 'ผลลัพธ์มี confidence สูงผิดปกติ แนะนำให้ถ่ายภาพใหม่'
        };
      }

      if (scoliosisConfidence > normalConfidence) {
        predictedClass = "Scoliosis";
        confidence = scoliosisConfidence;
      } else {
        predictedClass = "Normal";
        confidence = normalConfidence;
      }

      print('TensorFlow Lite prediction - Normal: $normalConfidence, Scoliosis: $scoliosisConfidence');
      print('Confidence difference: $confidenceDifference');
      print('Final prediction: $predictedClass with confidence: $confidence');

      return {
        'class': predictedClass,
        'confidence': confidence,
        'normal_confidence': normalConfidence,
        'scoliosis_confidence': scoliosisConfidence,
      };
    } catch (e) {
      print('Error in TensorFlow Lite prediction: $e');
      print('Stack trace: ${e.toString()}');
      return null;
    }
  }

  // ฟังก์ชันจำแนกประเภทภาวะกระดูกสันหลังสำหรับโมเดล model_b0
  String _classifySpineConditionV2(String text, double confidence) {
    // รายการคำสำคัญสำหรับโมเดล model_b0
    final scoliosisKeywords = [
      'scoliosis', 'curved', 'curvature', 'abnormal', 'bend', 'deformed',
      'lateral', 'curve', 'spine_curved', 'spinal_curvature'
    ];
    final normalKeywords = [
      'normal', 'straight', 'healthy', 'good', 'correct', 'proper',
      'spine_normal', 'spine_straight', 'normal_spine'
    ];
    
    // ตรวจสอบคำสำคัญที่แม่นยำมากขึ้น
    if (scoliosisKeywords.any((keyword) => text.contains(keyword))) {
      return "Scoliosis";
    } else if (normalKeywords.any((keyword) => text.contains(keyword))) {
      return "Normal";
    } else if (confidence > 0.6) {
      // ถ้า confidence สูงแต่ไม่ตรงกับคำสำคัญ ให้ดูจากลักษณะของ label
      if (text.contains('0') || text.contains('class_0') || text.contains('negative')) {
        return "Normal";
      } else if (text.contains('1') || text.contains('class_1') || text.contains('positive')) {
        return "Scoliosis";
      }
    }
    
    return "Uncertain";
  }

  void showErrorDialog(String message) {
    showDialog(
      context: this.context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
            SizedBox(width: 8),
            Expanded(
              child: Text('แจ้งเตือน',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.shade700,
                  )),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message, style: TextStyle()),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '💡 หากปัญหายังคงมีอยู่ แนะนำให้ปรึกษาแพทย์เพื่อการตรวจสอบโดยตรง',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.blue.shade700,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ตกลง', style: TextStyle()),
          ),
        ],
      ),
    );
  }

  Future<String> getModelPath(String asset) async {
    final path = '${(await getApplicationSupportDirectory()).path}/$asset';
    await Directory(dirname(path)).create(recursive: true);
    final file = File(path);
    if (!await file.exists()) {
      final byteData = await rootBundle.load(asset);
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F9FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          'วิเคราะห์ภาวะกระดูกสันหลังคด',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF0BD8F3),
                Color(0xFF004aad),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Card(
              color: Colors.grey[300],
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: image == null
                        ? const Icon(Icons.image_outlined, size: 50)
                        : Image.file(
                            image!, 
                            fit: BoxFit.cover,
                            key: ValueKey(image!.path), // เพิ่ม key เพื่อ force refresh
                          ),
                  ),
                  if (isProcessing)
                    Container(
                      color: Colors.black.withOpacity(0.3),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  //ปุ่ม reset
                  if (image != null)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Material(
                        color: Colors.red.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: resetAnalysis,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  if (diagnosisType.isEmpty) ...[
                    Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200, width: 1),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt, color: Colors.blue.shade700, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'เลือกหรือถ่ายภาพ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'กรุณาถ่ายภาพบริเวณหลังในท่ายืนตรง',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
                  ] else if (diagnosisType == "Scoliosis") ...[
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        border: Border.all(color: Colors.red.shade300, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.health_and_safety, 
                               color: Colors.red, size: 48),
                          SizedBox(height: 12),
                          Text(
                            "จากผลการวิเคราะห์\nพบว่าคุณอาจมีภาวะกระดูกสันหลังคด",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "โอกาสที่คุณจะเป็นโรคนี้อยู่ที่",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${confidenceScore.toStringAsFixed(2)}%",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.medical_services, 
                                         color: Colors.red.shade700, size: 20),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'คำแนะนำ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red.shade700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "⚠️ ผลการวิเคราะห์นี้เป็นเพียงการคัดกรองเบื้องต้น\n",
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.4,
                                    color: Colors.red.shade800,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else if (diagnosisType == "Normal") ...[
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        border: Border.all(color: Colors.green.shade300, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.check_circle, 
                               color: Colors.green, size: 48),
                          SizedBox(height: 12),
                          Text(
                            "จากการวิเคราะห์ผล\nพบว่าคุณอยู่ในภาวะปกติ",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "คุณอยู่ในเกณฑ์ปกติ",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "${confidenceScore.toStringAsFixed(2)}%",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.info_outline, 
                                         color: Colors.blue.shade700, size: 20),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'ข้อควรระวัง',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "⚠️ ผลนี้เป็นการประเมินเบื้องต้นเท่านั้น\n"
                                  "🏥 หากมีอาการปวดหลัง ควรปรึกษาแพทย์\n"
                                  "🏃‍♂️ รักษาสุขภาพด้วยการออกกำลังกายสม่ำเสมอ\n",
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.4,
                                    color: Colors.blue.shade800,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciseScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(32),
                                    bottom: Radius.circular(32),
                                  ),
                                  child: Image.asset(
                                    'assets/img/slide2.jpg',
                                    height: 150,
                                    width: 175,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'การกายภาพ\nบำบัดด้วยตนเอง',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ExerciseScreen()),
                                        );
                                      },
                                      child: Text(
                                        'ข้อมูลเพิ่มเติม >',
                                        style: TextStyle(
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ] else if (diagnosisType == "ไม่สามารถวิเคราะห์ได้") ...[
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        border: Border.all(color: Colors.orange.shade300, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.error_outline, 
                               color: Colors.orange, size: 48),
                          SizedBox(height: 12),
                          Text(
                            "ไม่สามารถวิเคราะห์ได้",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            diagnosisResult,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "คำแนะนำการถ่ายภาพ:",
                                  style: TextStyle(
                                      fontSize: 16, 
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange.shade800),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "• ถ่ายรูปบริเวณหลังให้เห็นกระดูกสันหลังชัดเจน\n"
                                  "• ควรมีแสงสว่างเพียงพอ\n"
                                  "• ถ่ายรูปในท่ายืนตรง มองเห็นแนวกระดูกสันหลังทั้งหมด\n"
                                  "• หลีกเลี่ยงการสวมเสื้อหนาหรือมีลวดลาย\n"
                                  "• ยืนให้ตรงและผ่อนคลาย",
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.4,
                                    color: Colors.orange.shade800,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 12),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    "⚠️ หากยังคงไม่สามารถวิเคราะห์ได้หลังจากปรับปรุงภาพแล้ว แนะนำให้ปรึกษาแพทย์โดยตรง",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade800,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else if (diagnosisType == "Uncertain") ...[
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        border: Border.all(color: Colors.amber.shade300, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.help_outline, 
                               color: Colors.amber.shade700, size: 48),
                          SizedBox(height: 12),
                          Text(
                            "ไม่สามารถวิเคราะห์ได้ชัดเจน",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            diagnosisResult,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.priority_high, 
                                         color: Colors.amber.shade700, size: 20),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'คำแนะนำ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber.shade700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "ลองถ่ายภาพใหม่ในสภาพแสงที่ดีกว่า\n"
                                  "ตรวจสอบท่าทางให้ยืนตรง\n"
                                  "หากยังไม่แน่ใจ ควรปรึกษาแพทย์\n"
                                  "⚠️ อย่าพึ่งพาผลการวิเคราะห์นี้เพียงอย่างเดียว",
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.4,
                                    color: Colors.amber.shade800,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: FaIcon(
                        FontAwesomeIcons.image,
                        size: 50,
                        color: isProcessing ? Colors.grey : Colors.black,
                      ),
                    ),
                    onTap: isProcessing ? null : chooseImage,
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(36),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Ionicons.ios_camera_sharp,
                        size: 50,
                        color: isProcessing ? Colors.grey : Colors.black,
                      ),
                    ),
                    onTap: isProcessing ? null : captureImage,
                  ),
                ],
              ),
            ),
            // เพิ่มคำเตือนท้ายหน้า
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: Column(
                children: [
                  Text(
                    'ข้อจำกัดของการวิเคราะห์',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• ไม่สามารถทดแทนการตรวจ X-ray\n'
                    '• การวินิจฉัยที่แน่นอนต้องอาศัยการตรวจของแพทย์',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.4,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
