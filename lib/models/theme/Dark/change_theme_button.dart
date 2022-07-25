// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:provider/provider.dart';
// import 'package:track_walk_admin/models/theme/Dark/themes.dart';

// class ChangeThemeButtonWidget extends StatefulWidget {
//   @override
//   State<ChangeThemeButtonWidget> createState() =>
//       _ChangeThemeButtonWidgetState();
// }

// class _ChangeThemeButtonWidgetState extends State<ChangeThemeButtonWidget> {
//   //  void saveData() async {
//   //   final SharedPreferences sharedPreferences =
//   //       await SharedPreferences.getInstance();
//   //   sharedPreferences.setString('username', username.text);
//   //   var obtainedUser = sharedPreferences.getString('name');
//   //   var obtainedIdUser = sharedPreferences.getInt('id');
//   // }
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     String themeDatas = "light";
//     final storage = GetStorage();
//     return Switch.adaptive(
//         value: themeProvider.isDarkMode,
//         onChanged: (value) async {
//           themeDatas = storage.read("themeDatas")!;
//           print(themeDatas);
//           // Navigator.pop(context);
//           final provider = Provider.of<ThemeProvider>(context, listen: false);
//           provider.toggleTheme(value, context);
//         });
//   }
// }
