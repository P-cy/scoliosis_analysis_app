import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoliosis_analysis_app/pages/camera_page.dart';
import 'package:scoliosis_analysis_app/pages/exercise_page.dart';
import 'package:scoliosis_analysis_app/pages/home_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    InformationScreen(),
    CameraScreen(),
    ExerciseScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          onPressed: () {
            setState(() {
              _currentIndex = 1;
            });
          },
          child: const Icon(
            FontAwesomeIcons.camera,
            size: 45,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              icon: const Icon(FontAwesomeIcons.home),
              color: _currentIndex == 0 ? Colors.blue : Colors.grey,
              iconSize: 30,
            ),
            SizedBox(width: 20),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              icon: const Icon(FontAwesomeIcons.personWalking),
              color: _currentIndex == 2 ? Colors.blue : Colors.grey,
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }
}
