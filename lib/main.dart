import 'package:flutter/material.dart';
import 'package:scoliosis_analysis_app/pages/first_page.dart';
import 'package:scoliosis_analysis_app/pages/home_page.dart';
import 'package:scoliosis_analysis_app/pages/warning_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.green,
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
              return const FirstScreen();
            } else {
              return const WarningScreen();
            }
          },
        ),
        debugShowCheckedModeBanner: false);
  }
}
