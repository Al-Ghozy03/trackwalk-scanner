// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:track_walk_admin/colors.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
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
        return Container(
          padding: EdgeInsets.all(width / 15),
          child: StatefulBuilder(
            builder: (context, StateSetter stateSetter) {
              List sort = [
                "All Events",
                "One-day Events",
                "Multi-day Events",
                "Bookable Events"
              ];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Filter",
                      style: TextStyle(
                          fontSize: width / 15, fontFamily: "popinsemi")),
                  SizedBox(height: width / 20),
                  Wrap(
                    children: sort
                        .asMap()
                        .entries
                        .map((data) => Container(
                            margin: EdgeInsets.only(right: width / 40),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: activeIndexSort == data.key
                                        ? blueThemeOpacity
                                        : Colors.white.withOpacity(0),
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
                                          ? Colors.white
                                          : grayText,
                                      fontSize: width / 25,
                                      fontFamily: activeIndexSort == data.key
                                          ? "popinsemi"
                                          : "popin"),
                                ))))
                        .toList(),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(activeIndexSort);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width / 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Events",
                  style:
                      TextStyle(fontSize: width / 13, fontFamily: "popinsemi")),
              SizedBox(height: width / 20),
              _searchBar(width, height),
              SizedBox(height: width / 15),
              Container(
                height: height * 0.75,
                child: ListView.separated(
                    itemBuilder: (_, i) => _listEvents(width),
                    separatorBuilder: (context, index) => SizedBox(
                        height: width / 15, child: Divider(thickness: 0.8)),
                    itemCount: 15),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget _listEvents(width) {
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
                  Icon(Iconsax.calendar_tick, size: width / 10),
                  SizedBox(width: width / 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dometic Visitor - Weekday",
                        style: TextStyle(fontFamily: "popinsemi"),
                      ),
                      Text("Bookable Event",
                          style:
                              TextStyle(fontSize: width / 30, color: grayText))
                    ],
                  ),
                ],
              ),
            ),
            Icon(Iconsax.arrow_right_3, color: grayText, size: width / 20)
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
