// ignore_for_file: deprecated_member_use, unnecessary_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoliosis_analysis_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WarningScreen extends StatefulWidget {
  const WarningScreen({super.key});

  @override
  State<WarningScreen> createState() => WarningScreenState();
}

class WarningScreenState extends State<WarningScreen>
    with SingleTickerProviderStateMixin {

  // ฟังก์ชันสำหรับปิดแอป
  void _exitApp() {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              end: Alignment.topRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0BD8F3),
                Color(0xFF004aad),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical : 10),
              child: Column(
                children: [
                  
                  Text(
                    'ข้อควรทราบ',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'แอปพลิเคชันมีวัตถุประสงค์เพื่อให้ข้อมูลเบื้องต้นเท่านั้น มิใช่การวินิจฉัยหรือการรักษาทางการแพทย์',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'แอปพลิเคชันสามารถวิเคราะห์ภาวะกระดูกสันหลังคดเบื้องต้นจากข้อมูลที่ท่านให้ ผลการวิเคราะห์เป็นเพียงแนวทางเริ่มต้น มิอาจใช้แทนการวินิจฉัยทางการแพทย์',
                          style: TextStyle(
                              fontSize: 14, height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'กรณีมีอาการปวดหลังเรื้อรัง ไหล่หรือสะโพกไม่สมมาตร หรือสงสัยว่ามีภาวะกระดูกสันหลังคด แนะนำให้พบแพทย์ผู้เชี่ยวชาญด้านกระดูกและข้อ เพื่อรับการตรวจวินิจฉัยและคำแนะนำการรักษาที่เหมาะสม',
                          style: TextStyle(
                              fontSize: 14, height: 1.5),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'ผู้พัฒนาแอปพลิเคชันจะไม่รับผิดชอบต่อความเสียหายใดๆ ที่อาจเกิดขึ้นจากการใช้ข้อมูล การวิเคราะห์ หรือการตัดสินใจของผู้ใช้งาน หากท่านยอมรับ ถือว่าการใช้งานแอปพลิเคชันนี้เป็นความรับผิดชอบของท่านเองทั้งสิ้น',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF004aad),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        onPressed: _exitApp, // เรียกใช้ฟังก์ชันปิดแอป
                        child: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0BD8F3),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        onPressed: () async {
                          final prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool(
                              'disclaimer_accepted', true);
                                
                          if (context.mounted) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'ยอมรับ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
