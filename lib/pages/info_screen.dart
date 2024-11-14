import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpineInfoScreen extends StatelessWidget {
  const SpineInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ข้อมูลเกี่ยวกับกระดูกสันหลัง",
          style: GoogleFonts.ibmPlexSansThai(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        backgroundColor: const Color(0xFF0AC174),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ข้อมูลทั่วไปเกี่ยวกับกระดูกสันหลังคด',
                style: GoogleFonts.ibmPlexSansThai(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[800]),
              ),
              const SizedBox(height: 10),
              Text(
                'คนที่มีกระดูกสันหลังปกติจะมีโครงสร้างสันหลังที่เป็นแนวตรงในมุมด้านข้าง และจะมีโค้งตามธรรมชาติในมุมมองด้านข้างอยู่ใน 3 ส่วน คือ ส่วนคอ (cervical curve) ส่วนอก (thoracic curve) และส่วนหลังล่าง (lumbar curve) ซึ่งเป็นการโค้งที่มีวัตถุประสงค์เพื่อช่วยในการรองรับน้ำหนักของร่างกายและลดแรงกระแทก',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'ในคนที่มีกระดูกสันหลังปกติจะไม่เกิดการคดเคี้ยวของกระดูกสันหลังในแนวด้านข้าง ทำให้ลำตัวและรูปร่างดูสมดุล และไม่มีความผิดปกติในการเคลื่อนไหวหรือทำกิจกรรมประจำวัน',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'อาการของคนที่ไม่เป็นกระดูกสันหลังคด',
                style: GoogleFonts.ibmPlexSansThai(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'คนที่ไม่เป็นกระดูกสันหลังคดจะไม่มีอาการผิดปกติใด ๆ ที่เกี่ยวข้องกับกระดูกสันหลังโดยตรง อย่างไรก็ตาม หากมีอาการปวดหลังหรือรู้สึกไม่สบาย อาจเกิดจากสาเหตุอื่น เช่น',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              Text(
                '1. การนั่งหรือยืนท่าทางไม่เหมาะสม - อาจทำให้เกิดการเมื่อยล้าหรือปวดกล้ามเนื้อ\n2. การบาดเจ็บจากการทำกิจกรรม - เช่น การยกของหนักหรือการเคลื่อนไหวที่ผิดวิธี\n3. การเสื่อมของหมอนรองกระดูก - ซึ่งเป็นกระบวนการธรรมชาติที่เกิดขึ้นตามอายุ\n4. การกดทับเส้นประสาท - แม้ว่ากระดูกสันหลังจะไม่คด แต่เส้นประสาทอาจถูกกดทับจากสาเหตุอื่น ๆ ได้',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'การวินิจฉัย',
                style: GoogleFonts.ibmPlexSansThai(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'แม้ว่าคนที่มีกระดูกสันหลังปกติจะไม่จำเป็นต้องมีการวินิจฉัยเฉพาะทาง แต่ในกรณีที่มีอาการปวดหลังหรือมีความกังวลเกี่ยวกับสุขภาพกระดูกสันหลัง แพทย์อาจทำการวินิจฉัยด้วยวิธีต่าง ๆ เช่น',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              Text(
                '1. การชักประวัติและตรวจร่างกาย\n2. การเอกซเรย์ (X-ray)\n3. MRI หรือ CT Scan',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'การป้องกันปัญหากระดูกสันหลัง',
                style: GoogleFonts.ibmPlexSansThai(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'ถึงแม้ว่าคนที่มีกระดูกสันหลังปกติจะไม่มีปัญหาด้านโครงสร้าง แต่ยังควรดูแลสุขภาพกระดูกสันหลังเพื่อป้องกันปัญหาในอนาคต ดังนี้',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              Text(
                '1. การนั่งและยืนในท่าทางที่ถูกต้อง\n2. ออกกำลังกายเพื่อเสริมสร้างกล้ามเนื้อหลังและหน้าท้อง\n3. การยกของอย่างถูกวิธี\n4. พักผ่อนและเปลี่ยนท่าทางบ่อย ๆ\n5. นอนบนที่นอนที่รองรับกระดูกสันหลัง',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoliosisInfoScreen extends StatelessWidget {
  const ScoliosisInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลเกี่ยวกับโรคกระดูกสันหลังคด',
        style: GoogleFonts.ibmPlexSansThai(
        fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white)),
        backgroundColor: const Color(0xFF0AC174),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'สันหลังคด (Scoliosis)',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'สันหลังคดคือภาวะที่กระดูกสันหลังมีความโค้งผิดปกติ ซึ่งโดยทั่วไปกระดูกสันหลังของคนปกติจะเป็นเส้นตรงเมือมองจากด้านหน้าและด้านหลัง แต่ในผู้ที่มีสันหลังคด กระดูกสันหลังจะโค้งไปทางด้านข้างเป็นรูปตัว "C" หรือ "S" โดยสามารถเกิดขึ้นได้ในระดับของกระดูกสันหลังต่าง ๆ ตั้งแต่บริเวณทรวงอกไปจนถึงเอว',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'ข้อมูลทั่วไป:',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '- พบได้ในทุกเพศทุกวัย แต่พบได้บ่อยในเด็กวัยรุ่นหญิง\n- สันหลังคดอาจเป็นภาวะที่เกิดขึ้นตั้งแต่แรกเกิด (congenital scoliosis) หรือพัฒนาขึ้นในช่วงวัยรุ่น (adolescent idiopathic scoliosis)\n- อาจมีระดับความรุนแรงแตกต่างกันไปตั้งแต่โค้งเล็กน้อยจนถึงโค้งรุนแรงที่ส่งผลต่อการทำงานของอวัยวะต่าง ๆ',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'สาเหตุ:',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '- ไม่ทราบสาเหตุที่ชัดเจน: กรณีส่วนใหญ่ของสันหลังคดเกิดขึ้นโดยไม่มีสาเหตุที่แน่ชัด (idiopathic scoliosis)\n- กรรมพันธุ์: อาจมีปัจจัยทางพันธุกรรมเกี่ยวข้อง\n- ความผิดปกติแต่กำเนิด: ในบางกรณีเกิดจากความผิดปกติของกระดูกสันหลังตั้งแต่กำเนิด\n- การบาดเจ็บหรือโรค: การบาดเจ็บที่กระดูกสันหลังหรือโรคเนื้อเยื่อเกี่ยวพัน ก็อาจทำให้เกิดสันหลังคดได้',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'อาการ:',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '- มักไม่แสดงอาการในระยะแรก แต่เมื่อสันหลังคดเริ่มชัดเจน อาจมีอาการเช่น\nไหล่หรือสะโพกไม่เท่ากัน \nตัวเอียงไปด้านหนึ่งเมื่อยืนตรง \nอาการปวดหลังหรือปวดที่กระดูกสันหลัง \nและในบางกรณีอาจหายใจลำบากหากการโค้งรุนแรงมาก',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'การวินิจฉัย:',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '- การตรวจร่างกาย: แพทย์จะตรวจสอบการวางตัวของกระดูกสันหลัง และสังเกตความสมดุลของไหล่และสะโพก\n- การถ่ายภาพเอ็กซเรย์: ใช้เพื่อดูความรุนแรงและมุมของการโค้ง\n- MRI หรือ CT Scan: อาจใช้ในบางกรณีเพื่อหาสาเหตุที่เป็นไปได้ เช่น ความผิดปกติของเส้นประสาทหรือเนื้อเยื่อ',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'การรักษา:',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '1. การติดตามอาการ: ในกรณีที่การโค้งมีความรุนแรงน้อย แพทย์อาจแนะนำให้ติดตามดูอาการเป็นระยะ โดยไม่จำเป็นต้องรักษาทันที\n2. การใส่เสื้อพยุง (Brace): หากการโค้งยังอยู่ในช่วงวัยเจริญเติบโต การใส่เสื้อพยุงอาจช่วยหยุดหรือชะลอการโค้งที่มากขึ้น\n3. การผ่าตัด: ในกรณีที่การโค้งมีความรุนแรง หรือส่งผลต่อการทำงานของอวัยวะภายใน แพทย์อาจแนะนำให้ผ่าตัดเพื่อปรับแนวกระดูกสันหลัง\n4. การทำกายภาพบำบัด: การออกกำลังกายที่เหมาะสมและการทำกายภาพบำบัดอาจช่วยลดความเจ็บปวด และเสริมสร้างกล้ามเนื้อรอบกระดูกสันหลังให้แข็งแรง',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'การป้องกัน:',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '- ไม่มีวิธีการป้องกันที่แน่นอน: เนื่องจากสาเหตุของสันหลังคดส่วนใหญ่มักไม่ทราบแน่ชัด แต่การรักษาร่างกายให้แข็งแรง การตรวจร่างกายเป็นประจำในช่วงวัยเจริญเติบโต อาจช่วยตรวจพบภาวะนี้ในระยะแรกเริ่ม',
                style: GoogleFonts.ibmPlexSansThai(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
