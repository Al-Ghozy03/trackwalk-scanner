// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CheckIcon extends StatefulWidget {
  final width;
  final color;
  final jumlah;
  final title;
  const CheckIcon(
      {super.key,
      required this.width,
      required this.color,
      required this.jumlah,
      required this.title});

  @override
  State<CheckIcon> createState() => _CheckIconState();
}

class _CheckIconState extends State<CheckIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.circle,
            size: widget.width / 10,
            color: widget.color,
          ),
          SizedBox(width: widget.width / 30),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  widget.jumlah,
                  style: TextStyle(
                      fontFamily: "popinsemi", fontWeight: FontWeight.bold),
                  presetFontSizes: [widget.width / 23, 10, 14],
                ),
              ],
            ),
          ),
          SizedBox(width: widget.width / 100),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  widget.title,
                  style: TextStyle(
                      fontFamily: "popinsemi", fontWeight: FontWeight.w300),
                  presetFontSizes: [widget.width / 25, 10, 14],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
