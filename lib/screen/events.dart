// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, curly_braces_in_flow_control_structures, unused_import, unused_element, dead_code, avoid_print, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/screen/calendar.dart';
import 'package:track_walk_admin/screen/login.dart';
import 'package:track_walk_admin/screen/tickets.dart';
import 'package:track_walk_admin/service/api_service.dart';
import 'package:track_walk_admin/widget/custom_shimmer.dart';

class Event extends StatefulWidget {
  const Event({key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  int activeIndexSort = 0;
  Future event;
  String keyword = "";
  DateTime pre_backpress = DateTime.now();
  List data = [];

  void modalFilter() {
    showModalBottomSheet(
      backgroundColor: Get.isDarkMode ? bgDark : Colors.white,
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
                List sort = [
                  "Event Name : A-Z",
                  "Event Name : Z-A",
                ];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sort",
                        style: TextStyle(
                            fontSize: width / 15, fontFamily: "popinsemi")),
                    SizedBox(height: width / 20),
                    Wrap(
                      children: sort
                          .asMap()
                          .entries
                          .map((e) => Container(
                              margin: EdgeInsets.only(right: width / 40),
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: activeIndexSort == e.key
                                          ? blueThemeOpacity
                                          : null,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(width)),
                                      side: BorderSide(
                                          color: activeIndexSort == e.key
                                              ? greenTheme
                                              : grayText)),
                                  onPressed: () {
                                    stateSetter(() {
                                      activeIndexSort = e.key;
                                    });
                                    setState(() {
                                      if (activeIndexSort == 0) {
                                        data.sort((a, b) => a[
                                                "WooCommerceEventsName"]
                                            .toString()
                                            .compareTo(
                                                b["WooCommerceEventsName"]));
                                      } else {
                                        data.sort((a, b) => b[
                                                "WooCommerceEventsName"]
                                            .toString()
                                            .compareTo(
                                                a["WooCommerceEventsName"]));
                                      }
                                    });
                                  },
                                  child: Text(
                                    e.value,
                                    style: TextStyle(
                                        color: activeIndexSort == e.key
                                            ? greenTheme
                                            : grayText,
                                        fontSize: width / 25,
                                        fontFamily: activeIndexSort == e.key
                                            ? "popinsemi"
                                            : "popin"),
                                  ))))
                          .toList(),
                    ),
                    SizedBox(height: width / 20),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  void refresh() {
    setState(() {
      event = ApiService().event();
      event.then((value) {
        data = value;
      });
    });
  }

