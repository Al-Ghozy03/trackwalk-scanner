// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, prefer_typing_uninitialized_variables, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:track_walk_admin/colors.dart';
import 'package:track_walk_admin/screen/tickets.dart';

class Calendar extends StatefulWidget {
  final image;
  String id;

  Calendar({super.key, required this.image, required this.id});
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  final arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(width / 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(GetPlatform.isAndroid
                      ? Iconsax.arrow_left
                      : Icons.arrow_back_ios_rounded)),
              SizedBox(height: width / 20),
              TableCalendar(
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) => _focusedDay = focusedDay,
                focusedDay: _selectedDay,
                firstDay: DateTime(1990),
                lastDay: DateTime(2050),
                calendarFormat: calendarFormat,
                calendarStyle: CalendarStyle(
                    weekendTextStyle: TextStyle(color: Colors.red),
                    selectedDecoration: BoxDecoration(
                        color: blueTheme, shape: BoxShape.circle)),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(fontFamily: "popinsemi"),
                    weekendStyle:
                        TextStyle(fontFamily: "popinsemi", color: Colors.red)),
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                        fontFamily: "popinsemi", fontSize: width / 20)),
              ),
              SizedBox(height: width / 20),
              Container(
                width: width,
                child: GetPlatform.isIOS
                    ? CupertinoButton.filled(
                        child: Text("Next"),
                        onPressed: () {
                          Get.to(
                              Ticket(
                                id: widget.id,
                                img: widget.image,
                                type: "bookings",
                              ),
                              arguments: [
                                arguments,
                                _selectedDay,
                              ],
                              transition: Transition.rightToLeftWithFade);
                        })
                    : ElevatedButton(
                        onPressed: () {
                          Get.to(
                              Ticket(
                                id: widget.id,
                                img: widget.image,
                                type: "bookings",
                              ),
                              arguments: [
                                arguments,
                                _selectedDay,
                                widget.image
                              ],
                              transition: Transition.rightToLeftWithFade);
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(width / 40))),
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontFamily: "popinsemi", fontSize: width / 20),
                        ),
                      ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
