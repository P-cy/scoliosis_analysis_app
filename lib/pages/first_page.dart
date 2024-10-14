import 'package:flutter/material.dart';
import 'package:scoliosis_analysis_app/pages/camera.dart';
import 'package:scoliosis_analysis_app/pages/exercise.dart';
import 'package:scoliosis_analysis_app/pages/infomation.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  int _selectedIndex = 1;

  void navBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget>  pages = [
    InformationScreen(),
    CameraScreen(),
    ExerciseScreen(),
  ];

  final List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(icon: Icon(Icons.inbox_rounded,color: Colors.black),title: 'ข้อมูล',textStyle: TextStyle(color: Colors.black),activeColorPrimary: Colors.green.shade300),
    PersistentBottomNavBarItem(icon: Icon(Icons.camera_alt_outlined,color: Colors.black),title: 'วิเคราะห์',textStyle: TextStyle(color: Colors.black),activeColorSecondary: Colors.green.shade300,activeColorPrimary: Colors.green.shade300),
    PersistentBottomNavBarItem(icon: Icon(Icons.directions_walk_sharp,color: Colors.black),title: 'กายภาพ',textStyle: TextStyle(color: Colors.black),activeColorPrimary: Colors.green.shade300),
  ];

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scoliosis'),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: PersistentTabView(
        context, 
        screens: pages,
        items: items,
        decoration: NavBarDecoration(borderRadius: BorderRadius.circular(1)),
        navBarStyle: NavBarStyle.style15,
        
        
        ),
        
    );
  }
}
