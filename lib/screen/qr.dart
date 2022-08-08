import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:track_walk_admin/colors.dart';

class QR2 extends StatefulWidget {
  const QR2({Key key}) : super(key: key);

  @override
  State<QR2> createState() => _QR2State();
}

class _QR2State extends State<QR2> {
   final qrkey = GlobalKey(debugLabel: "QR");
  // Barcode barcode;
  // QRViewController controller;
  String hasil;
  Timer timer;
  final arguments = Get.arguments;
  bool isLoading = false;
  ProgressDialog progressDialog;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = Get.height;
    final themeData = Theme.of(context).brightness == ui.Brightness.dark
        ? "DarkTheme"
        : "LightTheme";
    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal,showLogs: true);
    progressDialog?.style(
      
      progressWidget: Container(
          padding: EdgeInsets.all(15.0), child: CircularProgressIndicator()),
      borderRadius: 10.0,
      backgroundColor: themeData == "DarkTheme" ? bgDark : Colors.white,
      insetAnimCurve: Curves.easeInOut,
      messageTextStyle: TextStyle(
          color: themeData == "DarkTheme" ? Colors.white : Colors.black,
          fontSize: 13.0,
          fontWeight: FontWeight.w400),
    );
    return Container();
  }
}