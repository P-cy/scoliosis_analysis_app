import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? image;
  late ImagePicker imagePicker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
  }

  chooseImage() async {
    XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      image = File(selectedImage.path);
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
      setState(() {
        image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0AC174),
        title: Text("วิเคราะห์"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              image == null
                  ? Icon(
                      Icons.image_outlined,
                      size: 50,
                    )
                  : Image.file(image!),
              ElevatedButton(
                  onPressed: () {
                    chooseImage();
                  },
                  onLongPress: () {
                    captureImage();
                  },
                  child: Text("เลือกรูปภาพ"))
            ]),
      ),
    );
  }
}
