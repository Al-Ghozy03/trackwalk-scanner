// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:track_walk_admin/colors.dart';

class CustomShimmer extends StatelessWidget {
  final width;
  final height;
  double radius;
  CustomShimmer(
      {key,
       this.height,
       this.width,
       this.radius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.grey.withOpacity(0.1),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: grayText, borderRadius: BorderRadius.circular(radius)),
        ));
  }
}
