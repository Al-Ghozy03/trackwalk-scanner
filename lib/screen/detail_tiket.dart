// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:track_walk_admin/widget/custom_shimmer.dart';
import '../service/api_service.dart';

class DetailTiket extends StatefulWidget {
  final id;
  String type;
  DetailTiket({super.key, required this.id, required this.type});

  @override
  State<DetailTiket> createState() => _DetailTiketState();
}

class _DetailTiketState extends State<DetailTiket> {
  final arguments = Get.arguments;
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
    print(ticket);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(width / 25),
        child: FutureBuilder(
          future: ticket,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return _loading();
            if (snapshot.hasError)
              return Column(
                children: [
                  LottieBuilder.asset("assets/json/94992-error-404.json"),
                  Text(
                    "Ooops, something went wrong",
                    style: TextStyle(
                        fontFamily: "popinsemi", fontSize: width / 17),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Please check your internet connection",
                    style: TextStyle(color: grayText),
                  )
                ],
              );
            if (snapshot.hasData) {
              return _build(width, snapshot.data["data"]);
            } else {
              return Text("Kosong");
            }
          },
        ),
      )),
    );
  }

  Widget _build(width, data) {
    print(arguments);
    return Column(
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
                (data["customerFirstName"] != "")
                    ? data["customerFirstName"]
                    : widget.id,
                style: TextStyle(fontFamily: "popinsemi", fontSize: width / 15),
              ),
              Text(
                data["WooCommerceEventsStatus"],
                style: TextStyle(color: grayText, fontSize: width / 27),
              ),
              Divider(thickness: 1),
              Text(
                arguments[0],
                style: TextStyle(fontFamily: "popinsemi", fontSize: width / 24),
              ),
              SizedBox(height: width / 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.type == "single" ? "Add on" : "Bookable Events",
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
              _info("Ticket Expiration", "Jumat, 01 Juli 2022 16:49", width),
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
                  style:
                      TextStyle(fontFamily: "popinsemi", fontSize: width / 20),
                ))
          ],
        )
      ],
    );
  }

  Widget _loading() {
    final width = MediaQuery.of(context).size.width;
    return Column(
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
              CustomShimmer(height: width / 20, width: width / 2, radius: 5),
              SizedBox(
                height: width / 40,
              ),
              CustomShimmer(height: width / 20, width: width / 4, radius: 5),
              Divider(thickness: 1),
              CustomShimmer(height: width / 20, width: width / 1.5, radius: 5),
              SizedBox(height: width / 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomShimmer(
                      height: width / 20, width: width / 4, radius: 5),
                  SizedBox(height: width / 20),
                  CustomShimmer(
                      height: width / 20, width: width / 4, radius: 5),
                ],
              ),
              SizedBox(height: width / 40),
              _infoLoading("Ticket Number", "5432657", width),
              SizedBox(height: width / 40),
              Row(
                children: [
                  _infoLoading("Order ID", "2043", width),
                  SizedBox(width: width / 15),
                  _infoLoading("Price", "Rp 150.000", width),
                ],
              ),
              SizedBox(height: width / 40),
              _infoLoading(
                  "Ticket Expiration", "Jumat, 01 Juli 2022 16:49", width),
              SizedBox(height: width / 40),
              _infoLoading("Slot", "", width),
              SizedBox(height: width / 40),
              _infoLoading("Date", "", width),
            ],
          ),
        ),
        SizedBox(height: width / 20),
        CustomShimmer(height: width / 20, width: width / 4, radius: 5),
        SizedBox(height: width / 50),
        _infoLoading("Seasons", "Session 1 06:30 - 10:00 WITA", width),
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
              child: CustomShimmer(
                  height: width / 20, width: width / 4, radius: 5),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.black.withOpacity(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width / 50))),
              onPressed: () {},
              child: CustomShimmer(
                  height: width / 20, width: width / 4, radius: 5),
            )
          ],
        )
      ],
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

  Widget _infoLoading(String title, String value, width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomShimmer(height: width / 20, width: width / 6, radius: 5),
        SizedBox(
          height: width / 30,
        ),
        CustomShimmer(height: width / 20, width: width / 4, radius: 5),
      ],
    );
  }
}
