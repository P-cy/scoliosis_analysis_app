import 'package:flutter/material.dart';
import 'package:scoliosis_analysis_app/pages/first_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FirstScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}




