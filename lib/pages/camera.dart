import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoliosis_analysis_app/pages/exercise.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? image;
  late ImagePicker imagePicker;
  late ImageLabeler labeler;
  String diagnosisResult = ''; // ข้อความแสดงผล AI
  double confidenceScore = 0.0; // ค่าความมั่นใจของ AI
  String diagnosisType = ""; // ระบุว่าเป็น "Scoliosis" หรือ "Normal"

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    ImageLabelerOptions options = ImageLabelerOptions(confidenceThreshold: 0.6);
    labeler = ImageLabeler(options: options);
    loadModel();
  }

  // โหลดโมเดลที่เทรนไว้
  loadModel() async {
    final modelPath = await getModelPath('assets/ml/scoliosis_model.tflite');
    final options = LocalLabelerOptions(
      confidenceThreshold: 0.6,
      modelPath: modelPath,
    );
    labeler = ImageLabeler(options: options);
  }

  chooseImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      image = File(selectedImage.path);
      performImageLabeling();
      setState(() {
        image;
      });
    }
  }

  captureImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      image = File(selectedImage.path);
      performImageLabeling();
      setState(() {
        image;
      });
    }
  }

  performImageLabeling() async {
    diagnosisResult = "";
    confidenceScore = 0.0;
    diagnosisType = "";

    InputImage inputImage = InputImage.fromFile(image!);
    final List<ImageLabel> labels = await labeler.processImage(inputImage);

    for (ImageLabel label in labels) {
      final String text = label.label.toLowerCase(); // แปลงเป็นตัวพิมพ์เล็ก
      final double confidence = label.confidence * 100; // แปลงเป็น %

      if (text.contains("scoliosis")) {
        confidenceScore = confidence;
        diagnosisType = "Scoliosis";
      } else if (text.contains("normal")) {
        confidenceScore = confidence;
        diagnosisType = "Normal";
      }
    }

    setState(() {});
  }

  // ดึงโมเดลจาก assets
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  color: Colors.grey[300],
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: image == null
                        ? const Icon(
                            Icons.image_outlined,
                            size: 50,
                          )
                        : Image.file(image!),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        if (diagnosisType.isEmpty) ...[
                          const Text(
                            "สแกน เพื่อดูผลลัพธ์",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ] else if (diagnosisType == "Scoliosis") ...[
                          Text(
                            "จากผลการวิเคราะห์\nพบว่าคุณอาจมีภาวะกระดูกสันหลังคด",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
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
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "เพื่อความแน่ใจและการวินิจฉัยที่ถูกต้อง\n"
                            "แนะนำให้คุณศึกษาข้อมูลเพิ่มเติมเกี่ยวกับภาวะนี้ค่ะ",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ] else if (diagnosisType == "Normal") ...[
                          Text(
                            "จากการวิเคราะห์\nผลแสดงให้เห็นว่าคุณอยู่ในภาวะปกติ",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
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
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "ถึงแม้ผลจะอยู่ในเกณฑ์ปกติ แต่การดูแลสุขภาพ\nหลังของคุณยังเป็นสิ่งสำคัญ"
                            "คุณควรป้องกันและ\nรักษาสุขภาพตามคำแนะนำต่อไปนี้ค่ะ",
                            style: TextStyle(fontSize: 16),
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
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  ),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'การกายภาพ\nบำบัดด้วยตนเอง',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
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
                                              style:
                                                  TextStyle(color: Colors.blue),
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
                        ],
                      ],
                    ),
                  ),
                ),
                // ปุ่มเลือกภาพและถ่ายภาพ
                Card(
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.image_outlined,
                            size: 50,
                          ),
                          onTap: () {
                            chooseImage();
                          },
                        ),
                        InkWell(
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 50,
                          ),
                          onTap: () {
                            captureImage();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
