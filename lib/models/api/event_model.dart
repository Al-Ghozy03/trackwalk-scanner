// // To parse required this JSON data, do
// //
// //     final eventModel = eventModelFromJson(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators


// List<EventModel> eventModelFromJson(String str) => List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

// String eventModelToJson(List<EventModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
  EventModel({
    required this.wooCommerceEventsProductId,
    required this.wooCommerceEventsName,
    required this.wooCommerceEventsDate,
    required this.wooCommerceEventsNumDays,
    required this.wooCommerceEventsHour,
    required this.wooCommerceEventsMinutes,
    required this.wooCommerceEventsPeriod,
    required this.wooCommerceEventsHourEnd,
    required this.wooCommerceEventsMinutesEnd,
    required this.wooCommerceEventsEndPeriod,
    required this.wooCommerceEventsTimeZone,
    required this.wooCommerceEventsDateFull,
    required this.wooCommerceEventsDateTimestamp,
    required this.wooCommerceEventsDateDay,
    required this.wooCommerceEventsDateMonth,
    required this.wooCommerceEventsDateYear,
    required this.wooCommerceEventsTicketLogo,
    required this.wooCommerceEventsTicketHeaderImage,
    required this.wooCommerceEventsLocation,
    required this.wooCommerceEventsSupportContact,
    required this.wooCommerceEventsEmail,
    required this.wooCommerceEventsGps,
    required this.wooCommerceEventsGoogleMaps,
    required this.wooCommerceEventsDirections,
    required this.wooCommerceEventsBackgroundColor,
    required this.wooCommerceEventsTextColor,
    required this.wooCommerceEventsBookingsBookingDetailsOverride,
    required this.wooCommerceEventsBookingsBookingDetailsOverridePlural,
    required this.wooCommerceEventsBookingsSlotOverride,
    required this.wooCommerceEventsBookingsSlotOverridePlural,
    required this.wooCommerceEventsBookingsDateOverride,
    required this.wooCommerceEventsBookingsDateOverridePlural,
    required this.wooCommerceEventsType,
    required this.wooCommerceEventsBookingOptionIDs,
    required this.wooCommerceEventsBookingOptions,
    required this.wooCommerceEventsEndDate,
    required this.wooCommerceEventsEndDateFull,
    required this.wooCommerceEventsEndDateTimestamp,
    required this.wooCommerceEventsEndDateDay,
    required this.wooCommerceEventsEndDateMonth,
    required this.wooCommerceEventsEndDateYear,
  });

  String wooCommerceEventsProductId;
  String wooCommerceEventsName;
  String wooCommerceEventsDate;
  String wooCommerceEventsNumDays;
  String wooCommerceEventsHour;
  String wooCommerceEventsMinutes;
  String wooCommerceEventsPeriod;
  String wooCommerceEventsHourEnd;
  String wooCommerceEventsMinutesEnd;
  String wooCommerceEventsEndPeriod;
  String wooCommerceEventsTimeZone;
  String wooCommerceEventsDateFull;
  String wooCommerceEventsDateTimestamp;
  String wooCommerceEventsDateDay;
  String wooCommerceEventsDateMonth;
  String wooCommerceEventsDateYear;
  String wooCommerceEventsTicketLogo;
  String wooCommerceEventsTicketHeaderImage;
  String wooCommerceEventsLocation;
  String wooCommerceEventsSupportContact;
  String wooCommerceEventsEmail;
  String wooCommerceEventsGps;
  String wooCommerceEventsGoogleMaps;
  String wooCommerceEventsDirections;
  String wooCommerceEventsBackgroundColor;
  String wooCommerceEventsTextColor;
  String wooCommerceEventsBookingsBookingDetailsOverride;
  String wooCommerceEventsBookingsBookingDetailsOverridePlural;
  String wooCommerceEventsBookingsSlotOverride;
  String wooCommerceEventsBookingsSlotOverridePlural;
  String wooCommerceEventsBookingsDateOverride;
  String wooCommerceEventsBookingsDateOverridePlural;
  String wooCommerceEventsType;
  List? wooCommerceEventsBookingOptionIDs;
  Map? wooCommerceEventsBookingOptions;
  String? wooCommerceEventsEndDate;
  String? wooCommerceEventsEndDateFull;
  String? wooCommerceEventsEndDateTimestamp;
  String? wooCommerceEventsEndDateDay;
  String? wooCommerceEventsEndDateMonth;
  String? wooCommerceEventsEndDateYear;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        wooCommerceEventsProductId: json["WooCommerceEventsProductID"],
        wooCommerceEventsName: json["WooCommerceEventsName"],
        wooCommerceEventsDate: json["WooCommerceEventsDate"],
        wooCommerceEventsNumDays: json["WooCommerceEventsNumDays"],
        wooCommerceEventsHour: json["WooCommerceEventsHour"],
        wooCommerceEventsMinutes: json["WooCommerceEventsMinutes"],
        wooCommerceEventsPeriod: json["WooCommerceEventsPeriod"],
        wooCommerceEventsHourEnd: json["WooCommerceEventsHourEnd"],
        wooCommerceEventsMinutesEnd: json["WooCommerceEventsMinutesEnd"],
        wooCommerceEventsEndPeriod: json["WooCommerceEventsEndPeriod"],
        wooCommerceEventsTimeZone: json["WooCommerceEventsTimeZone"],
        wooCommerceEventsDateFull: json["WooCommerceEventsDateFull"],
        wooCommerceEventsDateTimestamp: json["WooCommerceEventsDateTimestamp"],
        wooCommerceEventsDateDay: json["WooCommerceEventsDateDay"],
        wooCommerceEventsDateMonth: json["WooCommerceEventsDateMonth"],
        wooCommerceEventsDateYear: json["WooCommerceEventsDateYear"],
        wooCommerceEventsTicketLogo: json["WooCommerceEventsTicketLogo"],
        wooCommerceEventsTicketHeaderImage:
            json["WooCommerceEventsTicketHeaderImage"],
        wooCommerceEventsLocation: json["WooCommerceEventsLocation"],
        wooCommerceEventsSupportContact:
            json["WooCommerceEventsSupportContact"],
        wooCommerceEventsEmail: json["WooCommerceEventsEmail"],
        wooCommerceEventsGps: json["WooCommerceEventsGPS"],
        wooCommerceEventsGoogleMaps: json["WooCommerceEventsGoogleMaps"],
        wooCommerceEventsDirections: json["WooCommerceEventsDirections"],
        wooCommerceEventsBackgroundColor:
            json["WooCommerceEventsBackgroundColor"],
        wooCommerceEventsTextColor: json["WooCommerceEventsTextColor"],
        wooCommerceEventsBookingsBookingDetailsOverride:
            json["WooCommerceEventsBookingsBookingDetailsOverride"],
        wooCommerceEventsBookingsBookingDetailsOverridePlural:
            json["WooCommerceEventsBookingsBookingDetailsOverridePlural"],
        wooCommerceEventsBookingsSlotOverride:
            json["WooCommerceEventsBookingsSlotOverride"],
        wooCommerceEventsBookingsSlotOverridePlural:
            json["WooCommerceEventsBookingsSlotOverridePlural"],
        wooCommerceEventsBookingsDateOverride:
            json["WooCommerceEventsBookingsDateOverride"],
        wooCommerceEventsBookingsDateOverridePlural:
            json["WooCommerceEventsBookingsDateOverridePlural"],
        wooCommerceEventsType: json["WooCommerceEventsType"],
        wooCommerceEventsBookingOptionIDs:
            json["WooCommerceEventsBookingOptionIDs"] == null
                ? null
                : List<String>.from(
                    json["WooCommerceEventsBookingOptionIDs"].map((x) => x)),
        wooCommerceEventsBookingOptions:
            json["wooCommerceEventsBookingOptions"] == null
                ? null
                : Map.from(json["WooCommerceEventsBookingOptions"]).map(
                    (k, v) => MapEntry<String, WooCommerceEventsBookingOption>(
                        k, WooCommerceEventsBookingOption.fromJson(v))),
        wooCommerceEventsEndDate: json["WooCommerceEventsEndDate"] ?? null,
        wooCommerceEventsEndDateFull:
            json["WooCommerceEventsEndDateFull"] ?? null,
        wooCommerceEventsEndDateTimestamp:
            json["WooCommerceEventsEndDateTimestamp"] ?? null,
        wooCommerceEventsEndDateDay:
            json["WooCommerceEventsEndDateDay"] ?? null,
        wooCommerceEventsEndDateMonth:
            json["WooCommerceEventsEndDateMonth"] ?? null,
        wooCommerceEventsEndDateYear:
            json["WooCommerceEventsEndDateYear"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "WooCommerceEventsProductID": wooCommerceEventsProductId,
        "WooCommerceEventsName": wooCommerceEventsName,
        "WooCommerceEventsDate": wooCommerceEventsDate,
        "WooCommerceEventsNumDays": wooCommerceEventsNumDays,
        "WooCommerceEventsHour": wooCommerceEventsHour,
        "WooCommerceEventsMinutes": wooCommerceEventsMinutes,
        "WooCommerceEventsPeriod": wooCommerceEventsPeriod,
        "WooCommerceEventsHourEnd": wooCommerceEventsHourEnd,
        "WooCommerceEventsMinutesEnd": wooCommerceEventsMinutesEnd,
        "WooCommerceEventsEndPeriod": wooCommerceEventsEndPeriod,
        "WooCommerceEventsTimeZone": wooCommerceEventsTimeZone,
        "WooCommerceEventsDateFull": wooCommerceEventsDateFull,
        "WooCommerceEventsDateTimestamp": wooCommerceEventsDateTimestamp,
        "WooCommerceEventsDateDay": wooCommerceEventsDateDay,
        "WooCommerceEventsDateMonth": wooCommerceEventsDateMonth,
        "WooCommerceEventsDateYear": wooCommerceEventsDateYear,
        "WooCommerceEventsTicketLogo": wooCommerceEventsTicketLogo,
        "WooCommerceEventsTicketHeaderImage":
            wooCommerceEventsTicketHeaderImage,
        "WooCommerceEventsLocation": wooCommerceEventsLocation,
        "WooCommerceEventsSupportContact": wooCommerceEventsSupportContact,
        "WooCommerceEventsEmail": wooCommerceEventsEmail,
        "WooCommerceEventsGPS": wooCommerceEventsGps,
        "WooCommerceEventsGoogleMaps": wooCommerceEventsGoogleMaps,
        "WooCommerceEventsDirections": wooCommerceEventsDirections,
        "WooCommerceEventsBackgroundColor": wooCommerceEventsBackgroundColor,
        "WooCommerceEventsTextColor": wooCommerceEventsTextColor,
        "WooCommerceEventsBookingsBookingDetailsOverride":
            wooCommerceEventsBookingsBookingDetailsOverride,
        "WooCommerceEventsBookingsBookingDetailsOverridePlural":
            wooCommerceEventsBookingsBookingDetailsOverridePlural,
        "WooCommerceEventsBookingsSlotOverride":
            wooCommerceEventsBookingsSlotOverride,
        "WooCommerceEventsBookingsSlotOverridePlural":
            wooCommerceEventsBookingsSlotOverridePlural,
        "WooCommerceEventsBookingsDateOverride":
            wooCommerceEventsBookingsDateOverride,
        "WooCommerceEventsBookingsDateOverridePlural":
            wooCommerceEventsBookingsDateOverridePlural,
        "WooCommerceEventsType": wooCommerceEventsType,
        "WooCommerceEventsBookingOptionIDs":
            wooCommerceEventsBookingOptionIDs == null
                ? null
                : List<dynamic>.from(
                    wooCommerceEventsBookingOptionIDs!.map((x) => x)),
        "WooCommerceEventsBookingOptions":
            wooCommerceEventsBookingOptions == null
                ? null
                : Map.from(wooCommerceEventsBookingOptions!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "WooCommerceEventsEndDate": wooCommerceEventsEndDate ?? null,
        "WooCommerceEventsEndDateFull": wooCommerceEventsEndDateFull ?? null,
        "WooCommerceEventsEndDateTimestamp":
            wooCommerceEventsEndDateTimestamp ?? null,
        "WooCommerceEventsEndDateDay": wooCommerceEventsEndDateDay ?? null,
        "WooCommerceEventsEndDateMonth": wooCommerceEventsEndDateMonth ?? null,
        "WooCommerceEventsEndDateYear": wooCommerceEventsEndDateYear ?? null,
      };
}

