import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/exercise.dart';
import 'package:scoliosis_analysis_app/pages/hospital_screen.dart';
import 'package:scoliosis_analysis_app/pages/info_screen.dart';
import 'package:scoliosis_analysis_app/pages/prevention.dart';
import 'package:scoliosis_analysis_app/pages/risk_guidelines.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

final PageController _pageController = PageController();
int _currentPage = 0;

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 10,
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
            ),
          ),
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    const Color(0xFF0BD8F3),
                    const Color(0xFF004aad),
                  ],
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ยินดีต้อนรับ...',
                    style: GoogleFonts.sarabun(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(32),
                                bottom: Radius.circular(32),
                              ),
                              child: Image.asset(
                                'assets/img/poster_spine.jpg',
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'โรคกระดูกสันหลังคด การรักษา และการป้องกัน',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Container(
                    height: 200,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        _buildHealthCard(
                          'assets/img/back-bone.jpg',
                          'โรคกระดูก\nสันหลังคด',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SpineInfoScreen()),
                            );
                          },
                        ),
                        _buildHealthCard(
                          'assets/img/slide1.jpg',
                          'แนวทางปฏิบัติ\nเมื่อพบภาวะเสี่ยง',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RiskGuidelinesScreen()),
                            );
                          },
                        ),
                        _buildHealthCard(
                          'assets/img/slide2.jpg',
                          'การกายภาพ\nบำบัดด้วยตนเอง',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExerciseScreen()),
                            );
                          },
                        ),
                        _buildHealthCard(
                          'assets/img/slide4.jpg',
                          'แนวทางป้องกัน\nการเกิดโรค\nกระดูกสันหลังคด',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PreventionScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _buildPageIndicator(),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'รายชื่อโรงพยาบาล และ คู่มือการใช้งาน',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalScreen()),
                            ),
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
                                          "โรงพยาบาล",
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
                                            style:
                                                TextStyle(color: Colors.blue),
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
                    SizedBox(
                      height: 8,
                    ),
                  ]),
            ),
          ]),
        ));
  }
}

Widget _buildHealthCard(String imagePath, String title, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: GestureDetector(
      onTap: onTap,
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
                  imagePath,
                  height: 150,
                  width: 175,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: onTap,
                    child: Text(
                      'ข้อมูลเพิ่มเติม >',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildPageIndicator() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      4,
      (index) => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: _currentPage == index ? 24 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: _currentPage == index ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
