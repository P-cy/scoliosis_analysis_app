import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/linkurl.dart';

class SpineInfoScreen extends StatefulWidget {
  const SpineInfoScreen({super.key});

  @override
  State<SpineInfoScreen> createState() => _SpineInfoScreenState();
}

class _SpineInfoScreenState extends State<SpineInfoScreen> {
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
                                  'assets/img/back-bone.jpg',
                                  height: 180,
                                  width: 270,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'โรคกระดูก สันหลังคด',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.sarabun(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'ปัญหาที่ควรได้รับการรักษา...',
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
                  '1. สาเหตุ การเกิดโรคกระดูกสันหลังคด',
                  style: GoogleFonts.sarabun(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '        กระดูกสันหลังคด เป็นโรคที่สามารถเกิดได้ในทุกวัย และเกิดได้จากหลายๆ สาเหตุ ดังนี้',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '1) ความผิดปกติของการเจริญเติบโตกระดูกสันหลังแต่กำเนิด (Congenital Scoliosis) เป็นความผิดปกติของกระดูกสันหลังตั้งแต่ก่อนคลอด โดยเป็นความผิดปกติจากพัฒนาการของทารกในครรภ์ ไม่ว่าจะเป็นการสร้างของกระดูกสันหลังเพียงด้านเดียว หรือการสร้างของกระดูกสันหลังที่ไม่แยกจากกัน ส่งผลให้เกิดกระดูกสันหลังคดตั้งแต่กำเนิด ซึ่งกระดูกสันหลังคดในลักษณะนี้ก่อให้เกิดความผิดปกติมาก ผู้ป่วยมักจะต้องรีบเข้ารับการรักษา',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '2) ความผิดปกติของระบบประสาทกล้ามเนื้อ (Neuromuscular Scoliosis) เป็นกระดูกสันหลังคดที่เกิดจากโรคทางระบบประสาทหรือกล้ามเนื้อของคนไข้ที่มีความผิดปกติ ทำให้เกิดความไม่สมดุลต่อกระดูกสันหลัง ส่งผลให้กระดูกสันหลังคด ที่พบบ่อย เช่น คนไข้มีอาการขาดเลือดทางสมองแต่กำเนิด (Cerebral Palsy) ทำให้เกิดโรคกระดูกสันหลังคดตอนโตได้ หรือคนไข้ที่เป็นโรคกล้ามเนื้ออ่อนแรง (Muscular Dystrophy) สามารถทำให้เกิดโรคกระดูกสันหลังคดได้',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '3) ความเสื่อมของข้อกระดูก (Degenerative Scoliosis) เป็นสาเหตุที่พบได้บ่อยที่สุดของคนไข้สูงอายุที่มีภาวะกระดูกสันหลังคด โดยสาเหตุกลุ่มนี้เกิดจากความเสื่อมของข้อกระดูกสันหลัง หรือหมอนรองกระดูกสันหลังด้านซ้ายกับขวาไม่เท่ากัน ทำให้เกิดการทรุดตัวของข้อกระดูกสันหลังด้านซ้ายขวาไม่เท่ากัน จึงทำให้เกิดกระดูกสันหลังคด',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '4) กระดูกสันหลังคดแบบไม่ทราบสาเหตุ (Idiopathic Scoliosis) เป็นสาเหตุที่พบได้บ่อยที่สุดของคนไข้เด็กที่มีภาวะกระดูกสันหลังคด โดยกลุ่มนี้จะไม่ทราบสาเหตุที่แน่ชัด ไม่พบความผิดปกติของกระดูก หมอนรองกระดูก หรือกล้ามเนื้อ การวินิจฉัยกระดูกสันหลังคดในเด็กกลุ่มนี้จะวินิจฉัยโดยต้องค้นหาสาเหตุอื่นๆ ก่อน โดยถ้าไม่พบความผิดปกติจากสาเหตุอื่นๆ ข้างต้น จะจัดผู้ป่วยกระดูกสันหลังคดในเด็กเข้าในกลุ่มนี้',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '2. กระดูกสันหลังคดและผลที่เกิดขึ้น',
                  style: GoogleFonts.sarabun(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '        กระดูกสันหลังคดเป็นโรคที่สามารถเกิดอาการขึ้นได้กับคนทุกกลุ่ม ตั้งแต่เด็กเล็ก ผู้ใหญ่ ไปจนถึงผู้สูงอายุ ซึ่งในแต่ละช่วงวัยก็จะมีปัจจัยต่างๆ ที่ทำให้เกิดปัญหาอาการกระดูกสันหลังคดต่างกันไป\n \nในเด็กเล็ก (0-5 ปี) มักจะเกิดจากปัญหากระดูกสันหลังคด ที่เกิดจากความผิดปกติแต่กำเนิดของกระดูก (Congenital Scoliosis) โดยกลุ่มนี้มักจะสังเกตได้ตั้งแต่อายุน้อย หรืออาจพบได้โดยบังเอิญจากภาพถ่ายรังสีส่วนอื่นๆ ซึ่งเป็นกลุ่มที่เมื่อพบแล้ว ต้องหาความผิดปกติของระบบอื่นๆ ที่อาจพบร่วมด้วย เช่น ความผิดปกติของไต ความผิดปกติของหัวใจ เป็นต้น\n \nในวัยรุ่น (10-15 ปี) มักจะพบโรคกระดูกสันหลังคดแบบไม่ทราบสาเหตุ (Idiopathic Scoliosis) มากที่สุด โดยในช่วงที่เด็กกำลังจะเข้าสู่วัยรุ่น จะเป็นช่วงที่กระดูกจะเจริญเติบโตและเด็กจะมีส่วนสูงเพิ่มขึ้นอย่างรวดเร็ว ในช่วงนี้จะเป็นช่วงที่ผู้ปกครองต้องเฝ้าระวัง เนื่องจากจะเป็นช่วงเวลาที่กระดูกสันหลังคดกลุ่มนี้จะมีมุมที่เพิ่มมากขึ้นได้เร็ว\n \nในผู้สูงอายุ (> 50 ปี) ส่วนใหญ่แล้วเกิดปัญหากระดูกสันหลังคด มาจากสาเหตุกระดูกสันหลังเสื่อม เนื่องจากข้อกระดูกที่ใช้งานมานานเกิดการเสื่อมสภาพ โดยเมื่อข้อกระดูกด้านซ้ายกับขวา เสื่อมสภาพไม่เท่ากัน หรือเกิดการทรุดของหมอนรองกระดูกไม่เท่ากัน จะส่งผลให้เกิดโรคกระดูกสันหลังคดจากความเสื่อม ที่สำคัญคือ ผู้ป่วยกลุ่มนี้มักจะพบภาวะกระดูกสันหลังกดทับเส้นประสาทร่วมด้วย ซึ่งนอกจากอาการกระดูกสันหลังคดแล้ว ยังพบอาการจากโรคกระดูกทับเส้นประสาท เช่น ปวดหลัง และร้าวลงขา ขาชา อ่อนแรง ร่วมด้วย ',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '3. สัญญาณเบื้องต้นของปัญหากระดูกสันหลังคดที่สังเกตได้',
                  style: GoogleFonts.sarabun(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '        ลักษณะอาการและความรุนแรงของโรคกระดูกสันหลังคดนั้นจะแตกต่างกันออกไปในแต่ละคน และสิ่งที่ร่างกายแสดงออกมาก็ต่างกันด้วย สำหรับลักษณะเบื้องต้นที่สามารถสังเกตได้ มีดังนี้',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '• ไหล่ทั้งสองข้างสูงไม่เท่ากัน\n• ลำตัวเอียงไปด้านใดด้านหนึ่ง\n• เวลายืนหรือเดินสะโพกหรือเชิงกรานทั้งสองข้างไม่เท่ากัน\n• แผ่นหลังหรือหน้าอกนูนไม่เท่ากัน\n• มองเห็นกระดูกสันหลังคดงอชัดเจน',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'การสังเกตอาการของโรคกระดูกสันหลังคดจากสัญญาณเบื้องต้น ถ้ากระดูกสันหลังคดไม่มาก อาจจะสังเกตด้วยตัวเองได้ยาก ต้องให้คนใกล้ตัวช่วยสังเกตลักษณะอาการของผู้ป่วยจากด้านหลัง โดยการตรวจที่เรียกว่า (Forward Bending Test) โดยให้คนไข้ก้มหลังแล้ว ให้สังเกตว่าหลังด้านซ้ายขวาจะนูนเท่ากันหรือไม่ หรือเอวทั้งสองข้างนูนเท่ากันหรือไม่ โดยปกตินั้น เมื่อก้มหลังแล้วสังเกตจากด้านหลัง ไม่ว่าจะช่วงอกหรือเอว ก็ควรจะอยู่ในระนาบเดียวกัน หากมีลักษณะของโรคกระดูกสันหลังคด เมื่อก้มหลังแล้ว หลังด้านซ้ายขวาจะนูนไม่เท่ากัน ดังรูป',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/img/KDMS-May1-5-1024x576.jpg',
                      height: 200,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'นอกจากนี้ ผู้ป่วยยังสามารถสังเกตตัวเองได้จากลักษณะที่เปลี่ยนไปของร่างกาย ได้แก่ สะโพกหรือเชิงกรานที่ไม่เท่ากัน ไหล่ทั้งสองข้างสูงไม่เท่ากัน หรือสังเกตตนเองขณะยืนหรือเดินก็ได้เช่นกัน',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '4. การวินิจฉัยหาโรคกระดูกสันหลังคด',
                  style: GoogleFonts.sarabun(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '        เมื่อสังเกตอย่างคร่าวๆ แล้วสงสัยว่ามีปัญหากระดูกสันหลังคด ควรเข้าปรึกษาแพทย์ที่เชี่ยวชาญ เพื่อทำการวินิจฉัยและได้ผลการวินิจฉัยที่ชัดเจน สำหรับการวินิจฉัยหาโรคกระดูกสันหลังคดนั้น มีขั้นตอน ดังนี้',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '        เมื่อสังเกตอย่างคร่าวๆ แล้วสงสัยว่ามีปัญหากระดูกสันหลังคด ควรเข้าปรึกษาแพทย์ที่เชี่ยวชาญ เพื่อทำการวินิจฉัยและได้ผลการวินิจฉัยที่ชัดเจน สำหรับการวินิจฉัยหาโรคกระดูกสันหลังคดนั้น มีขั้นตอน ดังนี้',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  '        แพทย์จะทำการตรวจร่างกาย ตรวจความยาวของขาทั้งสองข้าง ตรวจไหล่ทั้งสองข้างว่าอยู่ในระดับเดียวกันหรือไม่ ตรวจกระดูกสันหลังว่ามีความผิดปกติอะไรบ้าง ที่สำคัญคือ การตรวจความผิดปกติทางระบบประสาท เพื่อตรวจหารอยโรคของไขสันหลังที่อาจพบร่วมกันได้ ',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  '        ต่อมาจะทำการส่งภาพถ่ายรังสี โดยหากพบมุมในภาพถ่ายรังสีที่คดเอียงมากกว่า 10 องศา แพทย์ก็จะวินิจฉัยว่าเป็นโรคกระดูกสันหลังคด',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  '        หลังจากที่วินิจฉัยว่าเป็นโรคกระดูกสันหลังคดแล้ว แพทย์ผู้เชี่ยวชาญจะพิจารณาต่อไป ว่ามีความจำเป็นต้องส่งตรวจอย่างอื่นต่อหรือไม่ เช่น การตรวจการทำงานของปอด (Pulmonary Function Test) การตรวจด้วยเครื่องเอกซเรย์แม่เหล็กไฟฟ้า (MRI) เพื่อตรวจหารอยโรคของไขสันหลัง และเส้นประสาท การตรวจสแกนคอมพิวเตอร์ (CT Scan) เพื่อตรวจสอบขนาดของกระดูกสำหรับวางแผนการผ่าตัดให้ชัดเจนต่อไป',
                  style: GoogleFonts.sarabun(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: HyperlinkText(
                      text: "อ่านเพิ่มเติมที่นี่ อ้างอิงจาก KDMS",
                      url:
                          "https://kdmshospital.com/article/symptoms-and-treatment-of-scoliosis/"),
                ),
              ],
            ),
          ),
        ])));
  }
}
