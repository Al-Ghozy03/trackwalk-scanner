// ignore_for_file: prefer_const_constructors, file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:kafegama/colors.dart';
import 'package:kafegama/service/api_service.dart';

class CustomCheck extends StatefulWidget {
  String username;
  String password;
  CustomCheck({Key key,  this.password,  this.username})
      : super(key: key);

  @override
  State<CustomCheck> createState() => _CustomCheckState();
}

class _CustomCheckState extends State<CustomCheck> {
  bool loading = false;
  bool isChecked = false;
  void remember(bool value) {
    isChecked = value;
    storage.write("remember_me", value);
    storage.write('email', widget.username);
    storage.write('password', widget.password);

    setState(() {
      isChecked = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: AnimatedContainer(
        height: 23,
        width: 23,
        duration: Duration(microseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: isChecked ? null : Border.all(color: Colors.black),
        ),
        child: isChecked
            ? Container(
                decoration: BoxDecoration(
                    color: greenTheme, borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 20,
                ),
              )
            : null,
      ),
    );
  }
}
