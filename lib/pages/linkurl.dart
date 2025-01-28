import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HyperlinkText extends StatelessWidget {
  final String text;
  final String url;

  const HyperlinkText({super.key, required this.text, required this.url});

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "ไม่สามารถเปิด URL นี้ได้: $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          fontSize: 18,
        ),
      ),
    );
  }
}
