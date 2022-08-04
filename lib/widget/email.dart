// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Email extends StatefulWidget {
  final data;
  final width;
  const Email({super.key, required this.data, required this.width});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  String email = "";

  @override
  void initState() {
    email = widget.data["customerEmail"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters(<String, String>{
        'subject': '',
      }),
    );
    return _info(
        "Email",
        (widget.data["customerEmail"] != "")
            ? widget.data["customerEmail"]
            : "Nan",
        widget.width,
        emailLaunchUri);
  }
}

Widget _info(String title, String value, width, lauch) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(color: grayText, fontSize: width / 25),
      ),
      InkWell(
        onTap: () {
          launchUrl(lauch);
        },
        child: Text(
          (value == "") ? "Nan" : value,
          style: TextStyle(fontSize: width / 25, color: blueTheme),
        ),
      ),
    ],
  );
}
