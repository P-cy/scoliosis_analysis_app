import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 60,
        title: Text('ท่าสำหรับการกายภาพบำบัด',
            style: GoogleFonts.sarabun(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                  )),
              padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 1),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 40),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            elevation: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.asset(
                                        'assets/img/posture.png',
                                        height: 180,
                                        width: 270,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'ท่าสำหรับการ',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.sarabun(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'กายภาพบำบัด',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.sarabun(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            SizedBox(height: 20),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '        การเสริมสร้างกล้ามเนื้อที่เกี่ยวกับการพยุงกระดูกสันหลังเช่นการกายภาพบำบัด เนื่องจากกระดูกสันหลังคด ทำให้กล้ามเนื้อบริเวณรอบข้าง ต้องรองรับกระดูกสันหลังที่ผิดปกติ ทำให้เกิดอาการปวดและอักเสบได้สำหรับผู้ที่มีภาวะกระดูกสันหลังคดในระดับที่ไม่รุนแรง การรักษาโดยการทำกายภาพบำบัดจะช่วยให้กล้ามเนื้อที่ช่วยพยุงกระดูกสันหลังทำงานได้ดีขึ้น ',
                        style: GoogleFonts.sarabun(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '1. ท่าเหยียดลำตัวไปด้านข้าง',
                        style: GoogleFonts.sarabun(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/img/IMG_2749.JPG',
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/img/IMG_2750.JPG',
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: 'คำอธิบาย : ',
                          style: GoogleFonts.sarabun(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'ยืนแยกขากว้างเท่าความกว้างไหล่ '
                                  'ยกแขนข้างหนึ่งเหนือศีรษะแล้วเอนตัวไปด้านข้างจน',
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '2. ท่ายืนตรงกางแขน',
                        style: GoogleFonts.sarabun(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/img/IMG_2751.JPG',
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.sarabun(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          children: [
                            TextSpan(
                              text: 'คำอธิบาย : ',
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'ยืนตรง กางแขนออกด้านข้างให้มากที่สุดโดยไม่เกร็ง ค้างไว้ 10 วินาที ทั้งสองข้าง\n\n',
                            ),
                            TextSpan(
                              text: 'จำนวน : ',
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'ทำ 10 ครั้งต่อเซต วันละ 2-3 เซต',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '3. ท่าบิดลำตัวไปด้านข้าง',
                        style: GoogleFonts.sarabun(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/img/IMG_2751.JPG',
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/img/IMG_2752.JPG',
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.sarabun(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          children: [
                            TextSpan(
                              text: 'คำอธิบาย : ',
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'ยืนตรง กางแขนออก แล้วบิดลำตัวไปด้านข้างจนรู้สึกตึง ค้างไว้ 10 วินาที\n\n',
                            ),
                            TextSpan(
                              text: 'จำนวน : ',
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'ทำข้างละ 10 ครั้งต่อเซต วันละ 2-3 เซต',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '4. ท่าปรับแนวกระดูกสันหลังส่วนบน',
                        style: GoogleFonts.sarabun(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/img/IMG_2756.JPG',
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.sarabun(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          children: [
                            TextSpan(
                              text: 'คำอธิบาย : ',
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'อยู่ในท่าคลาน งอศอกวางมือไว้ที่ใบหู เอียงตัวไปด้านข้างจนรู้สึกตึงบริเวณกลางหลัง ค้างไว้ 10 วินาทีโดยทำทั้งสองข้างซ้ายขวา\n\n',
                            ),
                            TextSpan(
                              text: 'จำนวน : ',
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'ข้างละ 10 ครั้งต่อเซต วันละ 2-3 เซต',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '5. ท่าโก่งหลังและแอ่นหลัง',
                        style: GoogleFonts.sarabun(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/img/IMG_2754.JPG',
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/img/IMG_2755.JPG',
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.sarabun(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          children: [
                            TextSpan(
                              text: 'คำอธิบาย : ',
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'อยู่ในท่าคลาน แขม่วท้องโก่งหลังให้มากที่สุด ค้างไว้ 10 วินาที แล้วแอ่นหลังให้มากที่สุด ค้างไว้อีก 10 วินาที\n\n',
                            ),
                            TextSpan(
                              text: 'จำนวน : ',
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'ทำ 10 ครั้งต่อเซต วันละ 2-3 เซต',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '6. ท่าคลานยกแขนขาสลับ',
                        style: GoogleFonts.sarabun(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/img/IMG_2754.JPG',
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/img/IMG_2757.JPG',
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.sarabun(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          children: [
                            TextSpan(
                              text: 'คำอธิบาย : ',
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'ยู่ในท่าคลาน ยกแขนซ้ายไปข้างหน้า เหยียดขาขวาไปด้านหลังให้ตรง ค้างไว้ 10 วินาที แล้วสลับข้าง\n\n',
                            ),
                            TextSpan(
                              text: 'จำนวน : ',
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'ข้างละ 10 ครั้งต่อเซต วันละ 2-3 เซต',
                            ),
                          ],
                        ),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
