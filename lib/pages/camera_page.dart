import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:scoliosis_analysis_app/pages/exercise_page.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? image;
  late ImagePicker imagePicker;
  late ImageLabeler labeler;
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
    super.dispose();
  }

  Future<void> loadModel() async {
    try {
      final modelPath =
          await getModelPath('assets/ml/scoliosis_analysis_model.tflite');
      labeler = ImageLabeler(
        options: LocalLabelerOptions(
          confidenceThreshold: 0.7,
          modelPath: modelPath,
        ),
      );
    } catch (e) {
      print('Error loading model: $e');
      showErrorDialog('ไม่สามารถโหลดโมเดล AI ได้ กรุณาลองใหม่อีกครั้ง');
    }
  }

  Future<void> chooseImage() async {
    try {
      // เคลียร์ข้อมูลเ
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
        setState(() {
          image = File(selectedImage.path);
        });

        await processAndAnalyzeImage(image!);
      } else {
        setState(() {
          isProcessing = false;
        });
      }
    } catch (e) {
      print('Error choosing image: $e');
      showErrorDialog('เกิดข้อผิดพลาดในการเลือกรูปภาพ');
      setState(() {
        isProcessing = false;
      });
    }
  }

  Future<void> captureImage() async {
    try {
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
        setState(() {
          image = File(selectedImage.path);
        });

        await processAndAnalyzeImage(image!);
      } else {
        setState(() {
          isProcessing = false;
        });
      }
    } catch (e) {
      print('Error capturing image: $e');
      showErrorDialog('เกิดข้อผิดพลาดในการถ่ายรูป');
      setState(() {
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
        await performImageLabeling();
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

      final width = 224;
      final height = 224;

      final resizedImage = img.copyResize(originalImage,
          width: width,
          height: height,
          interpolation: img.Interpolation.average);

      final directory = await getApplicationDocumentsDirectory();
      final processedImagePath = '${directory.path}/processed_spine_image.png';
      final processedImageFile = File(processedImagePath);

      await processedImageFile.writeAsBytes(img.encodePng(resizedImage));

      return processedImageFile;
    } catch (e) {
      print('Error preprocessing image: $e');
      return null;
    }
  }

  void setNoSpineFoundResult() {
    setState(() {
      diagnosisType = "ไม่พบกระดูกสันหลัง";
      diagnosisResult =
          "AI ไม่สามารถวิเคราะห์กระดูกสันหลังได้ กรุณาตรวจสอบรูปภาพอีกครั้ง หรือถ่ายภาพใหม่ที่ชัดเจนกว่านี้";
      confidenceScore = 0.0;
    });
  }

  Future<void> performImageLabeling() async {
    try {
      diagnosisResult = "";
      confidenceScore = 0.0;
      diagnosisType = "";

      InputImage inputImage = InputImage.fromFile(image!);
      final List<ImageLabel> labels = await labeler.processImage(inputImage);

      bool foundDiagnosis = false;
      double highestConfidence = 0.0;
      String bestDiagnosis = "";

      for (ImageLabel label in labels) {
        final String text = label.label.toLowerCase();
        final double confidence = label.confidence;

        if (text.contains("scoliosis") || text.contains("normal")) {
          if (confidence > highestConfidence) {
            highestConfidence = confidence;

            if (text.contains("scoliosis")) {
              bestDiagnosis = "Scoliosis";
            } else if (text.contains("normal") || text.contains("healthy")) {
              bestDiagnosis = "Normal";
            } else {
              // กรณีเจอกระดูกสันหลังแต่ไม่ชัดเจนว่าปกติหรือผิดปกติ
              bestDiagnosis = "Uncertain";
            }

            foundDiagnosis = true;
          }
        }
      }

      // ตั้งค่าผลวิเคราะห์
      if (foundDiagnosis) {
        diagnosisType = bestDiagnosis;
        confidenceScore = highestConfidence * 100;

        if (bestDiagnosis == "Uncertain") {
          diagnosisResult =
              "พบกระดูกสันหลัง แต่ไม่สามารถวิเคราะห์ได้ชัดเจน กรุณาถ่ายภาพใหม่";
        }
      } else {
        // ไม่พบข้อมูลเกี่ยวกับกระดูกสันหลังเลย
        setNoSpineFoundResult();
      }

      setState(() {});
    } catch (e) {
      print('Error performing image labeling: $e');
      setNoSpineFoundResult();
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: this.context,
      builder: (context) => AlertDialog(
        title: Text('แจ้งเตือน',
            style: GoogleFonts.sarabun(fontWeight: FontWeight.bold)),
        content: Text(message, style: GoogleFonts.sarabun()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ตกลง', style: GoogleFonts.sarabun()),
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          'วิเคราะห์กระดูกสันหลัง',
          style: GoogleFonts.sarabun(
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
                        : Image.file(image!, fit: BoxFit.cover),
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
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  if (diagnosisType.isEmpty) ...[
                    Text(
                      "เลือกรูป/ถ่ายภาพเพื่อดูผลลัพธ์",
                      style: GoogleFonts.sarabun(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ] else if (diagnosisType == "Scoliosis") ...[
                    Text(
                      "จากผลการวิเคราะห์\nพบว่าคุณอาจมีภาวะกระดูกสันหลังคด",
                      style: GoogleFonts.sarabun(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "โอกาสที่คุณจะเป็นโรคนี้อยู่ที่",
                      style: GoogleFonts.sarabun(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${confidenceScore.toStringAsFixed(2)}%",
                      style: GoogleFonts.sarabun(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "เพื่อความแน่ใจและการวินิจฉัยที่ถูกต้อง\nแนะนำให้คุณศึกษาข้อมูลเพิ่มเติมเกี่ยวกับภาวะนี้ค่ะ",
                      style: GoogleFonts.sarabun(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ] else if (diagnosisType == "Normal") ...[
                    Text(
                      "จากการวิเคราะห์\nผลแสดงให้เห็นว่าคุณอยู่ในภาวะปกติ",
                      style: GoogleFonts.sarabun(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "คุณอยู่ในเกณฑ์ปกติ",
                      style: GoogleFonts.sarabun(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${confidenceScore.toStringAsFixed(2)}%",
                      style: GoogleFonts.sarabun(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "ถึงแม้ผลจะอยู่ในเกณฑ์ปกติ แต่การดูแลสุขภาพ\nหลังของคุณยังเป็นสิ่งสำคัญ",
                      style: GoogleFonts.sarabun(fontSize: 16),
                      textAlign: TextAlign.center,
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
                                      style: GoogleFonts.sarabun(
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
                                        style: GoogleFonts.sarabun(
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
                  ] else if (diagnosisType == "ไม่พบกระดูกสันหลัง") ...[
                    Text(
                      "ไม่พบกระดูกสันหลังในรูปภาพ",
                      style: GoogleFonts.sarabun(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      diagnosisResult,
                      style: GoogleFonts.sarabun(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "คำแนะนำ:",
                      style: GoogleFonts.sarabun(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "1. ถ่ายรูปบริเวณหลังให้เห็นกระดูกสันหลังชัดเจน\n"
                      "2. ควรมีแสงสว่างเพียงพอ\n"
                      "3. ถ่ายรูปในท่ายืนตรง มองเห็นแนวกระดูกสันหลังทั้งหมด",
                      style: GoogleFonts.sarabun(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ] else if (diagnosisType == "Uncertain") ...[
                    Text(
                      "ไม่สามารถวิเคราะห์ได้ชัดเจน",
                      style: GoogleFonts.sarabun(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      diagnosisResult,
                      style: GoogleFonts.sarabun(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
            // Button to select or capture image
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
          ],
        ),
      ),
    );
  }
}
