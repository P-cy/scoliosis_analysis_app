import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

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
                _buildExercise(
                  '1. ท่าเหยียดลำตัวไปด้านข้าง',
                  ['assets/img/IMG_2749.JPG', 'assets/img/IMG_2750.JPG'],
                  'ยืนแยกขากว้างเท่าความกว้างไหล่ ยกแขนข้างหนึ่งเหนือศีรษะแล้วเอนตัวไปด้านข้างจนรู้สึกตึง ค้างไว้ 10 วินาที ทำทั้งสองข้าง',
                  'ทำข้างละ 10 ครั้งต่อเซต วันละ 2-3 เซต',
                ),
                _buildExercise(
                  '2. ท่ายืนตรงกางแขน',
                  ['assets/img/IMG_2751.JPG'],
                  'ยืนตรง กางแขนออกด้านข้างให้มากที่สุดโดยไม่เกร็ง ค้างไว้ 10 วินาที ทั้งสองข้าง',
                  'ทำ 10 ครั้งต่อเซต วันละ 2-3 เซต',
                ),
                _buildExercise(
                  '3. ท่าบิดลำตัวไปด้านข้าง',
                  ['assets/img/IMG_2751.JPG', 'assets/img/IMG_2752.JPG'],
                  'ยืนตรง กางแขนออก แล้วบิดลำตัวไปด้านข้างจนรู้สึกตึง ค้างไว้ 10 วินาที',
                  'ทำข้างละ 10 ครั้งต่อเซต วันละ 2-3 เซต',
                ),
                _buildExercise(
                  '4. ท่าปรับแนวกระดูกสันหลังส่วนบน',
                  ['assets/img/IMG_2756.JPG'],
                  'อยู่ในท่าคลาน งอศอกวางมือไว้ที่ใบหู เอียงตัวไปด้านข้างจนรู้สึกตึงบริเวณกลางหลัง ค้างไว้ 10 วินาทีโดยทำทั้งสองข้างซ้ายขวา',
                  'ข้างละ 10 ครั้งต่อเซต วันละ 2-3 เซต',
                ),
                _buildExercise(
                  '5. ท่าโก่งหลังและแอ่นหลัง',
                  ['assets/img/IMG_2754.JPG', 'assets/img/IMG_2755.JPG'],
                  'อยู่ในท่าคลาน แขม่วท้องโก่งหลังให้มากที่สุด ค้างไว้ 10 วินาที แล้วแอ่นหลังให้มากที่สุด ค้างไว้อีก 10 วินาที',
                  'ทำ 10 ครั้งต่อเซต วันละ 2-3 เซต',
                ),
                _buildExercise(
                  '6. ท่าคลานยกแขนขาสลับ',
                  ['assets/img/IMG_2754.JPG', 'assets/img/IMG_2757.JPG'],
                  'อยู่ในท่าคลาน ยกแขนซ้ายไปข้างหน้า เหยียดขาขวาไปด้านหลังให้ตรง ค้างไว้ 10 วินาที แล้วสลับข้าง',
                  'ข้างละ 10 ครั้งต่อเซต วันละ 2-3 เซต',
                ),
                _buildClosing(),
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
                Icons.fitness_center,
                size: 70,
                color: Color(0xFF0BD8F3),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'ท่าออกกำลังกายเพื่อ',
            style: GoogleFonts.sarabun(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'เสริมความแข็งแรงกระดูกสันหลัง',
            style: GoogleFonts.sarabun(
              fontSize: 24,
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
                'ประโยชน์ของการออกกำลังกาย',
                style: GoogleFonts.sarabun(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004aad),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'การเสริมสร้างกล้ามเนื้อที่เกี่ยวกับการพยุงกระดูกสันหลังเช่นการกายภาพบำบัด เนื่องจากกระดูกสันหลังคด ทำให้กล้ามเนื้อบริเวณรอบข้าง ต้องรองรับกระดูกสันหลังที่ผิดปกติ ทำให้เกิดอาการปวดและอักเสบได้สำหรับผู้ที่มีภาวะกระดูกสันหลังคดในระดับที่ไม่รุนแรง การรักษาโดยการทำกายภาพบำบัดจะช่วยให้กล้ามเนื้อที่ช่วยพยุงกระดูกสันหลังทำงานได้ดีขึ้น',
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

  Widget _buildExercise(String title, List<String> imagePaths,
      String description, String repetition) {
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
              if (imagePaths.length == 1)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imagePaths[0],
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagePaths
                      .map((path) => Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  path,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              SizedBox(height: 15),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'คำอธิบาย: ',
                      style: GoogleFonts.sarabun(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: description,
                      style: GoogleFonts.sarabun(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'จำนวน: ',
                      style: GoogleFonts.sarabun(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: repetition,
                      style: GoogleFonts.sarabun(
                        fontSize: 14,
                        color: Colors.grey[700],
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

  Widget _buildClosing() {
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
                'ข้อแนะนำในการออกกำลังกาย',
                style: GoogleFonts.sarabun(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'ควรปฏิบัติตามท่าบริหารอย่างสม่ำเสมอ เพื่อเสริมสร้างความแข็งแรงของกระดูกสันหลัง และลดความเสี่ยงในการเกิดภาวะกระดูกสันหลังคด หากรู้สึกปวดหรือไม่สบายระหว่างการออกกำลังกาย ควรหยุดทันทีและปรึกษาแพทย์',
                textAlign: TextAlign.center,
                style: GoogleFonts.sarabun(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
