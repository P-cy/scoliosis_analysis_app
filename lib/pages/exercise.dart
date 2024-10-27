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
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF74AEEF), Color(0xFF4B88D2)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        exercises[index]['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        exercises[index]['title']!,
                        style: GoogleFonts.ibmPlexSansThai(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        exercises[index]['description']!,
                        style: GoogleFonts.ibmPlexSansThai(
                            fontSize: 16, color: Colors.white70),
                      ),
                      trailing: Icon(
                        Icons.format_align_justify_rounded,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailScreen(
                              title: exercises[index]['title']!,
                              detail: exercises[index]['detail']!,
                              image: exercises[index]['image']!,
                            ),
                          ),
                        );
                      },
                    ),
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
