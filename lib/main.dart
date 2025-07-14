import 'package:flutter/material.dart';
import 'package:scoliosis_analysis_app/screens/home_screen.dart';
import 'package:scoliosis_analysis_app/pages/warning_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'วิเคราะห์กระดูกสันหลังคด',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Roboto',
        ),
        home: FutureBuilder<bool>(
          future: checkDisclaimerAccepted(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final bool disclaimerAccepted = snapshot.data ?? false;

            if (disclaimerAccepted) {
              return const HomeScreen();
            } else {
              return const WarningScreen();
            }
          },
        ),
        debugShowCheckedModeBanner: false);
  }
}

Future<bool> checkDisclaimerAccepted() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('disclaimer_accepted') ?? false;
}
