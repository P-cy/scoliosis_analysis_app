// ignore_for_file: deprecated_member_use

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
            fontSize: 26,
            fontWeight: FontWeight.w600,
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "เลือกภูมิภาค",
                        style: GoogleFonts.sarabun(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF004aad),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: DropdownButton<String>(
                          value: selectedRegion,
                          hint: Text(
                            "ภูมิภาค",
                            style: GoogleFonts.sarabun(fontSize: 16),
                          ),
                          isExpanded: true,
                          underline: Container(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedRegion = newValue;
                              selectedProvince = null;
                            });
                          },
                          items: regions.keys.map((String region) {
                            return DropdownMenuItem<String>(
                              value: region,
                              child: Text(
                                region,
                                style: GoogleFonts.sarabun(fontSize: 16),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      if (selectedRegion != null) ...[
                        SizedBox(height: 20),
                        Text(
                          "เลือกจังหวัด",
                          style: GoogleFonts.sarabun(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF004aad),
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: DropdownButton<String>(
                            value: selectedProvince,
                            hint: Text(
                              "จังหวัด",
                              style: GoogleFonts.sarabun(fontSize: 16),
                            ),
                            isExpanded: true,
                            underline: Container(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedProvince = newValue;
                              });
                            },
                            items: regions[selectedRegion]!
                                .keys
                                .map((String province) {
                              return DropdownMenuItem<String>(
                                value: province,
                                child: Text(
                                  province,
                                  style: GoogleFonts.sarabun(fontSize: 16),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (selectedRegion != null && selectedProvince != null)
                Expanded(
                  child: ListView(
                    children: regions[selectedRegion]![selectedProvince]!
                        .map((clinic) => Card(
                              margin: EdgeInsets.only(bottom: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 3,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      title: Text(
                                        clinic['name']!,
                                        style: GoogleFonts.sarabun(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF004aad),
                                        ),
                                      ),
                                      content: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          _buildInfoRow(
                                            Icons.location_on,
                                            "ที่อยู่",
                                            clinic['address']!,
                                          ),
                                          SizedBox(height: 16),
                                          _buildInfoRow(
                                            Icons.info_outline,
                                            "รายละเอียด",
                                            clinic['details']!,
                                          ),
                                          SizedBox(height: 16),
                                          _buildInfoRow(
                                            Icons.web,
                                            "เว็บไซต์",
                                            clinic['website']!,
                                          ),
                                          SizedBox(height: 12),
                                          Center(
                                            child: ElevatedButton.icon(
                                              icon: Icon(Icons.open_in_new),
                                              label: Text("เปิดเว็บไซต์"),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xFF0BD8F3),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 12,
                                                ),
                                              ),
                                              onPressed: () => _launchURL(
                                                  clinic['website']!),
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text(
                                            "ปิด",
                                            style: GoogleFonts.sarabun(
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF0BD8F3)
                                              .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Icon(
                                          Icons.local_hospital,
                                          color: Color(0xFF0BD8F3),
                                          size: 28,
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              clinic['name']!,
                                              style: GoogleFonts.sarabun(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              clinic['address']!,
                                              style: GoogleFonts.sarabun(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey[400],
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: Color(0xFF0BD8F3),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.sarabun(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: GoogleFonts.sarabun(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
