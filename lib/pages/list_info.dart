import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/info_screen.dart';

class ListInfo extends StatefulWidget {
  _ListInfoState createState() => _ListInfoState();
}

class _ListInfoState extends State<ListInfo> with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  // ignore: unused_field
  double _opacity = 0.0;

  final List<Map<String, String>> listinfo = [
    {'image': 'assets/img/spine.png', 'title': 'กระดูกสันหลัง'},
    {'image': 'assets/img/scoliosis.png', 'title': 'โรคกระดูกสันหลังคด'},
  ];

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      setState(() {
        _opacity = offset / 250; 
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/img/spine.png',
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 16,
                        bottom: 16,
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8), // โปร่งแสง
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ข้อมูลเกี่ยวกับกระดูกสันหลัง',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'กระดูกสันหลังเป็นโครงสร้างสำคัญที่ช่วยพยุงร่างกาย\n'
                                'และปกป้องไขสันหลัง ซึ่งเป็นส่วนของระบบประสาทที่\n'
                                'เชื่อมต่อสมองกับส่วนต่าง ๆ ของร่างกาย',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 150,
                    child: Card(
                      elevation: 8,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF74AEEF), Color(0xFF4B88D2)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          leading: Hero(
                            tag: 'hero-tag-${listinfo[index]['title']}',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                listinfo[index]['image']!,
                                width: 80,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          title: Text(
                            listinfo[index]['title']!,
                            style: GoogleFonts.ibmPlexSansThai(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                  blurRadius: 4.0,
                                  color: Colors.black45,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                          trailing: Icon(Icons.format_align_justify_rounded,
                              color: Colors.white),
                          onTap: () {
                            if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SpineInfoScreen()),
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScoliosisInfoScreen()),
                    );
                  }
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: listinfo.length,
            ),
          ),
        ],
      ),
    );
  }
}
