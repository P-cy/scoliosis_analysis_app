// ignore_for_file: deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/healthcard_widget.dart';
import 'package:scoliosis_analysis_app/pages/exercise_page.dart';
import 'package:scoliosis_analysis_app/pages/hospital_page.dart';
import 'package:scoliosis_analysis_app/pages/url_widget.dart';

class RiskGuidelinesScreen extends StatefulWidget {
  const RiskGuidelinesScreen({super.key});

  @override
  State<RiskGuidelinesScreen> createState() => _GuidelinesScreenState();
}

class _GuidelinesScreenState extends State<RiskGuidelinesScreen> {
  @override
  Widget build(BuildContext context) {
    final references = [
      ReferenceItem(
        linkText: 'กระดูกสันหลังคดกายภาพ',
        url: Uri.parse(
            'https://www.sarirarak.com/single-post/กระดูกสันหลังคดกายภาพ'),
        copyright: 'Copyright © 2022 Sarirarak Co.,.Ltd.',
      ),
      ReferenceItem(
        linkText: 'สิ่งที่ควรทำและไม่ควรทำสำหรับผู้ป่วยกระดูกสันหลังคด',
        url: Uri.parse(
            'https://www.vejthani.com/th/2021/12/%e0%b8%aa%e0%b8%b4%e0%b9%88%e0%b8%87%e0%b8%97%e0%b8%b5%e0%b9%88%e0%b8%84%e0%b8%a7%e0%b8%a3%e0%b8%97%e0%b8%b3%e0%b9%81%e0%b8%a5%e0%b8%b0%e0%b9%84%e0%b8%a1%e0%b9%88%e0%b8%84%e0%b8%a7%e0%b8%a3%e0%b8%97/'),
        copyright:
            '© Vejthani Hospital | JCI Accredited International Hospital in Bangkok, Thailand',
      ),
    ];
    return Scaffold(
      backgroundColor: Color(0xFFF5F9FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 60,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF0BD8F3),
                Color(0xFF004aad),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildIntroduction(),
                _buildSection(
                  '1. ผลที่เกิดขึ้นเมื่อเป็นกระดูกสันหลังคด',
                  [
                    _buildSubsection(
                      'ผลกระทบต่อกล้ามเนื้อและร่างกาย',
                      [
                        'สำหรับในผู้ที่มีกระดูกสันหลังคดนั้น การกระจายน้ำหนักเวลาทำกิจกรรมต่างๆนั้นจะเกิดความไม่สมดุลเท่าที่ควร ดังนั้นร่างกายจะพยายามปรับสมดุลโดยการให้กล้ามเนื้อส่วนแกนกลางของร่างกายไม่ว่าจะเป็นกล้ามเนื้อหลัง กล้ามเนื้อหน้าท้อง มาช่วยพยุง และรับน้ำหนัก ส่งผลให้อาจะเกิดอาการปวด และอักเสบของกล้ามเนื้ออย่างเรื้อรังได้นั่นเอง',
                      ],
                    ),
                    _buildSubsection(
                      'กิจกรรมที่ควรหลีกเลี่ยง',
                      [
                        'การยกของหนัก',
                        'การที่จะต้องอยู่ในท่าทางเดิมซ้ำๆ นานๆ เช่น นั่งนาน ยืนนาน',
                        'กิจกรรมที่จะต้องบิดกล้ามเนื้อกระทันหัน เพราะโอกาสที่จะเกิดการบาดเจ็บที่กล้ามเนื้อได้ง่ายกว่าปกติ',
                      ],
                    ),
                  ],
                ),
                _buildSection(
                  '2. พบแพทย์และวินิจฉัยอย่างละเอียด',
                  [
                    _buildSubsection(
                      'ความสำคัญของการวินิจฉัยทางการแพทย์',
                      [
                        'เมื่อคุณพบว่าตนเองมีภาวะเสี่ยงเป็นโรคสันหลังคด คุณควรได้รับการตรวจทางการแพทย์ที่ถูกต้องเพื่อดำเนินการรักษาต่อไป',
                        'ในการวินิจฉัยโรคดูกหลังคดนั้นจะต้องใช้การตรวจทางการแพทย์เช่นเอกซเรย์แนวกระดูกสันหลังเพื่อให้แพทย์ประเมินมุมการโค้งของกระดูกสันหลังและตัดสินใจว่าจะดำเนินการรักษาอย่างถูกต้องต่อไป',
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 175,
                    width: MediaQuery.of(context).size.width - 32,
                    child: HealthCard(
                      imagePath: 'assets/img/doctor.jpg',
                      title: 'รายชื่อ\nโรงพยาบาล',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HospitalScreen()),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                _buildSection(
                  '3. การกายภาพบำบัดเสริมสร้างกล้ามเนื้อ',
                  [
                    _buildSubsection(
                      'การรักษาด้วยกายภาพบำบัด',
                      [
                        'นักกายภาพบำบัดจะตรวจภาวะกระดูกสันหลังเพื่อประเมินภาวะคดโค้งทั้งแนวกระดูกเพื่อวางแผนการรักษาเฉพาะบุคคล เพราะความคดโค้งของแต่ละคนไม่เหมือนกัน',
                        'การรักษาทางกายภาพบำบัด  กระดูกสันหลังคดเกิดจากกล้ามเนื้อทั้ง 2 ฝั่งทำงานไม่สมดุลกัน ดังนั้นการรักษาต้องฝึกกล้ามเนื้อให้กลับมาทำงานสมดุลกัน โดยเป็นการฝึกแบบRehab Exercise ในระยะแรกกล้ามเนื้อข้างใดที่ทำงานมากเกินไปและมีการตึงตัวจะเน้นออกกำลังกายแบบยืดเหยียดกล้ามเนื้อ ส่วนข้างที่อ่อนแรงหรือทำงานได้ไม่ดีจะเน้นออกกำลังกายเพิ่มความแข็งแรงของกล้ามเนื้อในข้างนั้น เมื่อการทำงานของกล้ามเนื้อทั้ง 2 ข้างเริ่มทำงานสมดุลกันในระยะต่อมาจะเริ่มฝึกความแข็งแรงและยืดเหยียดกล้ามเนื้อทั้ง 2 ข้าง เพื่อให้มีการเรียนรู้การทำงานของกล้ามเนื้อทั้ง 2 ฝั่งแบบสมมาตรกัน และลดการปวดเมื่อยในระยะยาว โดยไม่ต้องทำการผ่าตัด',
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 175,
                    width: MediaQuery.of(context).size.width - 32,
                    child: HealthCard(
                        imagePath: 'assets/img/posture.png',
                        title: 'การดูแลกระดูกสันหลัง',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciseScreen()),
                          );
                        }),
                  ),
                ),
                _buildSection(
                  '4. หลีกเลี่ยงพฤติกรรมเสี่ยงที่ก่อให้เกิดความเสียหายต่อกระดูกสันหลัง',
                  [
                    _buildSubsection(
                      'พฤติกรรมที่ควรหลีกเลี่ยง',
                      [
                        'การยกของหนัก: ควรหลีกเลี่ยงการยกของที่มีน้ำหนักมาก เพราะอาจทำให้กล้ามเนื้อและกระดูกสันหลังได้รับความเสียหาย',
                        'การนั่งหรือลุกจากท่าทางเดิมนานเกินไป: หากต้องนั่งหรือลุกจากท่าทางเดิมนานๆ ควรพักบ่อยๆ และเปลี่ยนท่าทางบ่อยๆ เพื่อไม่ให้กระดูกสันหลังได้รับความเครียด',
                        'กิจกรรมที่ต้องบิดหรือหมุนตัวอย่างกระทันหัน: เช่น การเล่นกีฬา หรือการเคลื่อนไหวที่มีการหมุนตัวเร็ว ซึ่งอาจทำให้กล้ามเนื้อเกิดการบาดเจ็บได้',
                      ],
                    ),
                  ],
                ),
                _buildTipCard(),
                ReferenceFooter(references: references),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF0BD8F3),
            const Color(0xFF004aad),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.medical_information,
                size: 70,
                color: Color(0xFF0BD8F3),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'แนวทางการดูแลตัวเอง',
            style: GoogleFonts.sarabun(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'สำหรับผู้ที่มีภาวะกระดูกสันหลังคด',
            style: GoogleFonts.sarabun(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildIntroduction() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'คำแนะนำสำหรับการดูแลตัวเอง',
                style: GoogleFonts.sarabun(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004aad),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'การดูแลตัวเองอย่างถูกต้องสำหรับผู้ที่มีภาวะกระดูกสันหลังคดมีความสำคัญอย่างยิ่ง เพื่อป้องกันอาการที่อาจเกิดขึ้นและช่วยให้คุณใช้ชีวิตได้อย่างมีคุณภาพ บทความนี้จะให้คำแนะนำที่เป็นประโยชน์สำหรับการดูแลตัวเองในชีวิตประจำวัน',
                style: GoogleFonts.sarabun(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> subsections) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(0xFF0BD8F3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: GoogleFonts.sarabun(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004aad),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[300],
                height: 20,
              ),
              ...subsections,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubsection(String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: GoogleFonts.sarabun(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        ...points.map((point) => Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 6),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Color(0xFF0BD8F3),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      point,
                      style: GoogleFonts.sarabun(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            )),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildTipCard() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        color: Color(0xFF004aad),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.lightbulb,
                color: Colors.yellow,
                size: 40,
              ),
              SizedBox(height: 10),
              Text(
                'คำแนะนำสำคัญ',
                style: GoogleFonts.sarabun(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'หากคุณมีอาการปวดหลังรุนแรง หรือพบว่ามีการเปลี่ยนแปลงของกระดูกสันหลังที่รวดเร็ว ควรปรึกษาแพทย์โดยเร็วที่สุด การรักษาตั้งแต่เนิ่นๆ จะช่วยป้องกันภาวะแทรกซ้อนที่อาจเกิดขึ้นในอนาคต',
                textAlign: TextAlign.center,
                style: GoogleFonts.sarabun(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'อย่าละเลยการเปลี่ยนแปลงของร่างกาย หากพบความผิดปกติ',
                textAlign: TextAlign.center,
                style: GoogleFonts.sarabun(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
