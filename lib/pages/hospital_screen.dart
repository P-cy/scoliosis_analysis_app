import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/hospital_info.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({super.key});

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
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
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "เลือกภูมิภาค",
              style: GoogleFonts.sarabun(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedRegion,
              hint: Text(
                "ภูมิภาค",
                style: GoogleFonts.sarabun(fontSize: 16),
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
            SizedBox(height: 16),
            if (selectedRegion != null) ...[
              Text(
                "เลือกจังหวัด",
                style: GoogleFonts.sarabun(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              DropdownButton<String>(
                value: selectedProvince,
                hint: Text(
                  "จังหวัด",
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
                      .map((clinic) => Card(
                            margin: EdgeInsets.only(bottom: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            child: ListTile(
                              title: Text(
                                clinic['name']!,
                                style: GoogleFonts.sarabun(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                clinic['address']!,
                                style: GoogleFonts.sarabun(fontSize: 14),
                              ),
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
                                        Text(
                                            "รายละเอียด: ${clinic['details']}"),
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
                            ),
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
