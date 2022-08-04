import 'package:flutter/material.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service/url_service.dart';

class Phone extends StatefulWidget {
  final data;
  final width;
  const Phone({super.key, required this.data, required this.width});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  String phone = "";

  @override
  void initState() {
    phone = widget.data["customerPhone"];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _info(
      "Phone",
      (widget.data["customerPhone"] != "")
          ? widget.data["customerPhone"]
          : "Nan",
      widget.width, phone
    );
  }
}

Widget _info(String title, String value, width, phone) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(color: grayText, fontSize: width / 25),
      ),
      InkWell(
        onTap: () {
          launch('tel: $phone');
        },
        child: Text(
          (value == "") ? "Nan" : value,
          style: TextStyle(fontSize: width / 25, color: blueTheme),
        ),
      ),
    ],
  );
}
