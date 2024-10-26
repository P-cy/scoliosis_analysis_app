import 'dart:io';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
    ImageLabelerOptions options = ImageLabelerOptions(confidenceThreshold: 0.6);
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

  String results = "";
  performImageLabeling() async {
    results = "";
    InputImage inputImage = InputImage.fromFile(image!);

    final List<ImageLabel> labels = await labeler.processImage(inputImage);

    for (ImageLabel label in labels) {
      final String text = label.label;
      // ignore: unused_local_variable
      final int index = label.index;
      final double confidence = label.confidence;
      print(text + "   " + confidence.toString());
      results += text + "   " + confidence.toStringAsFixed(2) + "\n";
    }

    setState(() {
      results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0AC174),
        title: Text(
          "วิเคราะห์",
          style: GoogleFonts.ibmPlexSansThai(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  color: Colors.grey,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: image == null
                        ? Icon(
                            Icons.image_outlined,
                            size: 50,
                          )
                        : Image.file(image!),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.image_outlined,
                            size: 50,
                          ),
                          onTap: () {
                            chooseImage();
                          },
                        ),
                        InkWell(
                          child: Icon(
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
                    child: Container(
                  child: Text(results,style: TextStyle(fontSize: 24),),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                ),
                margin: EdgeInsets.all(10),
              ),
              ]),
        ),
      ),
    );
  }
}
