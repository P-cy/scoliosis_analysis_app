// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/exercise_page.dart';
import 'package:scoliosis_analysis_app/pages/hospital_page.dart';
import 'package:url_launcher/url_launcher.dart';

class RiskGuidelinesScreen extends StatefulWidget {
  const RiskGuidelinesScreen({super.key});

  @override
  State<RiskGuidelinesScreen> createState() => _GuidelinesScreenState();
}

class _GuidelinesScreenState extends State<RiskGuidelinesScreen> {
  final Uri _url =
      Uri.parse('https://www.vejthani.com/th/2021/12/สิ่งที่ควรทำและไม่ควรท/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('ไม่สามารถเปิด URL นี้ได้ $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalScreen()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(32),
                                      bottom: Radius.circular(32),
                                    ),
                                    child: Image.asset(
                                      "assets/img/doctor.jpg",
                                      height: 150,
                                      width: 175,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "  โรงพยาบาล",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HospitalScreen()),
                                          );
                                        },
                                        child: Text(
                                          'คลิกเพื่อดูรายชื่อ >',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildSection(
                  '3. การกายภาพบำบัดเสริมสร้างกล้ามเนื้อ',
                  [
                    _buildSubsection(
                      'ประโยชน์ของการกายภาพบำบัด',
                      [
                        'การเสริมสร้างกล้ามเนื้อที่เกี่ยวกับการพยุงกระดูกสันหลังเช่นการกายภาพบำบัด เนื่องจากกระดูกสันหลังคด ทำให้กล้ามเนื้อบริเวณรอบข้าง ต้องรองรับกระดูกสันหลังที่ผิดปกติ ทำให้เกิดอาการปวดและอักเสบได้',
                        'สำหรับผู้ที่มีภาวะกระดูกสันหลังคดในระดับที่ไม่รุนแรง การรักษาโดยการทำกายภาพบำบัดจะช่วยให้กล้ามเนื้อที่ช่วยพยุงกระดูกสันหลังทำงานได้ดีขึ้น รวมถึงการฝึกท่าทางที่เหมาะสมในการป้องกันการเกิดความเครียดต่อกระดูกสันหลัง',
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExerciseScreen()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(32),
                                      bottom: Radius.circular(32),
                                    ),
                                    child: Image.asset(
                                      "assets/img/posture.png",
                                      height: 130,
                                      width: 155,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "  การกายภาพบำบัด\n  ด้วยตนเอง",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ExerciseScreen()),
                                          );
                                        },
                                        child: Text(
                                          'ข้อมูลเพิ่มเติม >',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
                _buildReferenceFooter(),
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

  Widget _buildReferenceFooter() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Text(
            'แหล่งอ้างอิง',
            style: GoogleFonts.sarabun(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF004aad),
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: _launchUrl,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.link, color: Color(0xFF0BD8F3)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'สิ่งที่ควรทำและไม่ควรทำสำหรับผู้ป่วยกระดูกสันหลังคด',
                      style: GoogleFonts.sarabun(
                        fontSize: 14,
                        color: Colors.blue[800],
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Icon(Icons.open_in_new, color: Colors.grey),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'โรงพยาบาลเวชธานี © 2025',
            style: GoogleFonts.sarabun(
              fontSize: 12,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
