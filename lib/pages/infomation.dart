import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0AC174),
        title: Text("ข้อมูล"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Image.asset('assets/spine_image1.png'), // ใส่รูปภาพที่ต้องการ
            title: Text('กระดูกสันหลัง'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // โค้ดสำหรับเปิดหน้ารายละเอียด
            },
          ),
          ListTile(
            leading: Image.asset('assets/spine_image2.png'),
            title: Text('กระดูกสันหลังคด'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // โค้ดสำหรับเปิดหน้ารายละเอียด
            },
          ),
        ],
      ),
    );
  }
}