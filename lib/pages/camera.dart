import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? image;
  late ImagePicker imagePicker;
  late ImageLabeler labeler;
  String results = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    // ImageLabelerOptions options = ImageLabelerOptions(confidenceThreshold: 0.6);
    // labeler = ImageLabeler(options: options);
    loadModel();
  }

  //โหลดโมเดลในโฟลเดอร์ assets/ml/ เข้ามาใช้งาน
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
    results = "";
    InputImage inputImage = InputImage.fromFile(image!);

    final List<ImageLabel> labels = await labeler.processImage(inputImage);

    for (ImageLabel label in labels) {
      final String text = label.label;
      // ignore: unused_local_variable
      final int index = label.index;
      final double confidence = label.confidence;
      // print("$text   $confidence");
      results += "$text   ${confidence.toStringAsFixed(2)}\n";
    }

    setState(() {
      results;
    });
  }

  //ตั้งค่าการเข้าถึงตำแหน่งของโมเดลที่เทรนไว้
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
      extendBodyBehindAppBar: true,
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
                  color: Colors.grey,
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
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
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      results,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
