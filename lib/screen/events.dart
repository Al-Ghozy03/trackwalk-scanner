// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/models/models/event_model.dart';
import 'package:track_walk_admin/screen/calendar.dart';

class Event extends StatefulWidget {
  // const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
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
                  "All Events",
                  "One-day Events",
                  "Multi-day Events",
                  "Bookable Events"
                ];
                List sort = [
                  "Event Name : A-Z",
                  "Event Name : Z-A",
                  "Event Name : New to Old",
                  "Event Name : Old to New"
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
                    SizedBox(height: width / 20),
                    Container(
                      width: width,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(width / 40))),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Apply",
                              style: TextStyle(
                                  fontFamily: "popinsemi",
                                  fontSize: width / 25))),
                    )
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
    List<EventModel> events = [
      EventModel(
          title: "Domestic Visitor - Weekday",
          subTitle: "Bookable Events",
          icon: Icon(Iconsax.calendar_tick, size: width / 10)),
      EventModel(
          title: "International Visitor - Weekday",
          subTitle: "Bookable Events",
          icon: Icon(Iconsax.calendar_tick, size: width / 10)),
      EventModel(
          title: "Domestic Visitor - Weekday",
          subTitle: "Bookable Events",
          icon: Icon(Iconsax.calendar_tick, size: width / 10)),
      EventModel(
          title: "International Visitor - Weekday",
          subTitle: "Bookable Events",
          icon: Icon(Iconsax.calendar_tick, size: width / 10)),
      EventModel(
          title: "Bicycle Pass",
          subTitle: "Bookable Events",
          icon: Icon(Iconsax.calendar_tick, size: width / 10)),
      EventModel(
          title: "Car Parking Ticket",
          subTitle: "Bookable Events",
          icon: Icon(Iconsax.calendar_tick, size: width / 10)),
      EventModel(
          title: "Podium Photoshoot Ticket",
          subTitle: "Bookable Events",
          icon: Icon(Iconsax.calendar_tick, size: width / 10)),
      EventModel(
          title: "Motorcycle / Bicycle Parking Ticket",
          subTitle: "Bookable Events",
          icon: Icon(Iconsax.calendar_tick, size: width / 10)),
      EventModel(
          title: "Bicycle Pass Add-on",
          subTitle: "0:00 - 0:00",
          icon: Container(
            padding: EdgeInsets.all(width / 30),
            decoration: BoxDecoration(
                color: blueTheme,
                borderRadius: BorderRadius.circular(width / 40)),
            child: Column(
              children: [
                Text("22",
                    style: TextStyle(
                        fontFamily: "popinsemi", color: Colors.white)),
                Text("Jan", style: TextStyle(color: Colors.white))
              ],
            ),
          )),
      EventModel(
          title: "Car Pass Add-on",
          subTitle: "0:00 - 0:00",
          icon: Container(
            padding: EdgeInsets.all(width / 30),
            decoration: BoxDecoration(
                color: blueTheme,
                borderRadius: BorderRadius.circular(width / 40)),
            child: Column(
              children: [
                Text("22",
                    style: TextStyle(
                        fontFamily: "popinsemi", color: Colors.white)),
                Text("Jan", style: TextStyle(color: Colors.white))
              ],
            ),
          )),
      EventModel(
          title: "Motorcycle / Bicycle Pass Add-on",
          subTitle: "0:00 - 0:00",
          icon: Container(
            padding: EdgeInsets.all(width / 30),
            decoration: BoxDecoration(
                color: blueTheme,
                borderRadius: BorderRadius.circular(width / 40)),
            child: Column(
              children: [
                Text("22",
                    style: TextStyle(
                        fontFamily: "popinsemi", color: Colors.white)),
                Text("Jan", style: TextStyle(color: Colors.white))
              ],
            ),
          )),
      EventModel(
          title: "Podium Photoshoot Ticket Add-on",
          subTitle: "0:00 - 0:00",
          icon: Container(
            padding: EdgeInsets.all(width / 30),
            decoration: BoxDecoration(
                color: blueTheme,
                borderRadius: BorderRadius.circular(width / 40)),
            child: Column(
              children: [
                Text("22",
                    style: TextStyle(
                        fontFamily: "popinsemi", color: Colors.white)),
                Text("Jan", style: TextStyle(color: Colors.white))
              ],
            ),
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
              Text("Events",
                  style:
                      TextStyle(fontSize: width / 13, fontFamily: "popinsemi")),
              SizedBox(height: width / 20),
              _searchBar(width, height),
              SizedBox(height: width / 15),
              Container(
                height: height * 0.75,
                child: ListView.separated(
                    itemBuilder: (_, i) => _listEvents(width, i, events),
                    separatorBuilder: (context, index) => SizedBox(
                        height: width / 15, child: Divider(thickness: 0.8)),
                    itemCount: events.length),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget _listEvents(width, int i, events) {
    return InkWell(
      onTap: () {
        Get.to(Calendar(), transition: Transition.rightToLeftWithFade);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: width / 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  events[i].icon,
                  SizedBox(width: width / 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        events[i].title,
                        style: TextStyle(fontFamily: "popinsemi"),
                      ),
                      Text(events[i].subTitle,
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
