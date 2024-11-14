import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoliosis_analysis_app/pages/info_screen.dart';

class InformationScreen extends StatelessWidget {
  final List<Map<String, String>> listinfo = [
    {
      'image': 'assets/img/spine.png',
      'title': 'กระดูกสันหลัง',
    },
    {'image': 'assets/img/scoliosis.png', 'title': 'โรคกระดูกสันหลังคด'},
  ];

  final colorg = const Color(0xFF0AC174);

  InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: colorg,
        title: Text(
          "ข้อมูล",
          style: GoogleFonts.ibmPlexSansThai(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            centerTitle: true,
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(300),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(bottom: Radius.circular(1000)),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.3),
                          BlendMode.srcATop,
                        ),
                        child: Image.asset(
                          'assets/img/spine.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0, 6),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ข้อมูลเกี่ยวกับกระดูกสันหลัง',
                            style: GoogleFonts.ibmPlexSansThai(
                              color: Colors.black87,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'กระดูกสันหลังเป็นโครงสร้างสำคัญที่ช่วยพยุงร่างกาย\n'
                            'และปกป้องไขสันหลัง ซึ่งเป็นส่วนของระบบประสาทที่\n'
                            'เชื่อมต่อสมองกับส่วนต่าง ๆ ของร่างกาย',
                            style: GoogleFonts.ibmPlexSansThai(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SpineInfoScreen()),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ScoliosisInfoScreen()),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF74AEEF), Color(0xFF4B88D2)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                listinfo[index]['image']!,
                                width: 125,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listinfo[index]['title']!,
                                    style: GoogleFonts.ibmPlexSansThai(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "รายละเอียดเพิ่มเติม",
                                        style: GoogleFonts.ibmPlexSansThai(
                                          color: Colors.white70,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.format_align_justify_rounded,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
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
