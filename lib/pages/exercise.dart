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
    'detail': 'รายละเอียดท่าเหยียดลำตัวไปด้านข้าง : ยืนในท่าตรงกางขาออกให้เท้าห่างกันประมาณระดับไหล่ ยกเเขนชนวาขึ้นเยียดตรงขึ้นไปเหนือศีรษะ เเละวางไว้ขางมือซ้ายไว้ข้างลำตัวหรือเอว ค่อยๆเอียงลำตัวไปทางซ้าย พร้อมเหยียดเเขนขวาให้ตึงตามไปด้วย ทำค้างไว้ประมาณ 10-15 วินาที เเล้วค่อยๆกลับมาท่าตรง เเละสลับมาทำอีกด้าน ',
    'image': 'assets/img/1.png',
  },
  {
    'title': 'ท่าที่ 2 : ท่าบิดลำตัวไปด้านข้าง',
    'description': 'ช่วยยืดกล้ามเนื้อหลังส่วนล่างเเละกระดูกสันหลัง',
    'detail': 'รายละเอียดเต็มของท่าที่ 2 : นั่งขัดสมาธิ เหยียดขาซ้ายตรง แล้วงอขาขวาขึ้นมาวางฝ่าเท้าขวาไว้ที่ด้านนอกของเข่าซ้าย หมุนลำตัวไปทางขวา โดยใช้มือซ้ายจับเข่าขวาไว้ และใช้มือขวาวางไว้ด้านหลังเพื่อช่วยในการบิด สูดหายใจเข้า ยืดกระดูกสันหลังในยาวขณะบิดลำตัวไปทางขวา ค้างไว้ประมาณ 10-15 วินาที เเล้วสลับมาทำอีกด้าน ',
    'image': 'assets//img/1.png',
  },
  {
    'title': 'ท่าที่ 3 : ท่ายืนตรงกางเเขน',
    'description': 'ช่วยยืดกล้ามเนื้อหลัง',
    'detail': 'รายละเอียดเต็มของท่าที่ 3 : ยืนตรงเเยกเท้าออกเล็กน้อยให้มั่นคง กางเเขนให้เเขนทั้งสอนขนานกับพื้นโดยให้ฝ่ามือหันออกไปทางข้างหน้า ยืดหน้าอกไปข้างหน้า พร้อมกดไหล่ให้ต่ำลงเเละดึกกระดูกสะบักมาด้านหลัง ค้างไว้ 15-20 วินาที หายใจเข้า-ออกลึกๆ เเล้วค่อยๆผ่อนคลาย',
    'image': 'assets//img/1.png',
  },
  {
    'title': 'ท่าที่ 4 : ท่าปรับเเนวกระดูกสันหลังส่วนบน',
    'description': 'ช่วยยืดกล้ามเนื้อหลัง',
    'detail': 'รายละเอียดเต็มของท่าที่ 4 : คุกเขา วางเข่าเเละมือบนพื้นโดยให้เข้าอยู่ใต้สะโพกเเละมืออยู่ใต้ไหล่ ยกมือซ้ายขึ้นให้แขนเหยียดขึ้นไปข้างบน และบิดลำตัวไปทางด้านซ้าย เปิดลำตัวให้หน้าอกหันไปด้านข้างพร้อมมองไปที่มือซ้าย ค้างไว้ประมาณ 10-15 วินาที แล้วค่อยกลับสู่ท่าเริ่มต้น เเล้วสลับมาทำอีกด้าน',
  },
  {
    'title': 'ท่าที่ 5 : ท่าโก่งหลัง',
    'description': 'ช่วยลดความตึงเครียดขอกล้ามเนื้อหลังเเละไหล่',
    'detail': 'รายละเอียดเต็มของท่าที่ 5 : คุกเข่าบนพื้น วางมือและเข่าลงบนพื้นโดยให้มืออยู่ใต้ไหล่ เเละเข่าอยู่ใต้สะโพก หายใจเข้า เเละขณะหายใจออกให้โก่งหลังขึ้นยกสะโพกเเละท้องเข้าไปหาหน้าท้อง และก้มศีรษะลงให้คางจรดอก ทำค้างไว้ก่อนหายใจเข้าเเล้วผ่อนคลาย  ',
    'image': 'assets//img/1.png',
  },
  {
    'title': 'ท่าที่ 6 : ท่าเเอ่นหลัง',
    'description': 'ช่วยยืดกล้ามเนื้อท้องและกระดูกสันหลัง',
    'detail': 'รายละเอียดเต็มของท่าที่ 6 : เริ่มด้วยท่าคุกเข่าบนพื้น วางมือและเข่าลงบนพื้นโดยให้มืออยู่ใต้ไหล่ เเละเข่าอยู่ใต้สะโพก หายใจเข้า แอ่นหลังลง กดสะโพกไปด้านหลัง และยกหน้าอกขึ้น ยืดคอขึ้นมองตรงไปข้างหน้า ',
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
