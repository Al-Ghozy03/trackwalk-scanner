// ignore_for_file: prefer_const_constructors, file_names
import 'package:flutter/material.dart';
import 'package:track_walk_admin/colors.dart';

class CustomCheck extends StatefulWidget {
  const CustomCheck({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomCheck> createState() => _CustomCheckState();
}

class _CustomCheckState extends State<CustomCheck> {
  bool loading = false;
  bool isChecked = false;
  // late Future todoUpdate;
  // late String check;

  @override
  void initState() {
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
