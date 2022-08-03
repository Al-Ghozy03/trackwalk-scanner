// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unused_local_variable, avoid_print, deprecated_member_use, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/service/api_service.dart';
import 'package:track_walk_admin/widget/custom_checkbox.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController url = TextEditingController();


  // late String Username, password;

  Widget _buildLogo(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(vertical: 70),
            child: Container(
              height: width * 0.3,
              // child: Image(
              //   image: AssetImage('assets/img/Mandalika.png'),
              //   fit: BoxFit.fill,
              // ),
              child: Image.network(
                "https://track-dev.xplorin.id/wp-content/uploads/2022/07/logo-mandalika-track-walk-2.png",
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }

  Widget _usernameField(width) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: username,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: grayText),
              borderRadius: BorderRadius.circular(width / 40),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: grayText),
              borderRadius: BorderRadius.circular(width / 40),
            ),
            prefixIcon: Icon(
              Iconsax.user,
              color: grayText,
            ),
            labelStyle: TextStyle(color: grayText),
            labelText: 'Username',
            contentPadding: EdgeInsets.symmetric(vertical: 0)),
      ),
    );
  }

  Widget _urlField(width) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: url,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: grayText),
              borderRadius: BorderRadius.circular(width / 40),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: grayText),
              borderRadius: BorderRadius.circular(width / 40),
            ),
            prefixIcon: Icon(
              Iconsax.global,
              color: grayText,
            ),
            labelStyle: TextStyle(color: grayText),
            labelText: 'URL',
            contentPadding: EdgeInsets.symmetric(vertical: 0)),
      ),
    );
  }

  Widget _passwordField(width) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.text,
        obscureText: hidePassword,
        controller: password,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: grayText),
              borderRadius: BorderRadius.circular(width / 40),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: grayText),
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
            labelStyle: TextStyle(color: grayText),
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

  Widget _rememberSettings(width) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CustomCheck(),
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
              ApiService().login(username.text, password.text);
            },
            child: Text(
              "Sign in",
              style: TextStyle(fontSize: width / 20, fontFamily: "PopinSemi"),
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
                BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 15,
                    offset: Offset(0, 1)),
              ],
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                _urlField(width),
                _usernameField(width),
                _passwordField(width),
                SizedBox(
                  height: height * 0.01,
                ),
                _rememberSettings(width),
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
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
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
