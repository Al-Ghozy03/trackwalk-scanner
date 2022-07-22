// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:track_walk_admin/colors.dart';

class DetailTiket extends StatefulWidget {
  const DetailTiket({super.key});

  @override
  State<DetailTiket> createState() => _DetailTiketState();
}

class _DetailTiketState extends State<DetailTiket> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(width / 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Iconsax.arrow_left)),
            SizedBox(height: width / 20),
            Container(
              padding: EdgeInsets.all(width / 25),
              width: width,
              decoration: BoxDecoration(
                  border: Border.all(color: grayText),
                  borderRadius: BorderRadius.circular(width / 30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "4165783",
                    style: TextStyle(
                        fontFamily: "popinsemi", fontSize: width / 15),
                  ),
                  Text(
                    "Not Checked-in",
                    style: TextStyle(color: grayText, fontSize: width / 27),
                  ),
                  Divider(thickness: 1),
                  Text(
                    "Domestic Visitor - Weekday",
                    style: TextStyle(
                        fontFamily: "popinsemi", fontSize: width / 24),
                  ),
                  SizedBox(height: width / 20),
                  _info("Bookable Event", "Expand Detail", width),
                  SizedBox(height: width / 40),
                  _info("Ticket Number", "5432657", width),
                  SizedBox(height: width / 40),
                  Row(
                    children: [
                      _info("Order ID", "2043", width),
                      SizedBox(width: width / 15),
                      _info("Price", "Rp 150.000", width),
                    ],
                  ),
                  SizedBox(height: width / 40),
                  _info(
                      "Ticket Expiration", "Jumat, 01 Juli 2022 16:49", width),
                  SizedBox(height: width / 40),
                  _info("Slot", "", width),
                  SizedBox(height: width / 40),
                  _info("Date", "", width),
                ],
              ),
            ),
            SizedBox(height: width / 20),
            Text(
              "Attendee",
              style: TextStyle(fontSize: width / 20, fontFamily: "popinsemi"),
            ),
            SizedBox(height: width / 50),
            _info("Seasons", "Session 1 06:30 - 10:00 WITA", width),
            SizedBox(height: width / 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width / 50))),
                    child: Text(
                      "Check-out",
                      style: TextStyle(
                          fontFamily: "popinsemi",
                          color: grayText,
                          fontSize: width / 20),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.black.withOpacity(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width / 50))),
                    onPressed: () {},
                    child: Text(
                      "Check-in",
                      style: TextStyle(
                          fontFamily: "popinsemi", fontSize: width / 20),
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget _info(String title, String value, width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: grayText, fontSize: width / 25),
        ),
        Text(
          value,
          style: TextStyle(fontSize: width / 25),
        ),
      ],
    );
  }
}
