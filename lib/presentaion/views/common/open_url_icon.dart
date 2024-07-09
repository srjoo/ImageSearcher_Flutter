import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenUrlIcon extends StatelessWidget {
  const OpenUrlIcon({super.key, required this.url, this.icon = Icons.open_in_browser, this.color});

  final String url;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      onPressed: () { _launchUrl(); },
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}