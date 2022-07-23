// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/models/models/Ticket_model.dart';

class Ticket extends StatefulWidget {
  // const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  int activeIndexFilter = 0;
  int activeIndexSort = 0;

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
    List<TicketModel> Tickets = [
      TicketModel(
          title: "Satrio Boyd",
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
      TicketModel(
          title: "Satrio Boyd",
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/Visitor.jpeg"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Domestic Visitor - Weekday",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Bookable Events",
                          style: TextStyle(fontSize: 16, color: grayText),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Expand Detail",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: width / 20),
              _searchBar(width, height),
              SizedBox(height: width / 15),
              Container(
                height: height * 0.75,
                child: ListView.separated(
                    itemBuilder: (_, i) => _listTickets(width, i, Tickets),
                    separatorBuilder: (context, index) => SizedBox(
                        height: width / 15, child: Divider(thickness: 0.8)),
                    itemCount: Tickets.length),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget _listTickets(width, int i, Tickets) {
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
                  Tickets[i].icon,
                  SizedBox(width: width / 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Tickets[i].title,
                        style: TextStyle(fontFamily: "popinsemi"),
                      ),
                      Text(Tickets[i].subTitle,
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