class WooCommerceEventsBookingOption {
  WooCommerceEventsBookingOption({
    required this.label,
    required this.addDate,
    required this.addDateIds,
  });

  String label;
  Map<String, AddDate> addDate;
  List<String> addDateIds;

  factory WooCommerceEventsBookingOption.fromJson(Map<String, dynamic> json) =>
      WooCommerceEventsBookingOption(
        label: json["label"],
        addDate: Map.from(json["add_date"])
            .map((k, v) => MapEntry<String, AddDate>(k, AddDate.fromJson(v))),
        addDateIds: List<String>.from(json["add_date_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "add_date": Map.from(addDate)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "add_date_ids": List<dynamic>.from(addDateIds.map((x) => x)),
      };
}

class AddDate {
  AddDate({
    required this.date,
    required this.zoomId,
    required this.stock,
    required this.dateTimestamp,
  });

  String date;
  String? zoomId;
  String stock;
  String dateTimestamp;

  factory AddDate.fromJson(Map<String, dynamic> json) => AddDate(
        date: json["date"],
        zoomId: json["zoom_id"] ?? null,
        stock: json["stock"],
        dateTimestamp: json["date_timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "zoom_id": zoomId ?? null,
        "stock": stock,
        "date_timestamp": dateTimestamp,
      };
}
