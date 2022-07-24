// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/models/models/Ticket_model.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  int activeIndexFilter = 0;
  int activeIndexSort = 0;
  final arguments = Get.arguments;

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

  void modalFilter() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(MediaQuery.of(context).size.width / 20),
        topRight: Radius.circular(MediaQuery.of(context).size.width / 20),
      )),
      clipBehavior: Clip.antiAlias,
      context: context,
      builder: (context) {
        final width = MediaQuery.of(context).size.width;
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(width / 15),
            child: StatefulBuilder(
              builder: (context, StateSetter stateSetter) {
                List filter = [
                  "All Tickets",
                  "One-day Tickets",
                  "Multi-day Tickets",
                  "Bookable Tickets"
                ];
                List sort = [
                  "Ticket Name : A-Z",
                  "Ticket Name : Z-A",
                  "Ticket Name : New to Old",
                  "Ticket Name : Old to New"
                ];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Filter",
                        style: TextStyle(
                            fontSize: width / 15, fontFamily: "popinsemi")),
                    SizedBox(height: width / 20),
                    Wrap(
                      children: filter
                          .asMap()
                          .entries
                          .map((data) => Container(
                              margin: EdgeInsets.only(right: width / 40),
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          activeIndexFilter == data.key
                                              ? blueThemeOpacity
                                              : Colors.white,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color:
                                                  activeIndexFilter == data.key
                                                      ? blueTheme
                                                      : grayText),
                                          borderRadius:
                                              BorderRadius.circular(width))),
                                  onPressed: () {
                                    stateSetter(() {
                                      activeIndexFilter = data.key;
                                    });
                                  },
                                  child: Text(
                                    data.value,
                                    style: TextStyle(
                                        color: activeIndexFilter == data.key
                                            ? blueTheme
                                            : grayText,
                                        fontSize: width / 25,
                                        fontFamily:
                                            activeIndexFilter == data.key
                                                ? "popinsemi"
                                                : "popin"),
                                  ))))
                          .toList(),
                    ),
                    SizedBox(height: width / 20),
                    Text("Sort",
                        style: TextStyle(
                            fontSize: width / 15, fontFamily: "popinsemi")),
                    SizedBox(height: width / 20),
                    Wrap(
                      children: sort
                          .asMap()
                          .entries
                          .map((data) => Container(
                              margin: EdgeInsets.only(right: width / 40),
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          activeIndexSort == data.key
                                              ? blueThemeOpacity
                                              : Colors.white,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: activeIndexSort == data.key
                                                  ? blueTheme
                                                  : grayText),
                                          borderRadius:
                                              BorderRadius.circular(width))),
                                  onPressed: () {
                                    stateSetter(() {
                                      activeIndexSort = data.key;
                                    });
                                  },
                                  child: Text(
                                    data.value,
                                    style: TextStyle(
                                        color: activeIndexSort == data.key
                                            ? blueTheme
                                            : grayText,
                                        fontSize: width / 25,
                                        fontFamily: activeIndexSort == data.key
                                            ? "popinsemi"
                                            : "popin"),
                                  ))))
                          .toList(),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<TicketModel> tickets = [
      TicketModel(
          title: "Satrio Boyd",
          subTitle: "Status",
          icon: Icon(
            Icons.circle,
            size: width / 10,
            color: Colors.green,
          )),
      TicketModel(
          title: "Daffa",
          subTitle: "Status",
          icon: Icon(
            Icons.circle,
            size: width / 10,
            color: Colors.green,
          )),
      TicketModel(
          title: "Andika",
          subTitle: "Status",
          icon: Icon(
            Icons.circle,
            size: width / 10,
            color: Colors.green,
          )),
      TicketModel(
          title: "Satrio Boyd",
          subTitle: "Status",
          icon: Icon(
            Icons.circle,
            size: width / 10,
            color: Colors.green,
          )),
    ];

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width / 4,
                    height: width / 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width / 30),
                        image: DecorationImage(
                            image: AssetImage("assets/img/Visitor.jpeg"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: width / 20,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Domestic Visitor - Weekday",
                          style: TextStyle(
                              fontSize: width / 18, fontFamily: "popinsemi"),
                        ),
                        Text(
                          "${DateFormat.d().format(arguments[1])} ${DateFormat.MMMM().format(arguments[1])} ${DateFormat.y().format(arguments[1])}",
                          style:
                              TextStyle(fontSize: width / 27, color: grayText),
                        ),
                        InkWell(
                          onTap: () {
                            dialogDetails();
                          },
                          child: Row(
                            children: [
                              Text(
                                "Expand Details",
                                style: TextStyle(fontSize: width / 27),
                              ),
                              Icon(Iconsax.arrow_down_1, size: width / 22)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: width / 20),
              _searchBar(width, height),
              SizedBox(height: width / 15),
              Container(
                height: height * 0.75,
                child: ListView.separated(
                    itemBuilder: (_, i) => _listTickets(width, i, tickets),
                    separatorBuilder: (context, index) => SizedBox(
                        height: width / 15, child: Divider(thickness: 0.8)),
                    itemCount: tickets.length),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget _listTickets(width, int i, tickets) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: width / 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  tickets[i].icon,
                  SizedBox(width: width / 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tickets[i].title,
                        style: TextStyle(fontFamily: "popinsemi"),
                      ),
                      Text(tickets[i].subTitle,
                          style:
                              TextStyle(fontSize: width / 30, color: grayText))
                    ],
                  ),
                ],
              ),
            ),
            Icon(Iconsax.arrow_right_3, size: width / 20, color: grayText)
          ],
        ),
      ),
    );
  }

  Widget _searchBar(width, height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width * 0.75,
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                prefixIcon: Icon(Iconsax.search_normal_1),
                hintText: "Search",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width / 40),
                    borderSide: BorderSide(color: grayText)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width / 40))),
          ),
        ),
        InkWell(
          onTap: () {
            modalFilter();
          },
          child: Container(
            padding: EdgeInsets.all(width / 35),
            decoration: BoxDecoration(
                color: blueTheme,
                borderRadius: BorderRadius.circular(width / 40)),
            child: Icon(Iconsax.setting_4, color: Colors.white),
          ),
        )
      ],
    );
  }
}
