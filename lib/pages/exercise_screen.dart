import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final String title;
  final String detail;
  final String image;

  ExerciseDetailScreen({
    required this.title,
    required this.detail,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.ibmPlexSansThai(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Color(0xFF0AC174),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                title,
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0AC174),
                ),
              ),
              SizedBox(height: 16),
              Text(
                detail,
                style: GoogleFonts.ibmPlexSansThai(fontSize: 18, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
