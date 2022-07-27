// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:track_walk_admin/colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  final storage = GetStorage();

  void toggleTheme(bool isOn, BuildContext context) async {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

 
}

class MyThemes {
  static final darkTheme = ThemeData(
    primaryColor: blueTheme,
    fontFamily: "Poppins",
    backgroundColor: bgDark,
    colorScheme: ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    primaryColor: blueTheme,
    fontFamily: "Poppins",
    colorScheme: ColorScheme.light(),
  );
}
