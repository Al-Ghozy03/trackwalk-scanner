// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/screen/events.dart';
import 'package:track_walk_admin/screen/list_ticket.dart';
import 'package:track_walk_admin/screen/login.dart';
import 'package:track_walk_admin/screen/qr_scanner.dart';
import 'package:track_walk_admin/service/api_service.dart';

import 'models/theme/Dark/themes.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: "popin",
          colorScheme: ThemeData().colorScheme.copyWith(primary: blueTheme)),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "popin",
          scaffoldBackgroundColor: bgDark),
      title: 'MyTask',
      home: Event(),
    );
  }
}
