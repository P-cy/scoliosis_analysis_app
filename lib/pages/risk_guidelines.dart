import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/exercise.dart';
import 'package:scoliosis_analysis_app/pages/linkurl.dart';

class RiskGuidelinesScreen extends StatelessWidget {
  const RiskGuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
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
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 1),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 40),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  'assets/img/slide.jpg',
                                  height: 180,
                                  width: 270,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'แนวทางปฏิบัติ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sarabun(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'เมื่อพบภาวะเสี่ยง',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sarabun(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'รู้เร็ว เท่าทัน แก้ไขได้',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sarabun(
                                fontSize: 14,
                                color: Colors.grey[700],
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
          const SizedBox(height: 20),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'สารบัญ',
                      style: GoogleFonts.sarabun(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '1. ผลที่เกิดขึ้นเมื่อเป็นกระดูกสันหลังคด\n'
                      '2. พบแพทย์และวินิฉัยอย่างละเอียด\n'
                      '3. การกายภาพบำบัดเสริมสร้างกล้ามเนื้อ\n'
                      '4. หลีกเลี่ยงพฤติกรรมเสี่ยงที่ก่อให้เกิดความเสียหายต่อกระดูสันหลัง',
                      style: GoogleFonts.sarabun(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // เนื้อหาเพิ่มเติม
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. ผลที่เกิดขึ้นเมื่อเป็นกระดูกสันหลังคด',
                  style: GoogleFonts.sarabun(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '        สำหรับในผู้ที่มีกระดูกสันหลังคดนั้น การกระจายน้ำหนักเวลาทำกิจกรรมต่างๆนั้นจะเกิดความไม่สมดุลเท่าที่ควร ดังนั้นร่างกายจะพยายามปรับสมดุลโดยการให้กล้ามเนื้อส่วนแกนกลางของร่างกายไม่ว่าจะเป็นกล้ามเนื้อหลัง กล้ามเนื้อหน้าท้อง มาช่วยพยุง และรับน้ำหนัก ส่งผลให้อาจะเกิดอาการปวด และอักเสบของกล้ามเนื้ออย่างเรื้อรังได้นั่นเองดังนั้นผู้ที่เป็นกระดูกคดต้องหลีกเลี่ยงกิจกรรมใดก็ตามแต่ที่ไปสร้างภาระให้กับกล้ามเนื้อมากๆ เช่น\n• การยกของหนัก \n• การที่จะต้องอยู่ในท่าทางเดิมซ้ำๆ นานๆ เช่น นั่งนาน ยืนนาน \n• กิจกรรมที่จะต้องบิดกล้ามเนื้อกระทันหัน เพราะโอกาสที่จะเกิดการบาดเจ็บที่กล้ามเนื้อได้ง่ายกว่าปกติ',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '2. พบแพทย์และวินิฉัยอย่างละเอียด',
                  style: GoogleFonts.sarabun(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '        เมื่อคุณพบว่าตนเองมีภาวะเสี่ยงเป็นโรคสันหลังคด คุณควรได้รับการตรวจทางการแพทย์ที่ถูกต้องเพื่อดำเนินการคุณควรได้รับการตรวจทางการแพทย์ที่ถูกต้องเพื่อดำเนินการรักษาต่อไป โดยคุณสามารถกดที่',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {},
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
                                        onPressed: () {},
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
                Text(
                  'เพื่อหารายชื่อโรงพยาบาลในพื้นที่ใกล้คุณ แล้วเข้าไปรับการปรึกษาจากแพทย์ ได้ โดยในการวินิจฉัยโรคดูกหลังคดนั้นจะต้อง ใช้การตรวจทางการแพทย์เช่นเอกซเรย์แนวกระดูกสันหลังเพื่อให้แพทย์ประเมินมุมการโค้งของกระดูกสันหลังและตัดสินใจว่าจะดำเนินการ ใช้การตรวจทางการแพทย์เช่นเอกซเรย์แนวกระดูกสันหลังเพื่อให้แพทย์ประเมินมุมการโค้งของกระดูกสันหลังและตัดสินใจว่าจะดำเนินการรักษาอย่างถูกต้องต่อไป',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      'assets/img/Handdoctor.jpg',
                      height: 250,
                      width: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '3. การกายภาพบำบัดเสริมสร้างกล้ามเนื้อ',
                  style: GoogleFonts.sarabun(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '        การเสริมสร้างกล้ามเนื้อที่เกี่ยวกับการพยุงกระดูกสันหลังเช่นการกายภาพบำบัด เนื่องจากกระดูกสันหลังคด ทำให้กล้ามเนื้อบริเวณรอบข้าง ต้องรองรับกระดูกสันหลังที่ผิดปกติ ทำให้เกิดอาการปวดและอักเสบได้สำหรับผู้ที่มีภาวะกระดูกสันหลังคดในระดับที่ไม่รุนแรง การรักษาโดยการทำกายภาพบำบัดจะช่วยให้กล้ามเนื้อที่ช่วยพยุงกระดูกสันหลังทำงานได้ดีขึ้น รวมถึงการฝึกท่าทางที่เหมาะสมในการป้องกันการเกิดความเครียดต่อกระดูกสันหลังซึ่งหลังจากวินิจฉัยกับแพทย์คุณยังสามารถกายภาพบำบัดต่อไปนี้ได้',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
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
                                'assets/img/slide2.jpg',
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
                                  'การกายภาพ\nบำบัดด้วยตนเอง',
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
                                              ExerciseScreen()),
                                    );
                                  },
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
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '4. หลีกเลี่ยงพฤติกรรมเสี่ยงที่ก่อให้เกิดความเสียหายต่อกระดูกสันหลัง',
                  style: GoogleFonts.sarabun(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '        หรับผู้ที่มีภาวะกระดูกสันหลังคด หรือมีความเสี่ยง ควรหลีกเลี่ยงการทำกิจกรรมที่อาจทำให้กระดูกสันหลังได้รับภาระมากเกินไป เช่น\n\n• การยกของหนัก: ควรหลีกเลี่ยงการยกของที่มีน้ำหนักมาก เพราะอาจทำให้กล้ามเนื้อและกระดูกสันหลังได้รับความเสียหาย\n\n• การนั่งหรือลุกจากท่าทางเดิมนานเกินไป: หากต้องนั่งหรือลุกจากท่าทางเดิมนานๆ ควรพักบ่อยๆ และเปลี่ยนท่าทางบ่อยๆ เพื่อไม่ให้กระดูกสันหลังได้รับความเครียด\n\n• กิจกรรมที่ต้องบิดหรือหมุนตัวอย่างกระทันหัน: เช่น การเล่นกีฬา หรือการเคลื่อนไหวที่มีการหมุนตัวเร็ว ซึ่งอาจทำให้กล้ามเนื้อเกิดการบาดเจ็บได',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Center(
                //   child: HyperlinkText(
                //       text: "อ่านเพิ่มเติมที่นี่ อ้างอิงจาก VEJTHANI",
                //       url:
                //           "https://www.vejthani.com/th/2021/12/%E0%B8%AA%E0%B8%B4%E0%B9%88%E0%B8%87%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B8%84%E0%B8%A7%E0%B8%A3%E0%B8%97%E0%B8%B3%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%84%E0%B8%A7%E0%B8%A3%E0%B8%97/"),
                // ),
              ],
            ),
          ),
        ])));
  }
}
