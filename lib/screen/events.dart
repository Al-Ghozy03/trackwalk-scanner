// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/models/api/event_model.dart';
import 'package:track_walk_admin/screen/calendar.dart';
import 'package:track_walk_admin/service/api_service.dart';
import 'package:track_walk_admin/widget/custom_shimmer.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  int activeIndexFilter = 0;
  int activeIndexSort = 0;
  late Future event;
  String keyword = "";

  void modalFilter() {
    showModalBottomSheet(
      isScrollControlled: true,
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
                                              : null,
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
                                              : null,
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
                                  fontSize: width / 20))),
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
  void initState() {
    event = ApiService().event();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: GetPlatform.isIOS
            ? BouncingScrollPhysics()
            : ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(width / 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Events",
                    style: TextStyle(
                      fontSize: width / 13,
                      fontFamily: "popinsemi",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.changeTheme(Get.isDarkMode
                          ? ThemeData.light()
                          : ThemeData.dark());
                    },
                    icon: Icon(Get.isDarkMode ? Iconsax.moon : Iconsax.sun_1),
                  ),
                ],
              ),
              SizedBox(height: width / 20),
              _searchBar(width, height),
              SizedBox(height: width / 15),
              // FutureBuilder(
              //   builder: (context, AsyncSnapshot snapshot) {
              //     if (snapshot.connectionState != ConnectionState.done)
              //       return _loadingState(width, height);
              //     if (snapshot.hasError) return Text("error");
              //     if (snapshot.hasData)
              //       return _listBuilder(width, height, snapshot.data);
              //     return Text("kosong");
              //   },
              //   future: event,
              // )
            ],
          ),
        ),
      )),
    );
  }

  Widget _loadingState(width, height) {
    return Container(
      height: height * 0.75,
      child: ListView.separated(
          itemBuilder: (_, i) {
            return Row(
              children: [
                CustomShimmer(
                    width: width / 6, height: width / 6, radius: width / 30),
                SizedBox(width: width / 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomShimmer(
                        height: width / 30, width: width * 0.65, radius: width),
                    SizedBox(height: width / 55),
                    CustomShimmer(
                        height: width / 30, width: width * 0.45, radius: width),
                  ],
                )
              ],
            );
          },
          separatorBuilder: (_, i) =>
              SizedBox(height: width / 15, child: Divider(thickness: 0.8)),
          itemCount: 10),
    );
  }

  Widget _listBuilder(width, height, List<EventModel> data) {
    var filter = data.where((element) =>
        element.name.toLowerCase().contains(keyword.toLowerCase()));
    if (GetPlatform.isIOS)
      return CupertinoScrollbar(
          child: Container(
        height: height * 0.75,
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, i) {
              return InkWell(
                onTap: () {
                  Get.to(
                      Calendar(
                        image: filter.elementAt(i).images[0].src,
                      ),
                      arguments: filter.elementAt(i).name,
                      transition: Transition.cupertino);
                },
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
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filter.elementAt(i).name,
                                    style: TextStyle(fontFamily: "popinsemi"),
                                  ),
                                  Text("Bookable Event",
                                      style: TextStyle(
                                          fontSize: width / 30,
                                          color: grayText))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Iconsax.arrow_right_3,
                          size: width / 20, color: grayText)
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: width / 15, child: Divider(thickness: 0.8)),
            itemCount: filter.length),
      ));
    return Container(
      height: height * 0.75,
      child: ListView.separated(
          itemBuilder: (_, i) {
            return InkWell(
              onTap: () {
                Get.to(
                    Calendar(
                      image: filter.elementAt(i).images[0].src,
                    ),
                    arguments: filter.elementAt(i).name,
                    transition: Transition.rightToLeftWithFade);
              },
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
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  filter.elementAt(i).name,
                                  style: TextStyle(fontFamily: "popinsemi"),
                                ),
                                Text("Bookable Event",
                                    style: TextStyle(
                                        fontSize: width / 30, color: grayText))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Iconsax.arrow_right_3,
                        size: width / 20, color: grayText)
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              SizedBox(height: width / 15, child: Divider(thickness: 0.8)),
          itemCount: filter.length),
    );
  }

  Widget _searchBar(width, height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width * 0.75,
          child: GetPlatform.isAndroid
              ? TextField(
                  onChanged: (value) {
                    setState(() {
                      keyword = value;
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      prefixIcon:
                          Icon(Iconsax.search_normal_1, color: grayText),
                      hintText: "Search",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width / 40),
                          borderSide: BorderSide(color: grayText)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width / 40))),
                )
              : CupertinoSearchTextField(
                  onChanged: (value) {
                    setState(() {
                      keyword = value;
                    });
                  },
                  padding: EdgeInsets.symmetric(vertical: width / 30),
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
