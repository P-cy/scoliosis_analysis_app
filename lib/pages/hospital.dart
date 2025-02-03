import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({super.key});

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  String? selectedRegion;
  String? selectedProvince;
  Map<String, Map<String, List<Map<String, String>>>> regions = {
    'ภาคตะวันออกเฉียงเหนือ': {
      'กาฬสินธุ์': [
        {
          'name': 'โรงพยาบาลกาฬสินธุ์',
          'address':
              'ถนนเลี่ยงเมืองสงเปลือย ตำบลกาฬสินธุ์ อำเภอเมืองกาฬสินธุ์ จังหวัดกาฬสินธุ์ 46000',
          'website': 'https://www.klsh.go.th/',
          'details':
              'โรงพยาบาลกาฬสินธุ์มีคลินิกศัลยกรรมกระดูกและข้อที่ให้บริการตรวจและรักษาอาการกระดูกสันหลังคด'
        },
        {
          'name': 'คลินิกกระดูกและข้อหมอปิยพันธุ์',
          'address': '152 ถนนภิรมย์ อำเภอเมืองกาฬสินธุ์ จังหวัดกาฬสินธุ์ 46000',
          'website':
              'https://www.facebook.com/Clinic.Ortho.Piyapan.Kalasin.Doctor/',
          'details':
              'คลินิกนี้ให้บริการตรวจวินิจฉัยและรักษาโรคเกี่ยวกับกระดูกและข้อ รวมถึงอาการกระดูกสันหลังคด'
        },
      ],
      'ขอนแก่น': [
        {
          'name': 'โรงพยาบาลศรีนครินทร์ (Srinagarind Hospital)',
          'address': 'ถนนมิตรภาพ อำเภอเมือง จังหวัดขอนแก่น 40000',
          'website': 'https://www.smckku.com/',
          'details':
              'โรงพยาบาลศรีนครินทร์มีคลินิกเฉพาะทางด้านกระดูกและข้อที่ให้บริการตรวจและรักษาอาการกระดูกสันหลังคด'
        },
      ]
    },
    'ภาคกลาง': {
      'กรุงเทพมหานคร (เขตปกครองพิเศษ)': [
        {
          'name': 'โรงพยาบาลกรุงเทพ (Bangkok Hospital)',
          'address':
              'ที่อยู่: เลขที่ 2 ซอยศูนย์วิจัย 7 ถนนเพชรบุรีตัดใหม่ แขวงบางกะปิ เขตห้วยขวาง กรุงเทพมหานคร 10310',
          'website': 'https://www.bangkokhospital.com/',
          'details':
              ' โรงพยาบาลกรุงเทพมีศูนย์กระดูกสันหลังที่ให้บริการตรวจวินิจฉัยและรักษาอาการกระดูกสันหลังคด โดยทีมแพทย์ผู้เชี่ยวชาญและอุปกรณ์ทางการแพทย์ที่ทันสมัย'
        },
      ]
    }
  };

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          "โรงพยาบาล",
          style: GoogleFonts.sarabun(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedRegion,
              hint: Text(
                "เลือกภูมิภาค",
                style: GoogleFonts.sarabun(
                  fontSize: 16,
                ),
              ),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedRegion = newValue;
                  selectedProvince = null;
                });
              },
              items: regions.keys.map((String region) {
                return DropdownMenuItem<String>(
                  value: region,
                  child: Text(region),
                );
              }).toList(),
            ),
            if (selectedRegion != null) ...[
              DropdownButton<String>(
                value: selectedProvince,
                hint: Text(
                  "เลือกจังหวัด",
                  style: GoogleFonts.sarabun(fontSize: 16),
                ),
                isExpanded: true,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedProvince = newValue;
                  });
                },
                items: regions[selectedRegion]!.keys.map((String province) {
                  return DropdownMenuItem<String>(
                    value: province,
                    child: Text(province),
                  );
                }).toList(),
              ),
            ],
            SizedBox(height: 20),
            if (selectedRegion != null && selectedProvince != null)
              Expanded(
                child: ListView(
                  children: regions[selectedRegion]![selectedProvince]!
                      .map((clinic) => ListTile(
                            title: Text(clinic['name']!),
                            subtitle: Text(clinic['address']!),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(clinic['name']!),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("ที่อยู่: ${clinic['address']}"),
                                      SizedBox(height: 10),
                                      Text("รายละเอียด: ${clinic['details']}"),
                                      SizedBox(height: 10),
                                      Text("เว็บไซต์: ${clinic['website']}"),
                                      TextButton(
                                        child: Text("เปิดเว็บไซต์"),
                                        onPressed: () {
                                          _launchURL(clinic['website']!);
                                        },
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text("ปิด"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ))
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
