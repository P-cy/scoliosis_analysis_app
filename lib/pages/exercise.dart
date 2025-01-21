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
    'title': 'ท่าที่ 1 : ท่าเหยียดลำตัวไปด้านข้าง',
    'description': 'ช่วยยืดกล้ามเนื้อด้านข้างลำตัวเเละสะโพก',
    'detail':
        '       แยกขาเท่าความกว้างของไหล่ ยกแขนข้างหนึ่งขึ้นเหนือศีรษะแล้วเอนตัวไปด้านข้าง ข้างใดข้างหนึ่ง เอนไปจนเริ่มรู้สึกตึงทำค้างไว้ประมาณ 10 วินาที ทำทั้งสองข้างซ้ายขวา ข้างละ 10 ครั้งต่อเซต ทำวันละ  2-3 เซต',
    'image1': 'assets/img/1.PNG',
    'image2': 'assets/img/11.PNG',
  },
  {
    'title': 'ท่าที่ 2 : ท่าบิดลำตัวไปด้านข้าง',
    'description':
        'ช่วยยืดกล้ามเนื้อหลังส่วนบนและล่าง กล้ามเนื้อด้านข้างลำตัว กล้ามเนื้อหัวไหล่เเละเเขน กล้ามเนื้อสะโพกและเอว',
    'detail':
        '       ยืนตรงกางแขนออกสองข้าง บิดลำตัวไปด้านข้างให้สุดจนรู้สึกตึง ค้างไว้ในท่าบิดตัวข้าง 10 วินาที ทำทั้งสองข้างซ้ายขวา ข้างละ 10 ครั้งต่อเซต ทำวันละ  2-3 เซต',
    'image1': 'assets/img/23.PNG',
    'image2': 'assets/img/2.PNG',
  },
  {
    'title': 'ท่าที่ 3 : ท่ายืนตรงกางเเขน',
    'description':
        'ช่วยยืดกล้ามเนื้อหัวไหล่ กล้ามเนื้อหน้าอก กล้ามเนื้อแขนเเละข้อมือ กล้ามเนื้อหลังส่วนบน',
    'detail':
        '       ยืนตรงกางแขนออกทั้งสองข้าง ผ่อนคลายหน้าอกอย่าเกร็งและกางแขนไปด้านข้างให้มากเท่าที่จะทำได้  ค้างไว้ในท่ากาง10 วินาทีทำ 10 ครั้งต่อเซต ทำวันละ  2-3 เซต',
    'image1': 'assets/img/23.PNG',
    'image2': 'assets/img/IMG_2009.PNG'
  },
  {
    'title': 'ท่าที่ 4 : ท่าปรับเเนวกระดูกสันหลังส่วนบน',
    'description': 'ช่วยยืดกล้ามเนื้อบริเวณกระดูกสันหลังส่วนบนเเละไหล่',
    'detail':
        '       อยู่ในท่าคลาน งอศอกขึ้นให้ระดับมือวางไว้ที่ใบหูเอียงตัวไปข้างให้รู้สึกตึงบริเวณกลางหลังส่วนบน ค้างไว้ 10 วินาที ทำทั้งสองข้างซ้ายขวา ข้างละ 10 ครั้งต่อเซต ทำวันละ  2-3 เซต',
    'image1': 'assets/img/4.PNG',
    'image2': 'assets/img/44.PNG',
  },
  {
    'title': 'ท่าที่ 5: ท่าโก่งหลังและแอ่นหลัง',
    'description':
        'ช่วยลดความตึงเครียดของกล้ามเนื้อหลังเเละไหล่ ช่วยยืดกล้ามเนื้อท้องและกระดูกสันหลัง',
    'detail':
        '       อยู่ในท่าคลานค่อยๆแขม่วท้องโก่งหลังขึ้นให้ได้มากที่สุด ค้างไว้ 10 วินาที และค่อยๆผ่อนหลังลงแอ่นหลังให้ได้มากที่สุด ค้างไว้ 10 วินาที โก่งหลังและแอ่นนับ 1 ครั้ง ทำ 10 ครั้งต่อเซต ทำวันละ  2-3 เซต',
    'image1': 'assets/img/5.PNG',
    'image2': 'assets/img/55.PNG',
  },
  {
    'title': 'ท่าที่ 6: ยกแขนขาสลับ',
    'description':
        'ช่วยยืดกล้ามเนื้อหลังส่วนล่างและกลางลำตัว กล้ามเนื้อสะโพก ก้น แขน และไหล่',
    'detail':
        '       อยู่ในท่าคลานและยกแขนซ้ายไปข้างหน้าเหยียดขาขวาไปด้านหลังให้ตรงเท่าที่ทำได้ ค้างไว้ 10 วินาที สลับข้าง ทำทั้งสองข้าง ข้างละ 10 ครั้งต่อเซต ทำวันละ  2-3 เซต',
    'image1': 'assets/img/6.PNG',
    'image2': 'assets/img/4.PNG'
  },
];

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0BD8F3), Color(0xFF004aad)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.close, color: Colors.black),
                    ),
                  ),
                  Text(
                    'ท่ากายภาพ',
                    style: GoogleFonts.ibmPlexSansThai(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF74AEEF), Color(0xFF4B88D2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            exercises[index]['image1']!,
                            width: 70,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          exercises[index]['title']!,
                          style: GoogleFonts.ibmPlexSansThai(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          exercises[index]['description']!,
                          style: GoogleFonts.ibmPlexSansThai(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciseDetailScreen(
                                title: exercises[index]['title']!,
                                detail: exercises[index]['detail']!,
                                image1: exercises[index]['image1']!,
                                image2: exercises[index]['image2']!,
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
      ),
    );
  }
}
