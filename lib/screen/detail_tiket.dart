// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures, must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/widget/custom_shimmer.dart';
import '../service/api_service.dart';
import 'package:http/http.dart' as http;

class DetailTiket extends StatefulWidget {
  final id;
  String type;
  DetailTiket({super.key, required this.id, required this.type});

  @override
  State<DetailTiket> createState() => _DetailTiketState();
}

class _DetailTiketState extends State<DetailTiket> {
  final arguments = Get.arguments;
  late Future ticket;
  bool isLoading = false;
  FutureOr refetch() {
    setState(() {
      ticket = ApiService().singleTicket(widget.id);
    });
  }

  Map<String, List<DateTime>> sessions = {
    "session_1": [
      DateTime.parse(
          "${DateFormat.y().format(DateTime.now())}-${DateFormat.M().format(DateTime.now()).length == 1 ? "0${DateFormat.M().format(DateTime.now())}" : DateFormat.M().format(DateTime.now())}-${DateFormat.d().format(DateTime.now()).length == 1 ? "0${DateFormat.d().format(DateTime.now())}" : DateFormat.d().format(DateTime.now())} 06:30"),
      DateTime.parse(
          "${DateFormat.y().format(DateTime.now())}-${DateFormat.M().format(DateTime.now()).length == 1 ? "0${DateFormat.M().format(DateTime.now())}" : DateFormat.M().format(DateTime.now())}-${DateFormat.d().format(DateTime.now()).length == 1 ? "0${DateFormat.d().format(DateTime.now())}" : DateFormat.d().format(DateTime.now())} 10:00"),
    ],
    "session_2": [
      DateTime.parse(
          "${DateFormat.y().format(DateTime.now())}-${DateFormat.M().format(DateTime.now()).length == 1 ? "0${DateFormat.M().format(DateTime.now())}" : DateFormat.M().format(DateTime.now())}-${DateFormat.d().format(DateTime.now()).length == 1 ? "0${DateFormat.d().format(DateTime.now())}" : DateFormat.d().format(DateTime.now())} 16:00"),
      DateTime.parse(
          "${DateFormat.y().format(DateTime.now())}-${DateFormat.M().format(DateTime.now()).length == 1 ? "0${DateFormat.M().format(DateTime.now())}" : DateFormat.M().format(DateTime.now())}-${DateFormat.d().format(DateTime.now()).length == 1 ? "0${DateFormat.d().format(DateTime.now())}" : DateFormat.d().format(DateTime.now())} 17:30"),
    ]
  };
  Future changeStatus(String status) async {
    setState(() {
      isLoading = true;
    });
    final res = await http.post(
        Uri.parse(
            "$baseUrl/update_ticket_status?param2=${widget.id}&param3=$status"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "username": storage.read("auth")["username"],
          "password": storage.read("auth")["password"]
        });
    if (res.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      refetch();
      return true;
    } else {
      setState(() {
        isLoading = false;
      });
      refetch();
      return false;
    }
  }

