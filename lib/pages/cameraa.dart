// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({super.key});

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// Future<void> loadModel() async {
//   String? res = await Tflite.loadModel(
//     model: 'assets/ml/scoliosis.tflite', 
//     labels: 'assets/labels.txt',
//   );
// }
// Future<void> predictImage() async {
//   final picker = ImagePicker();
//   final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     var imageBytes = await pickedFile.readAsBytes();
//     var input = imageBytes; 
//     var output = await Tflite.runModelOnImage(
//       image: input,
//       imageMean: 127.5,
//       imageStd: 127.5,
//       numResults: 5,
//       threshold: 0.2,
//     );

//   }
// }

// class _CameraScreenState extends State<CameraScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
