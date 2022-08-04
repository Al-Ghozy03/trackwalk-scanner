// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures, must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/widget/custom_shimmer.dart';
import '../service/api_service.dart';
import 'package:http/http.dart' as http;

class DetailTiket extends StatefulWidget {
  final id;
  final idDetail;
  String type;
  DetailTiket(
      {super.key,
      required this.id,
      required this.type,
      required this.idDetail});

  @override
  State<DetailTiket> createState() => _DetailTiketState();
}

class _DetailTiketState extends State<DetailTiket> {
  final arguments = Get.arguments;
  late Future ticket;
  late Future detail;
  bool isLoading = false;
  // List dataDetail = [];
  // List data = [];
  FutureOr refetch() {
    setState(() {
      ticket = ApiService().singleTicket(widget.id);
      detail = ApiService().event();
    });
  }

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

  void dialogDetails() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Get.isDarkMode ? bgDark : Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(MediaQuery.of(context).size.width / 20),
              topRight:
                  Radius.circular(MediaQuery.of(context).size.width / 20))),
      context: context,
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        final height = MediaQuery.of(context).size.height;
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(width / 15),
            child: FutureBuilder(
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done)
                  return Text("loading");
                if (snapshot.hasError) return Text("error");
                if (snapshot.hasData) {
                  print(widget.idDetail);
                  List data = snapshot.data
                      .where((e) =>
                          e["WooCommerceEventsProductID"] == widget.idDetail)
                      .toList();
                  return Column(
                    children: data.asMap().entries.map((e) {
                      List value = e.value["WooCommerceEventsBookingOptions"]
                              [e.value["WooCommerceEventsBookingOptionIDs"][0]]
                          ["add_date_ids"];
                      var time = e.value["WooCommerceEventsBookingOptions"]
                              [e.value["WooCommerceEventsBookingOptionIDs"][0]]
                          ["add_date"];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Details",
                            style: TextStyle(
                                fontSize: width / 15, fontFamily: "popinsemi"),
                          ),
                          SizedBox(height: width / 40),
                          Text(arguments[0]),
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
                                      e.value["WooCommerceEventsLocation"])),
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
                              Flexible(
                                  child: Text(
                                      e.value["WooCommerceEventsTimeZone"])),
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
                                    e.value["WooCommerceEventsBookingOptions"][e
                                                    .value[
                                                "WooCommerceEventsBookingOptionIDs"]
                                            [0]]["label"]
                                        .toString(),
                                    style: TextStyle(fontFamily: "popinsemi"),
                                  ),
                                  Column(
                                    children: value.asMap().entries.map((j) {
                                      return Row(
                                        children: [
                                          Text(
                                            time[j.value.toString()]["date"],
                                            style: TextStyle(color: grayText),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: width / 40),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width / 50,
                                                vertical: width / 100),
                                            decoration: BoxDecoration(
                                                color: blueTheme,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width)),
                                            child: Text(
                                              "10/10",
                                              style: TextStyle(
                                                  fontSize: width / 50,
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      );
                                    }).toList(),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ],
                      );
                    }).toList(),
                  );
                }
                return Text("kosong");
              },
              future: detail,
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    ticket = ApiService().singleTicket(widget.id);
    detail = ApiService().event();

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
                changeStatus("Checked In");
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
