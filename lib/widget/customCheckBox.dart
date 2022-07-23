// ignore_for_file: prefer_const_constructors

import 'package:alert/alert.dart';
import 'package:flutter/material.dart';
import 'package:track_walk_admin/colors.dart';

class Custom_check extends StatefulWidget {
  const Custom_check({
    Key? key,
  }) : super(key: key);

  @override
  State<Custom_check> createState() => _Custom_checkState();
}

class _Custom_checkState extends State<Custom_check> {
  bool loading = false;
  bool isChecked = false;
  // late Future todoUpdate;
  // late String check;

  @override
  void initState() {
    // TODO: implement initState
    // todoUpdate = ApiService().updateTodo(isChecked, id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        // print(check);
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
                decoration: BoxDecoration(color: blueTheme, borderRadius: BorderRadius.circular(5)),
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
