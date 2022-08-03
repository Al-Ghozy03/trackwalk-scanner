// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:track_walk_admin/colors.dart';

import '../service/api_service.dart';

class DetailTiket extends StatefulWidget {
  final id;
  DetailTiket({super.key, required this.id});

  @override
  State<DetailTiket> createState() => _DetailTiketState();
}

class _DetailTiketState extends State<DetailTiket> {
  late final ticket;
  void dialogDetails() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(MediaQuery.of(context).size.width / 20),
              topRight:
                  Radius.circular(MediaQuery.of(context).size.width / 20))),
      context: context,
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        List data = [1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3];
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(width / 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Details",
                  style:
                      TextStyle(fontSize: width / 15, fontFamily: "popinsemi"),
                ),
                SizedBox(height: width / 40),
                Text("Domestic Visitor - Weekday"),
                SizedBox(height: width / 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(color: grayText),
                    ),
                    SizedBox(width: width / 15),
                    Flexible(
                        child: Text(
                            "Pertamina Mandalika, Internation Street Circuit")),
                  ],
                ),
                SizedBox(height: width / 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Time Zone",
                      style: TextStyle(color: grayText),
                    ),
                    SizedBox(width: width / 25),
                    Flexible(child: Text("Asia/Singapore")),
                  ],
                ),
                SizedBox(height: width / 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Slots",
                      style: TextStyle(color: grayText),
                    ),
                    SizedBox(width: width / 7),
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Session 1 06.30 - 09.00 WITA",
                          style: TextStyle(fontFamily: "popinsemi"),
                        ),
                        Column(
                          children: data
                              .map((e) => Row(
                                    children: [
                                      Text(
                                        "July 04, 2022",
                                        style: TextStyle(color: grayText),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: width / 40),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width / 50,
                                            vertical: width / 100),
                                        decoration: BoxDecoration(
                                            color: blueTheme,
                                            borderRadius:
                                                BorderRadius.circular(width)),
                                        child: Text(
                                          "10/10",
                                          style: TextStyle(
                                              fontSize: width / 50,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ))
                              .toList(),
                        )
                      ],
                    )),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    ticket = ApiService().singleTicket(widget.id);
    super.initState();
  }

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bookable Event",
                        style: TextStyle(color: grayText, fontSize: width / 25),
                      ),
                      InkWell(
                        onTap: () {
                          dialogDetails();
                        },
                        child: Row(
                          children: [
                            Text(
                              "Expand Details",
                              style: TextStyle(fontSize: width / 25),
                            ),
                            Icon(Iconsax.arrow_down_1, size: width / 20)
                          ],
                        ),
                      ),
                    ],
                  ),
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
