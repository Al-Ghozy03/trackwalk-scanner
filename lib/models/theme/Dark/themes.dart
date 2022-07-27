import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:track_walk_admin/colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  final storage = GetStorage();
  // bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn, BuildContext context) async {
    // var themeDatas2 = sharedPreferences.getString("themeDatas");

    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
  
class MyThemes {
  static final darkTheme = ThemeData(
    // scaffoldBackgroundColor: ,
    primaryColor: blueTheme,
    fontFamily: "Poppins",
    colorScheme: const ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    // scaffoldBackgroundColor: kBackgroundColor,
    primaryColor: blueTheme,
    fontFamily: "Poppins",
    colorScheme: const ColorScheme.light(),
  );
}
