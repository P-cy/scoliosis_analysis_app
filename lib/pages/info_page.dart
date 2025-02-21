// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/guidelines_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SpineInfoScreen extends StatefulWidget {
  const SpineInfoScreen({super.key});

  @override
  State<SpineInfoScreen> createState() => _SpineInfoScreenState();
}

class _SpineInfoScreenState extends State<SpineInfoScreen> {
  final Uri _url = Uri.parse(
      'https://kdmshospital.com/article/symptoms-and-treatment-of-scoliosis/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('ไม่สามารถเปิด URL นี้ได้$_url');
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
                  '1. สาเหตุการเกิดโรคกระดูกสันหลังคด',
                  [
                    _buildSubsection(
                      '1.1 ความผิดปกติของการเจริญเติบโตกระดูกสันหลังแต่กำเนิด',
                      [
                        'เป็นความผิดปกติของกระดูกสันหลังตั้งแต่ก่อนคลอด โดยเป็นความผิดปกติจากพัฒนาการของทารกในครรภ์เกิดจากการสร้างของกระดูกสันหลังเพียงด้านเดียว หรือการสร้างของกระดูกสันหลังที่ไม่แยกจากกันส่งผลให้เกิดกระดูกสันหลังคดตั้งแต่กำเนิด ซึ่งก่อให้เกิดความผิดปกติมาก ผู้ป่วยมักจะต้องรีบเข้ารับการรักษา',
                      ],
                    ),
                    _buildSubsection(
                      '1.2 ความผิดปกติของระบบประสาทกล้ามเนื้อ',
                      [
                        'เกิดจากโรคทางระบบประสาทหรือกล้ามเนื้อที่มีความผิดปกติทำให้เกิดความไม่สมดุลต่อกระดูกสันหลัง ส่งผลให้กระดูกสันหลังคดพบบ่อยในผู้ป่วยที่มีอาการขาดเลือดทางสมองแต่กำเนิด (Cerebral Palsy) หรือเป็นโรคกล้ามเนื้ออ่อนแรง (Muscular Dystrophy)',
                      ],
                    ),
                    _buildSubsection(
                      '1.3 ความเสื่อมของข้อกระดูก',
                      [
                        'เป็นสาเหตุที่พบได้บ่อยที่สุดของคนไข้สูงอายุที่มีภาวะกระดูกสันหลังคดเกิดจากความเสื่อมของข้อกระดูกสันหลัง หรือหมอนรองกระดูกสันหลังด้านซ้ายกับขวาไม่เท่ากันทำให้เกิดการทรุดตัวของข้อกระดูกสันหลังด้านซ้ายขวาไม่เท่ากัน จึงทำให้เกิดกระดูกสันหลังคด',
                      ],
                    ),
                    _buildSubsection(
                      '1.4 กระดูกสันหลังคดแบบไม่ทราบสาเหตุ',
                      [
                        'เป็นสาเหตุที่พบได้บ่อยที่สุดของคนไข้เด็กที่มีภาวะกระดูกสันหลังคดไม่ทราบสาเหตุที่แน่ชัด ไม่พบความผิดปกติของกระดูก หมอนรองกระดูก หรือกล้ามเนื้อวินิจฉัยโดยต้องค้นหาสาเหตุอื่นๆ ก่อน ถ้าไม่พบความผิดปกติจากสาเหตุอื่นๆ จะจัดเข้าในกลุ่มนี้',
                      ],
                    ),
                  ],
                ),
                _buildSection(
                  '2. กระดูกสันหลังคดและผลที่เกิดขึ้น',
                  [
                    _buildSubsection(
                      '2.1 ในเด็กเล็ก (0-5 ปี)',
                      [
                        'มักเกิดจากความผิดปกติแต่กำเนิดของกระดูก (Congenital Scoliosis) สังเกตได้ตั้งแต่อายุน้อย หรืออาจพบได้โดยบังเอิญจากภาพถ่ายรังสีส่วนอื่นๆเมื่อพบแล้ว ต้องหาความผิดปกติของระบบอื่นๆ ที่อาจพบร่วมด้วย เช่น ความผิดปกติของไต หรือหัวใจ',
                      ],
                    ),
                    _buildSubsection(
                      '2.2 ในวัยรุ่น (10-15 ปี)',
                      [
                        'พบโรคกระดูกสันหลังคดแบบไม่ทราบสาเหตุ (Idiopathic Scoliosis) มากที่สุด เป็นช่วงที่กระดูกจะเจริญเติบโตและเด็กจะมีส่วนสูงเพิ่มขึ้นอย่างรวดเร็วผู้ปกครองต้องเฝ้าระวัง เพราะเป็นช่วงที่กระดูกสันหลังคดกลุ่มนี้จะมีมุมที่เพิ่มมากขึ้นได้เร็ว',
                      ],
                    ),
                    _buildSubsection(
                      '2.3 ในผู้สูงอายุ (> 50 ปี)',
                      [
                        'ส่วนใหญ่เกิดจากกระดูกสันหลังเสื่อม เนื่องจากข้อกระดูกที่ใช้งานมานานเกิดการเสื่อมสภาพเมื่อข้อกระดูกด้านซ้ายกับขวาเสื่อมสภาพไม่เท่ากัน หรือหมอนรองกระดูกทรุดไม่เท่ากันมักพบภาวะกระดูกสันหลังกดทับเส้นประสาทร่วมด้วย ทำให้มีอาการปวดหลัง ปวดร้าวลงขา ขาชา หรืออ่อนแรง',
                      ],
                    ),
                  ],
                ),
                _buildSection(
                  '3. สัญญาณเบื้องต้นของปัญหากระดูกสันหลังคด',
                  [
                    _buildSubsection(
                      '3.1 ลักษณะที่สังเกตได้',
                      [
                        'ไหล่ทั้งสองข้างสูงไม่เท่ากัน',
                        'ลำตัวเอียงไปด้านใดด้านหนึ่งเวลายืนหรือเดิน',
                        'สะโพกหรือเชิงกรานทั้งสองข้างไม่เท่ากัน',
                        'แผ่นหลังหรือหน้าอกนูนไม่เท่ากัน',
                        'มองเห็นกระดูกสันหลังคดงอชัดเจน',
                      ],
                    ),
                    _buildSubsection(
                      '3.2 วิธีการตรวจสอบเบื้องต้น',
                      [
                        'การตรวจที่เรียกว่า (Forward Bending Test) โดยให้คนไข้ก้มหลัง',
                        'สังเกตว่าหลังด้านซ้ายขวาจะนูนเท่ากันหรือไม่ หรือเอวทั้งสองข้างนูนเท่ากันหรือไม่',
                        'โดยปกตินั้น เมื่อก้มหลังแล้วสังเกตจากด้านหลัง ช่วงอกหรือเอวควรจะอยู่ในระนาบเดียวกัน',
                        'หากมีโรคกระดูกสันหลังคด เมื่อก้มหลังแล้ว หลังด้านซ้ายขวาจะนูนไม่เท่ากัน',
                      ],
                    ),
                  ],
                ),
                _buildSection(
                  '4. การวินิจฉัยหาโรคกระดูกสันหลังคด',
                  [
                    _buildSubsection(
                      '4.1 การตรวจร่างกาย',
                      [
                        'แพทย์จะตรวจความยาวของขาทั้งสองข้าง',
                        'ตรวจไหล่ทั้งสองข้างว่าอยู่ในระดับเดียวกันหรือไม่',
                        'ตรวจกระดูกสันหลังว่ามีความผิดปกติหรือไม่',
                        'ตรวจความผิดปกติทางระบบประสาท เพื่อหารอยโรคของไขสันหลังที่อาจพบร่วมกัน',
                      ],
                    ),
                    _buildSubsection(
                      '4.2 การส่งตรวจเพิ่มเติม',
                      [
                        'การส่งภาพถ่ายรังสี โดยหากพบมุมที่คดเอียงมากกว่า 10 องศา จะวินิจฉัยว่าเป็นโรคกระดูกสันหลังคด',
                        'การตรวจการทำงานของปอด (Pulmonary Function Test)',
                        'การตรวจด้วยเครื่องเอกซเรย์แม่เหล็กไฟฟ้า (MRI) เพื่อตรวจหารอยโรคของไขสันหลังและเส้นประสาท',
                        'การตรวจสแกนคอมพิวเตอร์ (CT Scan) เพื่อตรวจสอบขนาดของกระดูกสำหรับวางแผนการผ่าตัด',
                      ],
                    ),
                  ],
                ),
                Padding(
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
                            'หากสังเกตพบความผิดปกติของกระดูกสันหลัง ควรปรึกษาแพทย์ผู้เชี่ยวชาญโดยเร็ว โดยเฉพาะในเด็กและวัยรุ่นที่กำลังเจริญเติบโต การตรวจพบและรักษาตั้งแต่เนิ่นๆ จะช่วยป้องกันการเกิดภาวะแทรกซ้อนและให้ผลการรักษาที่ดีกว่า',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sarabun(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GuidelinesScreen(),
                                ),
                              );
                            },
                            icon:
                                Icon(Icons.touch_app, color: Color(0xFF004aad)),
                            label: Text(
                              'ดูแนวทางการป้องกัน',
                              style: GoogleFonts.sarabun(
                                color: Color(0xFF004aad),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
                _buildReferenceFooter(_launchUrl),
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
                Icons.health_and_safety,
                size: 70,
                color: Color(0xFF0BD8F3),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'โรคกระดูกสันหลังคด',
            style: GoogleFonts.sarabun(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'สาเหตุ ลักษณะ และการวินิจฉัย',
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
                'กระดูกสันหลังคดคืออะไร?',
                style: GoogleFonts.sarabun(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004aad),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'กระดูกสันหลังคด (Scoliosis) คือภาวะที่กระดูกสันหลังมีการโค้งงอผิดปกติไปด้านข้าง ทำให้กระดูกสันหลังไม่ตรงตามแนวธรรมชาติ สามารถเกิดได้ในทุกวัย ตั้งแต่วัยเด็ก วัยรุ่น ผู้ใหญ่ จนถึงผู้สูงอายุ โดยมีสาเหตุและความรุนแรงที่แตกต่างกันไป การทำความเข้าใจเกี่ยวกับโรคนี้จะช่วยให้สามารถตรวจพบและรักษาได้อย่างทันท่วงที',
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
                        fontSize: 20,
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
}

Widget _buildReferenceFooter(Function() launchUrl) {
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
          onTap: launchUrl,
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
                    'โรคกระดูกสันหลังคด ปัญหาที่ควรได้รับการรักษา ',
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
          'โรงพยาบาลเฉพาะทางกระดูกและข้อkdms © 2025',
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
