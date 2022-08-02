// To parse this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<TicketModel> ticketModelFromJson(String str) => List<TicketModel>.from(json.decode(str).map((x) => TicketModel.fromJson(x)));

String ticketModelToJson(List<TicketModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TicketModel {
    TicketModel({
        required this.customerFirstName,
        required this.customerLastName,
        required this.customerEmail,
        required this.customerPhone,
        required this.customerId,
        required this.wooCommerceEventsAttendeeName,
        required this.wooCommerceEventsAttendeeLastName,
        required this.wooCommerceEventsAttendeeEmail,
        required this.wooCommerceEventsAttendeeTelephone,
        required this.wooCommerceEventsAttendeeCompany,
        required this.wooCommerceEventsAttendeeDesignation,
        required this.wooCommerceEventsTicketId,
        required this.wooCommerceEventsStatus,
        required this.wooCommerceEventsMultidayStatus,
        required this.wooCommerceEventsTicketType,
        required this.wooCommerceEventsVariationId,
        required this.wooCommerceEventsProductId,
        required this.wooCommerceEventsNumDays,
        required this.wooCommerceEventsOrderId,
        required this.wooCommerceEventsTicketPrice,
        required this.wooCommerceEventsTicketPriceText,
        required this.wooCommerceEventsBookingSlotId,
        required this.wooCommerceEventsBookingSlot,
        required this.wooCommerceEventsBookingDate,
        required this.wooCommerceEventsBookingDateTimestamp,
        required this.wooCommerceEventsVariations,
        required this.wooCommerceEventsCustomAttendeeFields,
        required this.wooCommerceEventsRowName,
        required this.wooCommerceEventsSeatNumber,
        required this.wooCommerceEventsTicketExpirationType,
        required this.wooCommerceEventsTicketExpireTimestamp,
    });

    String customerFirstName;
    String customerLastName;
    String customerEmail;
    String customerPhone;
    String customerId;
    String wooCommerceEventsAttendeeName;
    String wooCommerceEventsAttendeeLastName;
    String wooCommerceEventsAttendeeEmail;
    String wooCommerceEventsAttendeeTelephone;
    String wooCommerceEventsAttendeeCompany;
    String wooCommerceEventsAttendeeDesignation;
    String wooCommerceEventsTicketId;
    String wooCommerceEventsStatus;
    String wooCommerceEventsMultidayStatus;
    String wooCommerceEventsTicketType;
    String wooCommerceEventsVariationId;
    String wooCommerceEventsProductId;
    String wooCommerceEventsNumDays;
    String wooCommerceEventsOrderId;
    String wooCommerceEventsTicketPrice;
    String wooCommerceEventsTicketPriceText;
    String wooCommerceEventsBookingSlotId;
    String wooCommerceEventsBookingSlot;
    String wooCommerceEventsBookingDate;
    String wooCommerceEventsBookingDateTimestamp;
    List<dynamic> wooCommerceEventsVariations;
    List<dynamic> wooCommerceEventsCustomAttendeeFields;
    String wooCommerceEventsRowName;
    String wooCommerceEventsSeatNumber;
    String wooCommerceEventsTicketExpirationType;
    String wooCommerceEventsTicketExpireTimestamp;

    factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        customerFirstName: json["customerFirstName"],
        customerLastName: json["customerLastName"],
        customerEmail: json["customerEmail"],
        customerPhone: json["customerPhone"],
        customerId: json["customerID"],
        wooCommerceEventsAttendeeName: json["WooCommerceEventsAttendeeName"],
        wooCommerceEventsAttendeeLastName: json["WooCommerceEventsAttendeeLastName"],
        wooCommerceEventsAttendeeEmail: json["WooCommerceEventsAttendeeEmail"],
        wooCommerceEventsAttendeeTelephone: json["WooCommerceEventsAttendeeTelephone"],
        wooCommerceEventsAttendeeCompany: json["WooCommerceEventsAttendeeCompany"],
        wooCommerceEventsAttendeeDesignation: json["WooCommerceEventsAttendeeDesignation"],
        wooCommerceEventsTicketId: json["WooCommerceEventsTicketID"],
        wooCommerceEventsStatus: json["WooCommerceEventsStatus"],
        wooCommerceEventsMultidayStatus: json["WooCommerceEventsMultidayStatus"],
        wooCommerceEventsTicketType: json["WooCommerceEventsTicketType"],
        wooCommerceEventsVariationId: json["WooCommerceEventsVariationID"],
        wooCommerceEventsProductId: json["WooCommerceEventsProductID"],
        wooCommerceEventsNumDays: json["WooCommerceEventsNumDays"],
        wooCommerceEventsOrderId: json["WooCommerceEventsOrderID"],
        wooCommerceEventsTicketPrice: json["WooCommerceEventsTicketPrice"],
        wooCommerceEventsTicketPriceText: json["WooCommerceEventsTicketPriceText"],
        wooCommerceEventsBookingSlotId: json["WooCommerceEventsBookingSlotID"],
        wooCommerceEventsBookingSlot: json["WooCommerceEventsBookingSlot"],
        wooCommerceEventsBookingDate: json["WooCommerceEventsBookingDate"],
        wooCommerceEventsBookingDateTimestamp: json["WooCommerceEventsBookingDateTimestamp"],
        wooCommerceEventsVariations: json["WooCommerceEventsVariations"] != null
            ? List<dynamic>.from(
                json["WooCommerceEventsVariations"].map((x) => x))
            : <dynamic>[],
        wooCommerceEventsCustomAttendeeFields:
            json["WooCommerceEventsCustomAttendeeFields"] != null
                ? List<dynamic>.from(
                    json["WooCommerceEventsCustomAttendeeFields"].map((x) => x))
                : <dynamic>[],
        wooCommerceEventsRowName: json["WooCommerceEventsRowName"],
        wooCommerceEventsSeatNumber: json["WooCommerceEventsSeatNumber"],
        wooCommerceEventsTicketExpirationType: json["WooCommerceEventsTicketExpirationType"],
        wooCommerceEventsTicketExpireTimestamp: json["WooCommerceEventsTicketExpireTimestamp"],
    );

    Map<String, dynamic> toJson() => {
        "customerFirstName": customerFirstName,
        "customerLastName": customerLastName,
        "customerEmail": customerEmail,
        "customerPhone": customerPhone,
        "customerID": customerId,
        "WooCommerceEventsAttendeeName": wooCommerceEventsAttendeeName,
        "WooCommerceEventsAttendeeLastName": wooCommerceEventsAttendeeLastName,
        "WooCommerceEventsAttendeeEmail": wooCommerceEventsAttendeeEmail,
        "WooCommerceEventsAttendeeTelephone": wooCommerceEventsAttendeeTelephone,
        "WooCommerceEventsAttendeeCompany": wooCommerceEventsAttendeeCompany,
        "WooCommerceEventsAttendeeDesignation": wooCommerceEventsAttendeeDesignation,
        "WooCommerceEventsTicketID": wooCommerceEventsTicketId,
        "WooCommerceEventsStatus": wooCommerceEventsStatus,
        "WooCommerceEventsMultidayStatus": wooCommerceEventsMultidayStatus,
        "WooCommerceEventsTicketType": wooCommerceEventsTicketType,
        "WooCommerceEventsVariationID": wooCommerceEventsVariationId,
        "WooCommerceEventsProductID": wooCommerceEventsProductId,
        "WooCommerceEventsNumDays": wooCommerceEventsNumDays,
        "WooCommerceEventsOrderID": wooCommerceEventsOrderId,
        "WooCommerceEventsTicketPrice": wooCommerceEventsTicketPrice,
        "WooCommerceEventsTicketPriceText": wooCommerceEventsTicketPriceText,
        "WooCommerceEventsBookingSlotID": wooCommerceEventsBookingSlotId,
        "WooCommerceEventsBookingSlot": wooCommerceEventsBookingSlot,
        "WooCommerceEventsBookingDate": wooCommerceEventsBookingDate,
        "WooCommerceEventsBookingDateTimestamp": wooCommerceEventsBookingDateTimestamp,
        "WooCommerceEventsVariations": List<dynamic>.from(wooCommerceEventsVariations.map((x) => x)),
        "WooCommerceEventsCustomAttendeeFields": List<dynamic>.from(wooCommerceEventsCustomAttendeeFields.map((x) => x)),
        "WooCommerceEventsRowName": wooCommerceEventsRowName,
        "WooCommerceEventsSeatNumber": wooCommerceEventsSeatNumber,
        "WooCommerceEventsTicketExpirationType": wooCommerceEventsTicketExpirationType,
        "WooCommerceEventsTicketExpireTimestamp": wooCommerceEventsTicketExpireTimestamp,
    };
}
