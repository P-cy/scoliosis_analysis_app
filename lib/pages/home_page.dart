// ignore_for_file: sized_box_for_whitespace, deprecated_member_use, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/HealthCard_Widget.dart';
import 'package:scoliosis_analysis_app/pages/hospital_page.dart';
import 'package:scoliosis_analysis_app/pages/info_page.dart';
import 'package:scoliosis_analysis_app/pages/guidelines_page.dart';
import 'package:scoliosis_analysis_app/pages/risk_guidelines_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChange);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChange);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChange() {
    final currentPage = _pageController.page?.round() ?? 0;
    if (_currentPage != currentPage) {
      setState(() {
        _currentPage = currentPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xFFF5F9FF),
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
        body: SingleChildScrollView(
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: screenWidth,
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
                  horizontal: 16,
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
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 16, left: 16, right: 16),
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(32),
                            bottom: Radius.circular(32),
                          ),
                          child: Image.asset(
                            'assets/img/poster_spine.jpg',
                            height: 160,
                            width: screenWidth - 32,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    SizedBox(
                      height: 175,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: [
                          HealthCard(
                            imagePath: 'assets/img/back-bone.jpg',
                            title: 'โรคกระดูก\nสันหลังคด',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SpineInfoScreen()),
                              );
                            },
                          ),
                          HealthCard(
                            imagePath: 'assets/img/slide1.jpg',
                            title:
                                'แนวทางการดูแลตนเอง\สำหรับผู้ที่มีภาวะกระดูกสันหลังคด',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RiskGuidelinesScreen()),
                              );
                            },
                          ),
                          HealthCard(
                            imagePath: 'assets/img/slide4.jpg',
                            title:
                                'การป้องกัน\nและการจัดการ\nกับกระดูกสันหลังคด',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RiskFactorsScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _buildPageIndicator(_currentPage),
                    SizedBox(height: 16),
                    Text(
                      'รายชื่อโรงพยาบาล',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Container(
                      height: 175,
                      width: screenWidth - 32,
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
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ]),
          ),
        ));
  }
}

Widget _buildPageIndicator(int currentPage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      3,
      (index) => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: currentPage == index ? 24 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: currentPage == index ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}

Future<bool> checkDisclaimerAccepted() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('disclaimer_accepted') ?? false;
}
