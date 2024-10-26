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
  int _selectedIndex = 0;

  void navBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    InformationScreen(),
    CameraScreen(),
    ExerciseScreen(),
  ];

  final List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.inbox_rounded,size: 30,),
      title: 'ข้อมูล',
      textStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),inactiveColorPrimary: Colors.black,activeColorPrimary: Colors.green
    ),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.camera_alt_outlined,size: 30,color: Colors.white,),
        title: 'วิเคราะห์',
        textStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),inactiveColorPrimary: Colors.black,activeColorPrimary: Colors.green),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.directions_walk_sharp,size: 30,),
      title: 'กายภาพ',
      textStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),inactiveColorPrimary: Colors.black,activeColorPrimary: Colors.green
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: PersistentTabView(
        context,
        screens: pages,
        items: items,
        decoration: NavBarDecoration(borderRadius: BorderRadius.circular(1)),
        navBarStyle: NavBarStyle.style15,
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        padding: const EdgeInsets.only(top: 8),
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
          ),
        ),
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight,
      ),
    );
  }
}
