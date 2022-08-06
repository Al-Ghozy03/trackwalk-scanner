// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_local_variable, avoid_print, deprecated_member_use, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:convert';

import 'package:alert/alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/screen/events.dart';
import 'package:track_walk_admin/service/api_service.dart';
import 'package:track_walk_admin/widget/custom_checkbox.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  bool isLoading = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController url = TextEditingController();
  Future login() async {
    setState(() {
      isLoading = true;
    });
    final res = await http.post(Uri.parse("$baseUrl/login_status"), headers: {
      'Content-type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
      "username": username.text,
      "password": password.text
    });
    if (url.text != "https://track-dev.xplorin.id") {
      setState(() {
        isLoading = false;
      });
      if (GetPlatform.isIOS) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text("Sign-in Error"),
            content: Text("Incorrect URL, Username or Password"),
            actions: [
              CupertinoDialogAction(
                child: Text("Ok"),
                onPressed: () => Get.back(),
              )
            ],
          ),
        );
      } else {
        Dialogs.materialDialog(
            color: Get.isDarkMode ? bgDark : Colors.white,
            context: context,
            title: "Sign-in Error",
            titleAlign: TextAlign.center,
            titleStyle: TextStyle(
              fontSize: Get.width / 20,
              fontFamily: 'popinsemi',
            ),
            msg: "Incorect URL, Username or Password",
            msgStyle: TextStyle(color: grayText),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"))
            ]);
      }
      return;
    }
    if (res.statusCode == 400) {
      setState(() {
        isLoading = false;
      });
      Alert(
              message: jsonDecode(res.body)["error_description"],
              shortDuration: true)
          .show();
      return false;
    }
    if (res.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      var message = jsonDecode(res.body)["message"];
      if (message) {
        storage.write(
            "auth", {"username": username.text, "password": password.text});
        Get.off(Event());
      } else {
        if (GetPlatform.isIOS) {
          showCupertinoDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: Text("Sign-in Error"),
              content: Text("Incorect URL, Username or Password"),
              actions: [
                CupertinoDialogAction(
                  child: Text("Ok"),
                  onPressed: () => Get.back(),
                )
              ],
            ),
          );
        } else {
          Dialogs.materialDialog(
              color: Get.isDarkMode ? bgDark : Colors.white,
              context: context,
              title: "Sign-in Error",
              titleAlign: TextAlign.center,
              titleStyle: TextStyle(
                fontSize: Get.width / 20,
                fontFamily: 'popinsemi',
              ),
              msg: "Incorect URL, Username or Password",
              msgStyle: TextStyle(color: grayText),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"))
              ]);
        }
      }
      return true;
    } else {
      setState(() {
        isLoading = false;
      });
      return false;
    }
  }

  Widget _buildLogo(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(vertical: 70),
            child: Container(
              height: width * 0.3,
              child: Image(
                image: AssetImage('assets/img/Mandalika.png'),
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }

  Widget _usernameField(width) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GetPlatform.isIOS
          ? CupertinoTextField(
              controller: username,
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              padding: EdgeInsets.all(width / 30),
              decoration: BoxDecoration(
                  color: inputDark,
                  borderRadius: BorderRadius.circular(width / 40)),
              placeholder: "Username",
            )
          : TextFormField(
              keyboardType: TextInputType.text,
              controller: username,
              decoration: InputDecoration(
                  filled: Get.isDarkMode,
                  fillColor: inputDark,
                  enabledBorder: OutlineInputBorder(
                    borderSide: Get.isDarkMode
                        ? BorderSide.none
                        : BorderSide(color: grayText),
                    borderRadius: BorderRadius.circular(width / 40),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: Get.isDarkMode
                        ? BorderSide.none
                        : BorderSide(color: grayText),
                    borderRadius: BorderRadius.circular(width / 40),
                  ),
                  prefixIcon: Icon(
                    Iconsax.user,
                    color: grayText,
                  ),
                  labelStyle: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  labelText: 'Username',
                  contentPadding: EdgeInsets.symmetric(vertical: 0)),
            ),
    );
  }

  Widget _urlField(width) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GetPlatform.isIOS
          ? CupertinoTextField(
              controller: url,
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              padding: EdgeInsets.all(width / 30),
              decoration: BoxDecoration(
                  color: inputDark,
                  borderRadius: BorderRadius.circular(width / 40)),
              placeholder: "Url",
            )
          : TextFormField(
              keyboardType: TextInputType.text,
              controller: url,
              decoration: InputDecoration(
                  filled: Get.isDarkMode,
                  fillColor: inputDark,
                  enabledBorder: OutlineInputBorder(
                    borderSide: Get.isDarkMode
                        ? BorderSide.none
                        : BorderSide(color: grayText),
                    borderRadius: BorderRadius.circular(width / 40),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: Get.isDarkMode
                        ? BorderSide.none
                        : BorderSide(color: grayText),
                    borderRadius: BorderRadius.circular(width / 40),
                  ),
                  prefixIcon: Icon(
                    Iconsax.global,
                    color: grayText,
                  ),
                  labelStyle: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  labelText: 'URL',
                  contentPadding: EdgeInsets.symmetric(vertical: 0)),
            ),
    );
  }

  Widget _passwordField(width) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GetPlatform.isIOS
          ? CupertinoTextField(
              suffix: hidePassword
                  ? IconButton(
                      onPressed: _togglePassword,
                      icon: Icon(
                        Iconsax.eye_slash,
                        color: grayText,
                      ))
                  : IconButton(
                      onPressed: _togglePassword,
                      icon: Icon(
                        Iconsax.eye,
                        color: grayText,
                      )),
              controller: password,
              obscureText: hidePassword,
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              padding: EdgeInsets.all(width / 30),
              decoration: BoxDecoration(
                  color: inputDark,
                  borderRadius: BorderRadius.circular(width / 40)),
              placeholder: "Password",
              keyboardType: TextInputType.visiblePassword,
            )
          : TextField(
              keyboardType: TextInputType.text,
              obscureText: hidePassword,
              controller: password,
              decoration: InputDecoration(
                  filled: Get.isDarkMode,
                  fillColor: inputDark,
                  enabledBorder: OutlineInputBorder(
                    borderSide: Get.isDarkMode
                        ? BorderSide.none
                        : BorderSide(color: grayText),
                    borderRadius: BorderRadius.circular(width / 40),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: Get.isDarkMode
                        ? BorderSide.none
                        : BorderSide(color: grayText),
                    borderRadius: BorderRadius.circular(width / 40),
                  ),
                  suffixIcon: hidePassword
                      ? IconButton(
                          onPressed: _togglePassword,
                          icon: Icon(
                            Iconsax.eye_slash,
                            color: grayText,
                          ))
                      : IconButton(
                          onPressed: _togglePassword,
                          icon: Icon(
                            Iconsax.eye,
                            color: grayText,
                          )),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Iconsax.key,
                    color: grayText,
                  ),
                  labelStyle: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  labelText: 'Password',
                  contentPadding: EdgeInsets.symmetric(vertical: 0)),
            ),
    );
  }

  void _togglePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  Widget _rememberSettings(width, username, password) {
    return Padding(
      padding: EdgeInsets.only(left: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomCheck(
            password: username,
            username: password,
          ),
          SizedBox(width: width / 30),
          Text("Remember Settings"),
        ],
      ),
    );
  }

  Widget _loginButton(width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20, top: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: width / 7),
              elevation: 0,
              primary: blueTheme,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width),
              ),
            ),
            onPressed: () {
              login();
            },
            child: isLoading
                ? Transform.scale(
                    scale: 0.5,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                : Text(
                    "Sign in",
                    style: TextStyle(
                        fontSize: width / 20, fontFamily: "PopinSemi"),
                  ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                vertical: width / 10, horizontal: width / 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width / 20),
              boxShadow: [
                Get.isDarkMode
                    ? BoxShadow()
                    : BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 15,
                        offset: Offset(0, 1)),
              ],
              color: Get.isDarkMode ? Color(0xff191F24) : Colors.white,
            ),
            child: Column(
              children: <Widget>[
                _urlField(width),
                _usernameField(width),
                _passwordField(width),
                SizedBox(
                  height: height * 0.01,
                ),
                // _rememberSettings(width, username.text, password.text),
                _loginButton(width),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      storage.write("isDark", true);
    } else {
      storage.write("isDark", false);
    }
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff004E92),
                      Color(0xff2F80ED),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width / 7),
                    bottomRight: Radius.circular(width / 7),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildLogo(context),
                  _buildContainer(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