  @override
  void initState() {
    event = ApiService().event();
    event.then((value) {
      setState(() {
        data = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      storage.write("isDark", true);
    } else {
      storage.write("isDark", false);
    }
    final width = Get.width;
    final height = Get.height;
    return Scaffold(
      body: WillPopScope(
        child: SafeArea(
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
                      TextButton(
                        onPressed: () {
                          storage.remove("auth");
                          Get.off(() => Login(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        child: Text(
                          "Sign out",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: width / 20),
                  _searchBar(width, height),
                  SizedBox(height: width / 15),
                  FutureBuilder(
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState != ConnectionState.done)
                        return _loadingState(width, height);
                      if (snapshot.hasError)
                        return Column(
                          children: [
                            LottieBuilder.asset(
                                "assets/json/94992-error-404.json"),
                            Text(
                              "Ooops, something went wrong",
                              style: TextStyle(
                                  fontFamily: "popinsemi",
                                  fontSize: width / 17),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Please check your internet connection",
                              style: TextStyle(color: grayText),
                            )
                          ],
                        );
                      if (snapshot.hasData) return _listBuilder(width, height);

                      return Text("kosong");
                    },
                    future: event,
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          final timegap = DateTime.now().difference(pre_backpress);
          final cantExit = timegap >= Duration(seconds: 2);
          pre_backpress = DateTime.now();
          if (cantExit) {
            //show snackbar
            final snack = SnackBar(
              content: Text('Press Back button again to Exit'),
              duration: Duration(seconds: 2),
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
            return false;
          } else {
            return true;
          }
        },
      ),
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
                ),
              ],
            );
          },
          separatorBuilder: (_, i) =>
              SizedBox(height: width / 15, child: Divider(thickness: 0.8)),
          itemCount: 10),
    );
  }

  Widget _listBuilder(width, height) {
    var filter = data
        .where((element) => element["WooCommerceEventsName"]
            .toString()
            .toLowerCase()
            .contains(keyword.toLowerCase()))
        .toList();
    if (filter.isEmpty) return Center(child: Text("No result found"));
    if (GetPlatform.isIOS)
      return CupertinoScrollbar(
          child: Container(
        height: height * 0.75,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                refresh();
              },
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, i) {
              return InkWell(
                onTap: () {
                  Get.to(
                      Calendar(
                        image: filter[i]["WooCommerceEventsTicketLogo"],
                        id: filter[i]["WooCommerceEventsProductID"],
                        type: filter[i]["WooCommerceEventsType"],
                      ),
                      arguments: filter[i]["WooCommerceEventsName"],
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
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filter[i]["WooCommerceEventsName"],
                                    style: TextStyle(
                                        fontFamily: "popinsemi",
                                        fontSize: width * 0.05),
                                  ),
                                  Text(
                                      filter[i]["WooCommerceEventsType"] ==
                                              "single"
                                          ? "Add on"
                                          : "Bookable Events",
                                      style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: filter[i]
                                                    ["WooCommerceEventsType"] ==
                                                "single"
                                            ? Colors.red
                                            : Colors.green,
                                      ))
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
            }, childCount: filter.length))
          ],
        ),
      ));
    return Container(
      height: height * 0.75,
      child: RefreshIndicator(
        onRefresh: () async {
          refresh();
        },
        child: ListView.separated(
            itemBuilder: (_, i) {
              return InkWell(
                onTap: () {
                  if (filter[i]["WooCommerceEventsType"].toString() ==
                      "single") {
                    Get.to(
                        () => Ticket(
                              id: filter[i]["WooCommerceEventsProductID"],
                              img: filter[i]["WooCommerceEventsTicketLogo"],
                              type: "single",
                            ),
                        arguments: [
                          filter[i]["WooCommerceEventsName"],
                          "${filter[i]["WooCommerceEventsDateDay"]} ${filter[i]["WooCommerceEventsDateMonth"]} ${filter[i]["WooCommerceEventsDateYear"]}"
                        ]);
                  } else {
                    Get.to(
                        () => Calendar(
                              image: filter[i]["WooCommerceEventsTicketLogo"],
                              id: filter[i]["WooCommerceEventsProductID"],
                              type: filter[i]["WooCommerceEventsType"],
                            ),
                        arguments: filter[i]["WooCommerceEventsName"],
                        transition: Transition.rightToLeftWithFade);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: width / 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filter[i]["WooCommerceEventsName"],
                                    style: TextStyle(
                                        fontFamily: "popinsemi",
                                        fontSize: width * 0.05),
                                  ),
                                  Text(
                                      filter[i]["WooCommerceEventsType"]
                                                  .toString() ==
                                              "single"
                                          ? "Add on"
                                          : "Bookable Events",
                                      style: TextStyle(
                                        fontSize: width * 0.035,
                                        color:
                                            filter[i]["WooCommerceEventsType"]
                                                        .toString() ==
                                                    "single"
                                                ? Colors.red
                                                : Colors.green,
                                      ))
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
      ),
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
                      filled: Get.isDarkMode,
                      fillColor: inputDark,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width / 40),
                          borderSide: Get.isDarkMode
                              ? BorderSide.none
                              : BorderSide(color: grayText)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width / 40),
                          borderSide:
                              Get.isDarkMode ? BorderSide.none : BorderSide())),
                )
              : CupertinoSearchTextField(
                  onChanged: (value) {
                    setState(() {
                      keyword = value;
                    });
                  },
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
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
                color: greenTheme,
                borderRadius: BorderRadius.circular(width / 40)),
            child: Icon(Iconsax.setting_4, color: Colors.white),
          ),
        )
      ],
    );
  }
}
