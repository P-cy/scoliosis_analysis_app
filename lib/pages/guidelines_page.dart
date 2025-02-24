// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/url_widget.dart';
import 'package:scoliosis_analysis_app/pages/exercise_page.dart';

class RiskFactorsScreen extends StatefulWidget {
  const RiskFactorsScreen({super.key});

  @override
  State<RiskFactorsScreen> createState() => _RiskFactorsScreenState();
}

class _RiskFactorsScreenState extends State<RiskFactorsScreen> {
  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildIntroduction(),
              _buildManagementSection(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  elevation: 4,
                  color: const Color(0xFF004aad),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.lightbulb,
                          color: Colors.yellow,
                          size: 40,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'คำแนะนำในการป้องกัน',
                          style: GoogleFonts.sarabun(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'การตระหนักถึงปัจจัยเสี่ยงและการปรับเปลี่ยนพฤติกรรมการใช้ชีวิตเป็นสิ่งสำคัญในการป้องกันภาวะกระดูกสันหลังคด',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sarabun(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ExerciseScreen()),
                          ),
                          icon: const Icon(Icons.touch_app,
                              color: Color(0xFF004aad)),
                          label: Text(
                            'ไปยังท่ากายภาพบำบัด',
                            style: GoogleFonts.sarabun(
                              color: Color(0xFF004aad),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ReferenceFooter(
                references: [
                  ReferenceItem(
                    linkText: 'กระดูกสันหลังคด Scoliosis: อาการและการรักษา',
                    url: Uri.parse(
                        'https://greenbellclinic.com/medical-blog-th-th/%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%94%E0%B8%B9%E0%B8%81%E0%B8%AA%E0%B8%B1%E0%B8%99%E0%B8%AB%E0%B8%A5%E0%B8%B1%E0%B8%87%E0%B8%84%E0%B8%94-scoliosis-%E0%B8%AD%E0%B8%B2%E0%B8%81%E0%B8%B2%E0%B8%A3/'),
                    copyright: '© 2025 Greenbell Medical Clinic',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0BD8F3),
            Color(0xFF004aad),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.health_and_safety,
                size: 70,
                color: Color(0xFF0BD8F3),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'การป้องกันและการจัดการ\nกับกระดูกสันหลังคดในชีวิตประจำวัน',
            style: GoogleFonts.sarabun(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildIntroduction() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'การป้องกันและการจัดการกับกระดูกสันหลังคด',
                style: GoogleFonts.sarabun(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF004aad),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'การป้องกันกระดูกสันหลังคดเป็นสิ่งสำคัญมาก ท่านสามารถลดความเสี่ยงได้โดยการปรับเปลี่ยนท่าทางและออกกำลังกายอย่างถูกวิธี นอกจากนี้ การนั่งทำงานควรใช้เก้าอี้ที่รองรับหลังอย่างเหมาะสม และควรยืดเหยียดร่างกายทุกๆ 30 นาที',
                style: GoogleFonts.sarabun(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'การจัดการกระดูกสันหลังคดสามารถทำได้หลายวิธี การออกกำลังกายเฉพาะส่วนช่วยเสริมสร้างกล้ามเนื้อหลัง การทำกายภาพบำบัดช่วยปรับสมดุลของร่างกาย และการวิเคราะห์ท่าทางช่วยแก้ไขการยืนและเดินที่ไม่ถูกต้อง',
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

  Widget _buildManagementSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0BD8F3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'วิธีป้องกันและจัดการ',
                      style: GoogleFonts.sarabun(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF004aad),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildManagementItem('ปรับท่านั่งทำงาน', Icons.chair),
              _buildManagementItem(
                  'ออกกำลังกายเฉพาะส่วน', Icons.fitness_center),
              _buildManagementItem(
                  'ยืดเหยียดร่างกายสม่ำเสมอ', Icons.accessibility_new),
              _buildManagementItem('ทำกายภาพบำบัด', Icons.medical_services),
              _buildManagementItem('ใช้เก้าอี้ที่รองรับหลัง', Icons.weekend),
              _buildManagementItem('วิเคราะห์และแก้ไขท่าทาง', Icons.person),
              const SizedBox(height: 16),
              Text(
                'นอกจากนี้ การนอนบนเตียงที่เหมาะสมและการยกของอย่างถูกวิธีช่วยป้องกันกระดูกสันหลังคดได้ ควรหลีกเลี่ยงการนั่งหรือยืนในท่าเดียวนานๆ และควรสังเกตอาการผิดปกติของร่างกาย หากพบความผิดปกติ ควรปรึกษาแพทย์เพื่อรับการรักษาที่เหมาะสมโดยเร็ว',
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

  Widget _buildManagementItem(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF0BD8F3).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF0BD8F3),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.sarabun(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