  void validationChangeStatus(data) {
    if (data["WooCommerceEventsVariations"].runtimeType != List<dynamic>) {
      if (data["WooCommerceEventsVariations"]["Seasons"]
          .toString()
          .toLowerCase()
          .contains("session 1")) {
        if (DateTime.now().isAfter(sessions["session_1"]![0]) &&
            DateTime.now().isBefore(sessions["session_1"]![1])) {
          changeStatus("Checked in");
        } else {
          Dialogs.materialDialog(
              color: Get.isDarkMode ? bgDark : Colors.white,
              context: context,
              title: "Gagal",
              titleAlign: TextAlign.center,
              titleStyle: TextStyle(
                fontSize: Get.width / 20,
                fontFamily: 'popinsemi',
              ),
              msg: "Sesi telah berakhir",
              msgStyle: TextStyle(color: grayText),
              actions: [
                TextButton(onPressed: () => Get.back(), child: Text("Ok"))
              ]);
        }
      } else if (data["WooCommerceEventsVariations"]["Seasons"]
          .toString()
          .toLowerCase()
          .contains("session 2")) {
        if (DateTime.now().isAfter(sessions["session_2"]![0]) &&
            DateTime.now().isBefore(sessions["session_2"]![1])) {
          changeStatus("Checked in");
        } else {
          Dialogs.materialDialog(
              color: Get.isDarkMode ? bgDark : Colors.white,
              context: context,
              title: "Gagal",
              titleAlign: TextAlign.center,
              titleStyle: TextStyle(
                fontSize: Get.width / 20,
                fontFamily: 'popinsemi',
              ),
              msg: "Sesi telah berakhir",
              msgStyle: TextStyle(color: grayText),
              actions: [
                TextButton(onPressed: () => Get.back(), child: Text("Ok"))
              ]);
        }
      } else {
        print("bukan sesi 1 atau 2");
      }
    } else {
      if (data["WooCommerceEventsBookingSlot"]
          .toString()
          .toLowerCase()
          .contains("session 1")) {
        if (DateTime.now().isAfter(sessions["session_1"]![0]) &&
            DateTime.now().isBefore(sessions["session_1"]![1])) {
          changeStatus("Checked in");
        } else {
          Dialogs.materialDialog(
              color: Get.isDarkMode ? bgDark : Colors.white,
              context: context,
              title: "Gagal",
              titleAlign: TextAlign.center,
              titleStyle: TextStyle(
                fontSize: Get.width / 20,
                fontFamily: 'popinsemi',
              ),
              msg: "Sesi telah berakhir",
              msgStyle: TextStyle(color: grayText),
              actions: [
                TextButton(onPressed: () => Get.back(), child: Text("Ok"))
              ]);
        }
      } else if (data["WooCommerceEventsBookingSlot"]
          .toString()
          .toLowerCase()
          .contains("session 2")) {
        if (DateTime.now().isAfter(sessions["session_2"]![0]) &&
            DateTime.now().isBefore(sessions["session_2"]![1])) {
          changeStatus("Checked in");
        } else {
          Dialogs.materialDialog(
              color: Get.isDarkMode ? bgDark : Colors.white,
              context: context,
              title: "Gagal",
              titleAlign: TextAlign.center,
              titleStyle: TextStyle(
                fontSize: Get.width / 20,
                fontFamily: 'popinsemi',
              ),
              msg: "Sesi telah berakhir",
              msgStyle: TextStyle(color: grayText),
              actions: [
                TextButton(onPressed: () => Get.back(), child: Text("Ok"))
              ]);
        }
      } else {
        print("bukan sesi 1 atau 2");
      }
    }
  }

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
          child: SingleChildScrollView(
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
                return _builder(width, snapshot.data["data"]);
              } else {
                return Text("Kosong");
              }
            },
          ),
        ),
      )),
    );
  }

  Widget _builder(width, data) {
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
              border: Border.all(
                  color:
                      Get.isDarkMode ? Color(0xff252A34) : Color(0xffDFDFDF)),
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
                style: TextStyle(
                    color: (data["WooCommerceEventsStatus"] != "Checked In")
                        ? grayText
                        : greenText,
                    fontSize: width / 27,
                    fontWeight:
                        (data["WooCommerceEventsStatus"] != "Checked In")
                            ? FontWeight.normal
                            : FontWeight.bold),
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
              _info("Ticket Number", data["WooCommerceEventsTicketID"], width),
              SizedBox(height: width / 40),
              Row(
                children: [
                  _info("Order ID", data["WooCommerceEventsOrderID"], width),
                  SizedBox(width: width / 15),
                  _info(
                      "Price", data["WooCommerceEventsTicketPriceText"], width),
                ],
              ),
              widget.type != "single"
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: width / 40),
                        _info(
                            "Ticket Expiration",
                            "${DateFormat.yMMMMEEEEd().format(DateTime.fromMillisecondsSinceEpoch(int.parse(data["WooCommerceEventsTicketExpireTimestamp"]) * 1000))} ${DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(int.parse(data["WooCommerceEventsTicketExpireTimestamp"]) * 1000))}",
                            width),
                        SizedBox(height: width / 40),
                        _info("Slot", data["WooCommerceEventsBookingSlot"],
                            width),
                        SizedBox(height: width / 40),
                        _info("Date", data["WooCommerceEventsBookingDate"],
                            width),
                      ],
                    )
                  : SizedBox()
            ],
          ),
        ),
        SizedBox(height: width / 20),
        (widget.type != "single")
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Attendee",
                    style: TextStyle(
                        fontSize: width / 20, fontFamily: "popinsemi"),
                  ),
                  SizedBox(height: width / 50),
                  _info("Seasons", data["WooCommerceEventsBookingSlot"], width),
                  SizedBox(height: width / 20),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Purchaser",
                    style: TextStyle(
                        fontSize: width / 20, fontFamily: "popinsemi"),
                  ),
                  SizedBox(height: width / 50),
                  _info("Name", data["customerFirstName"], width),
                  SizedBox(height: width / 20),
                  _info("Email", data["customerEmail"], width),
                  SizedBox(height: width / 20),
                  _info("Phone", data["customerPhone"], width),
                  SizedBox(height: width / 4),
                ],
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {
                changeStatus("Not Checked In");
              },
              style: OutlinedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width / 50))),
              child: isLoading
                  ? _loadingButton(width)
                  : Text(
                      "Check-out",
                      style: TextStyle(
                          fontFamily: "popinsemi", fontSize: width / 20),
                    ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shadowColor: Colors.black.withOpacity(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width / 50),
                ),
              ),
              onPressed: () {
                validationChangeStatus(data);
              },
              child: isLoading
                  ? _loadingButton(width)
                  : Text(
                      "Check-in",
                      style: TextStyle(
                          fontFamily: "popinsemi", fontSize: width / 20),
                    ),
            )
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
              CustomShimmer(
                  height: width / 30, width: width / 2, radius: width),
              SizedBox(
                height: width / 40,
              ),
              CustomShimmer(
                  height: width / 30, width: width / 4, radius: width),
              Divider(thickness: 1),
              CustomShimmer(
                  height: width / 30, width: width / 1.5, radius: width),
              SizedBox(height: width / 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomShimmer(
                      height: width / 30, width: width / 4, radius: width),
                  SizedBox(height: width / 20),
                  CustomShimmer(
                      height: width / 30, width: width / 4, radius: width),
                ],
              ),
              SizedBox(height: width / 40),
              _infoLoading(width),
              SizedBox(height: width / 40),
              Row(
                children: [
                  _infoLoading(width),
                  SizedBox(width: width / 15),
                  _infoLoading(width),
                ],
              ),
              SizedBox(height: width / 40),
              _infoLoading(width),
              SizedBox(height: width / 40),
              _infoLoading(width),
              SizedBox(height: width / 40),
              _infoLoading(width),
            ],
          ),
        ),
        SizedBox(height: width / 20),
        CustomShimmer(height: width / 20, width: width / 4, radius: width),
        SizedBox(height: width / 50),
        _infoLoading(width),
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
                  height: width / 30, width: width / 4, radius: width),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.black.withOpacity(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width / 50))),
              onPressed: () {},
              child: CustomShimmer(
                  height: width / 30, width: width / 4, radius: width),
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
          (value == "") ? "Nan" : value,
          style: TextStyle(fontSize: width / 25),
        ),
      ],
    );
  }

  Widget _infoLoading(width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomShimmer(height: width / 30, width: width / 6, radius: width),
        SizedBox(
          height: width / 30,
        ),
        CustomShimmer(height: width / 30, width: width / 4, radius: width),
      ],
    );
  }

  Widget _loadingButton(width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomShimmer(height: width / 30, width: width / 4, radius: width),
      ],
    );
  }
}
