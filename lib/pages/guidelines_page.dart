import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/exercise_page.dart';

class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({Key? key}) : super(key: key);

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
                  '1. ปรับท่าทางในการนั่ง ยืน และเดินให้เหมาะสม',
                  [
                    _buildSubsection(
                      '1.1 ท่านั่งที่ถูกต้อง',
                      [
                        'นั่งหลังตรงและให้แนวกระดูกสันหลังอยู่ในแนวธรรมชาติ ไม่เอนตัวไปด้านใดด้านหนึ่ง',
                        'ไม่นั่งไขว่ห้างเป็นเวลานาน เพราะอาจทำให้กระดูกเชิงกรานและกระดูกสันหลังเอียง',
                        'ควรให้ฝ่าเท้าวางราบกับพื้นและงอเข่าในมุม 90 องศา',
                        'หากต้องนั่งทำงานเป็นเวลานาน ควรใช้เก้าอี้ที่มีพนักพิงรองรับแผ่นหลัง และควรเปลี่ยนอิริยาบถทุก 30-60 นาที',
                      ],
                    ),
                    _buildSubsection(
                      '1.2 ท่ายืนที่เหมาะสม',
                      [
                        'ยืนให้หลังตรง ไหล่ตั้งตรง ไม่งอหรือโน้มตัวไปข้างหน้า',
                        'กระจายน้ำหนักลงบนเท้าทั้งสองข้างอย่างเท่ากัน ไม่ยืนพักขาข้างเดียวเป็นเวลานาน',
                        'หลีกเลี่ยงการยืนหลังแอ่นหรือก้มตัวมากเกินไป เพราะอาจทำให้แนวกระดูกสันหลังผิดปกติ',
                      ],
                    ),
                    _buildSubsection(
                      '1.3 ท่าเดินที่ถูกต้อง',
                      [
                        'เดินหลังตรง ศีรษะตั้งตรง และมองไปข้างหน้า ไม่ก้มหน้าหรือเอนไปด้านหลังมากเกินไป',
                        'ไม่นำไหล่ไปข้างหน้าหรือเดินเอียงไปด้านใดด้านหนึ่ง',
                        'ใส่รองเท้าที่รองรับแรงกระแทกได้ดี เพื่อลดแรงกดที่กระดูกสันหลัง',
                      ],
                    ),
                  ],
                ),
                _buildSection(
                  '2. การออกกำลังกายเพื่อเสริมสร้างกล้ามเนื้อหลังและแกนกลางลำตัว',
                  [
                    _buildSubsection(
                      '2.1 การออกกำลังกายที่ช่วยป้องกันกระดูกสันหลังคด',
                      [
                        'ว่ายน้ำเป็นการออกกำลังกายที่ดีต่อกระดูกสันหลัง เพราะช่วยเสริมสร้างกล้ามเนื้อหลังโดยไม่มีแรงกดมากเกินไป',
                        'โยคะและพิลาทิสช่วยเพิ่มความยืดหยุ่นและความแข็งแรงของกล้ามเนื้อแกนกลางลำตัว ซึ่งช่วยพยุงกระดูกสันหลังให้ตรง',
                        'การออกกำลังกายที่ฝึกความแข็งแรงของกล้ามเนื้อแกนกลางลำตัว เช่น ท่าซิทอัพ แพลงก์ และบริดจ์',
                      ],
                    ),
                    _buildSubsection(
                      '2.2 หลีกเลี่ยงพฤติกรรมที่ทำให้เกิดอาการบาดเจ็บที่หลัง',
                      [
                        'หลีกเลี่ยงการยกของหนักผิดท่า ควรใช้ขาช่วยยกแทนการก้มหลังยกของ',
                        'หลีกเลี่ยงการออกกำลังกายที่กระทบกระเทือนต่อกระดูกสันหลัง เช่น การกระโดดจากที่สูงหรือการออกกำลังกายที่ต้องบิดตัวมากเกินไป',
                      ],
                    ),
                  ],
                ),
                _buildSection(
                  '3. การใช้กระเป๋าและการแบกของหนักให้ถูกต้อง',
                  [
                    _buildSubsection(
                      '3.1 การใช้กระเป๋าสะพาย',
                      [
                        'ใช้กระเป๋าเป้สะพายสองข้างแทนกระเป๋าสะพายข้างเพื่อลดแรงกดดันที่กระดูกสันหลัง',
                        'ปรับสายสะพายให้กระเป๋าอยู่ในระดับที่เหมาะสม ไม่ควรให้กระเป๋าห้อยต่ำเกินไป',
                        'ไม่ควรใส่ของในกระเป๋ามากเกินไป น้ำหนักของกระเป๋าไม่ควรเกิน 10-15% ของน้ำหนักตัว',
                      ],
                    ),
                    _buildSubsection(
                      '3.2 การยกของหนักอย่างปลอดภัย',
                      [
                        'เวลายกของ ควรงอเข่าแล้วย่อตัวลงแทนการก้มหลัง',
                        'ถือของให้ใกล้ลำตัวและกระจายน้ำหนักให้สมดุล',
                        'หากต้องยกของหนักบ่อย ควรใช้เข็มขัดพยุงหลังหรืออุปกรณ์ช่วยยก',
                      ],
                    ),
                  ],
                ),
                _buildSection(
                  '4. โภชนาการที่ช่วยบำรุงกระดูก',
                  [
                    _buildSubsection(
                      '4.1 อาหารที่ช่วยเสริมสร้างกระดูกให้แข็งแรง',
                      [
                        'แคลเซียมเป็นสารอาหารสำคัญที่ช่วยเสริมสร้างกระดูก ควรรับประทานอาหารที่มีแคลเซียมสูง เช่น นม, ปลาเล็กปลาน้อย, เต้าหู้, ผักใบเขียว',
                        'วิตามินดีช่วยให้ร่างกายดูดซึมแคลเซียมได้ดีขึ้น สามารถรับได้จากแสงแดด หรือจากอาหาร เช่น ไข่แดง, ปลาแซลมอน, ตับ',
                        'ฟอสฟอรัสและแมกนีเซียมมีบทบาทสำคัญต่อสุขภาพกระดูก พบในถั่วต่าง ๆ และธัญพืช',
                      ],
                    ),
                    _buildSubsection(
                      '4.2 อาหารที่ควรหลีกเลี่ยง',
                      [
                        'ควรลดการบริโภคเครื่องดื่มที่มีคาเฟอีนและน้ำอัดลม เพราะอาจส่งผลต่อการดูดซึมแคลเซียม',
                        'หลีกเลี่ยงอาหารที่มีโซเดียมสูง เพราะอาจทำให้ร่างกายขับแคลเซียมออกทางปัสสาวะมากขึ้น',
                      ],
                    ),
                  ],
                ),
                _buildSection(
                  '5. การตรวจสุขภาพกระดูกสันหลังเป็นประจำ',
                  [
                    _buildSubsection(
                      '5.1 การเฝ้าระวังอาการผิดปกติ',
                      [
                        'สังเกตอาการผิดปกติของกระดูกสันหลัง เช่น ไหล่หรือสะโพกเอียง ความสูงของไหล่ทั้งสองข้างไม่เท่ากัน',
                        'หากรู้สึกปวดหลังเรื้อรังหรือมีแนวกระดูกสันหลังผิดปกติ ควรรีบพบแพทย์',
                      ],
                    ),
                    _buildSubsection(
                      '5.2 การตรวจคัดกรองในวัยเด็กและวัยรุ่น',
                      [
                        'ควรตรวจสุขภาพกระดูกสันหลังในช่วงวัยเด็กและวัยรุ่น เพราะเป็นช่วงที่ร่างกายเติบโตเร็ว',
                        'หากมีประวัติครอบครัวที่เป็นกระดูกสันหลังคด ควรได้รับการตรวจคัดกรองเป็นพิเศษ',
                      ],
                    ),
                  ],
                ),
                _buildSection(
                  '6. การนอนหลับและที่นอนที่เหมาะสม',
                  [
                    _buildSubsection(
                      '6.1 เลือกที่นอนที่รองรับแนวกระดูกสันหลัง',
                      [
                        'ที่นอนไม่ควรนิ่มเกินไปหรือแข็งเกินไป ควรเลือกที่นอนที่รองรับแนวกระดูกสันหลังได้ดี',
                        'หมอนที่ใช้ควรรองรับต้นคอได้อย่างเหมาะสม ไม่สูงหรือต่ำเกินไป',
                      ],
                    ),
                    _buildSubsection(
                      '6.2 ท่านอนที่เหมาะสม',
                      [
                        'ท่านอนที่ดีที่สุดคือนอนหงายหรือนอนตะแคง โดยอาจใช้หมอนรองใต้เข่าหรือขาเพื่อลดแรงกดที่กระดูกสันหลัง',
                        'หลีกเลี่ยงการนอนคว่ำ เพราะอาจทำให้แนวกระดูกสันหลังโค้งผิดรูป',
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
                            'ข้อแนะนำสุดท้าย',
                            style: GoogleFonts.sarabun(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'ควรปฏิบัติตามแนวทางนี้อย่างสม่ำเสมอ เนื่องจากช่วยลดความเสี่ยงในการเกิดภาวะกระดูกสันหลังคดและส่งเสริมกระดูกให้แข็งแรงอีกด้วย',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.sarabun(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExerciseScreen()),
                            ),
                            icon:
                                Icon(Icons.touch_app, color: Color(0xFF004aad)),
                            label: Text(
                              'ไปยังท่ากายภาพบำบัด',
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
                          SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                ),
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
            'แนวทางปฏิบัติเพื่อป้องกัน',
            style: GoogleFonts.sarabun(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'การเกิดภาวะกระดูกสันหลังคด',
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
                'ทำไมต้องดูแลกระดูกสันหลัง?',
                style: GoogleFonts.sarabun(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004aad),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'ภาวะกระดูกสันหลังคดสามารถเกิดขึ้นได้จากหลายปัจจัย ทั้งกรรมพันธุ์ พฤติกรรมการใช้ชีวิต และการดูแลสุขภาพที่ไม่เหมาะสม แม้ว่าปัจจัยทางพันธุกรรมจะไม่สามารถควบคุมได้ แต่การป้องกันและลดความเสี่ยงจากปัจจัยอื่น ๆ สามารถทำได้โดยการปรับพฤติกรรมให้เหมาะสมตั้งแต่เนิ่น ๆ แนวทางต่อไปนี้จะช่วยลดความเสี่ยงในการเกิดภาวะกระดูกสันหลังคดและส่งเสริมสุขภาพกระดูกสันหลังให้แข็งแรง',
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
