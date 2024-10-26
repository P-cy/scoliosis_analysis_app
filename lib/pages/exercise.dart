import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/exercise_screen.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

final List<Map<String, String>> exercises = [
  {
    'title': 'ท่าที่ 1: การยืดกล้ามเนื้อหลัง',
    'description': 'ท่านี้ช่วยยืดกล้ามเนื้อหลังและสะโพก',
    'detail': 'รายละเอียดเต็มของท่าที่ 1...',
    'image': 'assets/img/1.png',
  },
  {
    'title': 'ท่าที่ 2: ท่ายืดสะโพก',
    'description': 'ช่วยลดอาการตึงของกล้ามเนื้อสะโพก',
    'detail': 'รายละเอียดเต็มของท่าที่ 2...',
    'image': 'assets//img/1.png',
  },
];

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ท่ากายภาพบำบัด',
          style: GoogleFonts.ibmPlexSansThai(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Color(0xFF0AC174),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final exercise = exercises[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.asset(
                      exercise['image']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      exercise['title']!,
                      style: GoogleFonts.ibmPlexSansThai(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      exercise['description']!,
                      style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF0AC174),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExerciseDetailScreen(
                            title: exercise['title']!,
                            detail: exercise['detail']!,
                            image: exercise['image']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              childCount: exercises.length,
            ),
          ),
        ],
      ),
    );
  }
}
