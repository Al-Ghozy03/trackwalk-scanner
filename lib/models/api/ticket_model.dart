//To parse required this JSON data, do
//
//     final ticketModel = ticketModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'dart:convert';

List<TicketModel> ticketModelFromJson(String str) => List<TicketModel>.from(json.decode(str).map((x) => TicketModel.fromJson(x)));

String ticketModelToJson(List<TicketModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TicketModel {
    TicketModel({
        required this.id,
        required this.parentId,
        required this.status,
        required this.currency,
        required this.version,
        required this.pricesIncludeTax,
        required this.dateCreated,
        required this.dateModified,
        required this.discountTotal,
        required this.discountTax,
        required this.shippingTotal,
        required this.shippingTax,
        required this.cartTax,
        required this.total,
        required this.totalTax,
        required this.customerId,
        required this.orderKey,
        required this.billing,
        required this.shipping,
        required this.paymentMethod,
        required this.paymentMethodTitle,
        required this.transactionId,
        required this.customerIpAddress,
        required this.customerUserAgent,
        required this.createdVia,
        required this.customerNote,
        required this.dateCompleted,
        required this.datePaid,
        required this.cartHash,
        required this.number,
        required this.metaData,
        required this.lineItems,
        required this.taxLines,
        required this.shippingLines,
        required this.feeLines,
        required this.couponLines,
        required this.refunds,
        required this.paymentUrl,
        required this.isEditable,
        required this.needsPayment,
        required this.needsProcessing,
        required this.dateCreatedGmt,
        required this.dateModifiedGmt,
        required this.dateCompletedGmt,
        required this.datePaidGmt,
        required this.currencySymbol,
        required this.links,
    });

    int id;
    int parentId;
    String status;
    String currency;
    String version;
    bool pricesIncludeTax;
    DateTime dateCreated;
    DateTime dateModified;
    String discountTotal;
    String discountTax;
    String shippingTotal;
    String shippingTax;
    String cartTax;
    String total;
    String totalTax;
    int customerId;
    String orderKey;
    Ing billing;
    Ing shipping;
    String paymentMethod;
    String paymentMethodTitle;
    String transactionId;
    String customerIpAddress;
    String customerUserAgent;
    String createdVia;
    String customerNote;
    DateTime? dateCompleted;
    DateTime? datePaid;
    String cartHash;
    String number;
    List<TicketModelMetaDatum> metaData;
    List<LineItem> lineItems;
    List<dynamic> taxLines;
    List<dynamic> shippingLines;
    List<FeeLine> feeLines;
    List<dynamic> couponLines;
    List<dynamic> refunds;
    String paymentUrl;
    bool isEditable;
    bool needsPayment;
    bool needsProcessing;
    DateTime? dateCreatedGmt;
    DateTime? dateModifiedGmt;
    DateTime? dateCompletedGmt;
    DateTime? datePaidGmt;
    String currencySymbol;
    Links links;

    factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        id: json["id"],
        parentId: json["parent_id"],
        status: json["status"],
        currency: json["currency"],
        version: json["version"],
        pricesIncludeTax: json["prices_include_tax"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateModified: DateTime.parse(json["date_modified"]),
        discountTotal: json["discount_total"],
        discountTax: json["discount_tax"],
        shippingTotal: json["shipping_total"],
        shippingTax: json["shipping_tax"],
        cartTax: json["cart_tax"],
        total: json["total"],
        totalTax: json["total_tax"],
        customerId: json["customer_id"],
        orderKey: json["order_key"],
        billing: Ing.fromJson(json["billing"]),
        shipping: Ing.fromJson(json["shipping"]),
        paymentMethod: json["payment_method"],
        paymentMethodTitle: json["payment_method_title"],
        transactionId: json["transaction_id"],
        customerIpAddress: json["customer_ip_address"],
        customerUserAgent: json["customer_user_agent"],
        createdVia: json["created_via"],
        customerNote: json["customer_note"],
        dateCompleted: json["date_completed"] == null ? null : DateTime.parse(json["date_completed"]),
        datePaid: json["date_paid"] == null ? null : DateTime.parse(json["date_paid"]),
        cartHash: json["cart_hash"],
        number: json["number"],
        metaData: List<TicketModelMetaDatum>.from(json["meta_data"].map((x) => TicketModelMetaDatum.fromJson(x))),
        lineItems: List<LineItem>.from(json["line_items"].map((x) => LineItem.fromJson(x))),
        taxLines: List<dynamic>.from(json["tax_lines"].map((x) => x)),
        shippingLines: List<dynamic>.from(json["shipping_lines"].map((x) => x)),
        feeLines: List<FeeLine>.from(json["fee_lines"].map((x) => FeeLine.fromJson(x))),
        couponLines: List<dynamic>.from(json["coupon_lines"].map((x) => x)),
        refunds: List<dynamic>.from(json["refunds"].map((x) => x)),
        paymentUrl: json["payment_url"],
        isEditable: json["is_editable"],
        needsPayment: json["needs_payment"],
        needsProcessing: json["needs_processing"],
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        dateCompletedGmt: json["date_completed_gmt"] == null ? null : DateTime.parse(json["date_completed_gmt"]),
        datePaidGmt: json["date_paid_gmt"] == null ? null : DateTime.parse(json["date_paid_gmt"]),
        currencySymbol: json["currency_symbol"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "status": status,
        "currency": currency,
        "version": version,
        "prices_include_tax": pricesIncludeTax,
        "date_created": dateCreated.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "discount_total": discountTotal,
        "discount_tax": discountTax,
        "shipping_total": shippingTotal,
        "shipping_tax": shippingTax,
        "cart_tax": cartTax,
        "total": total,
        "total_tax": totalTax,
        "customer_id": customerId,
        "order_key": orderKey,
        "billing": billing.toJson(),
        "shipping": shipping.toJson(),
        "payment_method": paymentMethod,
        "payment_method_title": paymentMethodTitle,
        "transaction_id": transactionId,
        "customer_ip_address": customerIpAddress,
        "customer_user_agent": customerUserAgent,
        "created_via": createdVia,
        "customer_note": customerNote,
        "date_completed": dateCompleted == null ? null : dateCompleted!.toIso8601String(),
        "date_paid": datePaid == null ? null : datePaid!.toIso8601String(),
        "cart_hash": cartHash,
        "number": number,
        "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
        "line_items": List<dynamic>.from(lineItems.map((x) => x.toJson())),
        "tax_lines": List<dynamic>.from(taxLines.map((x) => x)),
        "shipping_lines": List<dynamic>.from(shippingLines.map((x) => x)),
        "fee_lines": List<dynamic>.from(feeLines.map((x) => x.toJson())),
        "coupon_lines": List<dynamic>.from(couponLines.map((x) => x)),
        "refunds": List<dynamic>.from(refunds.map((x) => x)),
        "payment_url": paymentUrl,
        "is_editable": isEditable,
        "needs_payment": needsPayment,
        "needs_processing": needsProcessing,
        "date_created_gmt": dateCreatedGmt!.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt!.toIso8601String(),
        "date_completed_gmt": dateCompletedGmt == null ? null : dateCompletedGmt!.toIso8601String(),
        "date_paid_gmt": datePaidGmt == null ? null : datePaidGmt!.toIso8601String(),
        "currency_symbol": currencySymbol,
        "_links": links.toJson(),
    };
}

class Ing {
    Ing({
        required this.firstName,
        required this.lastName,
        required this.company,
        required this.address1,
        required this.address2,
        required this.city,
        required this.state,
        required this.postcode,
        required this.country,
        required this.email,
        required this.phone,
    });

    String firstName;
    String lastName;
    String company;
    String address1;
    String address2;
    String city;
    String state;
    String postcode;
    String country;
    String email;
    String phone;

    factory Ing.fromJson(Map<String, dynamic> json) => Ing(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
        email: json["email"] == null ? null : json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": country,
        "email": email == null ? null : email,
        "phone": phone,
    };
}

class FeeLine {
    FeeLine({
        required this.id,
        required this.name,
        required this.taxClass,
        required this.taxStatus,
        required this.amount,
        required this.total,
        required this.totalTax,
        required this.taxes,
        required this.metaData,
    });

    int id;
    String name;
    String taxClass;
    String taxStatus;
    String amount;
    String total;
    String totalTax;
    List<dynamic> taxes;
    List<FeeLineMetaDatum> metaData;

    factory FeeLine.fromJson(Map<String, dynamic> json) => FeeLine(
        id: json["id"],
        name: json["name"],
        taxClass: json["tax_class"],
        taxStatus: json["tax_status"],
        amount: json["amount"],
        total: json["total"],
        totalTax: json["total_tax"],
        taxes: List<dynamic>.from(json["taxes"].map((x) => x)),
        metaData: List<FeeLineMetaDatum>.from(json["meta_data"].map((x) => FeeLineMetaDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tax_class": taxClass,
        "tax_status": taxStatus,
        "amount": amount,
        "total": total,
        "total_tax": totalTax,
        "taxes": List<dynamic>.from(taxes.map((x) => x)),
        "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
    };
}

class FeeLineMetaDatum {
    FeeLineMetaDatum({
        required this.id,
        required this.key,
        required this.value,
        required this.displayKey,
        required this.displayValue,
    });

    int id;
    String key;
    String value;
    String displayKey;
    String displayValue;

    factory FeeLineMetaDatum.fromJson(Map<String, dynamic> json) => FeeLineMetaDatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
        displayKey: json["display_key"],
        displayValue: json["display_value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
        "display_key": displayKey,
        "display_value": displayValue,
    };
}

class LineItem {
    LineItem({
        required this.id,
        required this.name,
        required this.productId,
        required this.variationId,
        required this.quantity,
        required this.taxClass,
        required this.subtotal,
        required this.subtotalTax,
        required this.total,
        required this.totalTax,
        required this.taxes,
        required this.metaData,
        required this.sku,
        required this.price,
        required this.image,
        required this.parentName,
        required this.bundledBy,
        required this.bundledItemTitle,
        required this.bundledItems,
    });

    int id;
    String name;
    int productId;
    int variationId;
    int quantity;
    String taxClass;
    String subtotal;
    String subtotalTax;
    String total;
    String totalTax;
    List<dynamic> taxes;
    List<LineItemMetaDatum> metaData;
    String sku;
    int price;
    Image image;
    dynamic parentName;
    String bundledBy;
    String bundledItemTitle;
    List<dynamic> bundledItems;

    factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
        id: json["id"],
        name: json["name"],
        productId: json["product_id"],
        variationId: json["variation_id"],
        quantity: json["quantity"],
        taxClass: json["tax_class"],
        subtotal: json["subtotal"],
        subtotalTax: json["subtotal_tax"],
        total: json["total"],
        totalTax: json["total_tax"],
        taxes: List<dynamic>.from(json["taxes"].map((x) => x)),
        metaData: List<LineItemMetaDatum>.from(json["meta_data"].map((x) => LineItemMetaDatum.fromJson(x))),
        sku: json["sku"],
        price: json["price"],
        image: Image.fromJson(json["image"]),
        parentName: json["parent_name"],
        bundledBy: json["bundled_by"],
        bundledItemTitle: json["bundled_item_title"],
        bundledItems: List<dynamic>.from(json["bundled_items"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_id": productId,
        "variation_id": variationId,
        "quantity": quantity,
        "tax_class": taxClass,
        "subtotal": subtotal,
        "subtotal_tax": subtotalTax,
        "total": total,
        "total_tax": totalTax,
        "taxes": List<dynamic>.from(taxes.map((x) => x)),
        "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
        "sku": sku,
        "price": price,
        "image": image.toJson(),
        "parent_name": parentName,
        "bundled_by": bundledBy,
        "bundled_item_title": bundledItemTitle,
        "bundled_items": List<dynamic>.from(bundledItems.map((x) => x)),
    };
}

class Image {
    Image({
        required this.id,
        required this.src,
    });

    String id;
    String src;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        src: json["src"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "src": src,
    };
}

class LineItemMetaDatum {
    LineItemMetaDatum({
        required this.id,
        required this.key,
        required this.value,
        required this.displayKey,
        required this.displayValue,
    });

    int id;
    String key;
    dynamic value;
    String displayKey;
    dynamic displayValue;

    factory LineItemMetaDatum.fromJson(Map<String, dynamic> json) => LineItemMetaDatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
        displayKey: json["display_key"],
        displayValue: json["display_value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
        "display_key": displayKey,
        "display_value": displayValue,
    };
}

class Links {
    Links({
        required this.self,
        required this.collection,
        required this.customer,
    });

    List<Collection> self;
    List<Collection> collection;
    List<Collection>? customer;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
        customer: json["customer"] == null ? null : List<Collection>.from(json["customer"].map((x) => Collection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "customer": customer == null ? null : List<dynamic>.from(customer!.map((x) => x.toJson())),
    };
}

class Collection {
    Collection({
        required this.href,
    });

    String href;

    factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class TicketModelMetaDatum {
    TicketModelMetaDatum({
        required this.id,
        required this.key,
        required this.value,
    });

    int id;
    String key;
    dynamic value;

    factory TicketModelMetaDatum.fromJson(Map<String, dynamic> json) => TicketModelMetaDatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
    };
}

class ValueClass {
    ValueClass({
        required this.the1,
        required this.the2,
        required this.the3,
        required this.the4,
        required this.the5,
        required this.the1081,
        required this.the2263,
        required this.the2266,
        required this.the2267,
        required this.the2269,
        required this.recalcFee,
        required this.recalcFeeSaveOrder,
        required this.fixedGateway,
        required this.feeItems,
        required this.the1665,
        required this.the1931,
        required this.the1952,
        required this.the1736,
    });

    Map<String, The1>? the1;
    The2? the2;
    The2? the3;
    The2? the4;
    The2? the5;
    int the1081;
    int the2263;
    int the2266;
    int the2267;
    int the2269;
    String recalcFee;
    String recalcFeeSaveOrder;
    String fixedGateway;
    List<dynamic>? feeItems;
    int the1665;
    int the1931;
    int the1952;
    int the1736;

    factory ValueClass.fromJson(Map<String, dynamic> json) => ValueClass(
        the1: json["1"] == null ? null : Map.from(json["1"]).map((k, v) => MapEntry<String, The1>(k, The1.fromJson(v))),
        the2: json["2"] == null ? null : The2.fromJson(json["2"]),
        the3: json["3"] == null ? null : The2.fromJson(json["3"]),
        the4: json["4"] == null ? null : The2.fromJson(json["4"]),
        the5: json["5"] == null ? null : The2.fromJson(json["5"]),
        the1081: json["1081"] == null ? null : json["1081"],
        the2263: json["2263"] == null ? null : json["2263"],
        the2266: json["2266"] == null ? null : json["2266"],
        the2267: json["2267"] == null ? null : json["2267"],
        the2269: json["2269"] == null ? null : json["2269"],
        recalcFee: json["recalc_fee"] == null ? null : json["recalc_fee"],
        recalcFeeSaveOrder: json["recalc_fee_save_order"] == null ? null : json["recalc_fee_save_order"],
        fixedGateway: json["fixed_gateway"] == null ? null : json["fixed_gateway"],
        feeItems: json["fee_items"] == null ? null : List<dynamic>.from(json["fee_items"].map((x) => x)),
        the1665: json["1665"] == null ? null : json["1665"],
        the1931: json["1931"] == null ? null : json["1931"],
        the1952: json["1952"] == null ? null : json["1952"],
        the1736: json["1736"] == null ? null : json["1736"],
    );

    Map<String, dynamic> toJson() => {
        "1": the1 == null ? null : Map.from(the1!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "2": the2 == null ? null : the2!.toJson(),
        "3": the3 == null ? null : the3!.toJson(),
        "4": the4 == null ? null : the4!.toJson(),
        "5": the5 == null ? null : the5!.toJson(),
        "1081": the1081 == null ? null : the1081,
        "2263": the2263 == null ? null : the2263,
        "2266": the2266 == null ? null : the2266,
        "2267": the2267 == null ? null : the2267,
        "2269": the2269 == null ? null : the2269,
        "recalc_fee": recalcFee == null ? null : recalcFee,
        "recalc_fee_save_order": recalcFeeSaveOrder == null ? null : recalcFeeSaveOrder,
        "fixed_gateway": fixedGateway == null ? null : fixedGateway,
        "fee_items": feeItems == null ? null : List<dynamic>.from(feeItems!.map((x) => x)),
        "1665": the1665 == null ? null : the1665,
        "1931": the1931 == null ? null : the1931,
        "1952": the1952 == null ? null : the1952,
        "1736": the1736 == null ? null : the1736,
    };
}

class The1 {
    The1({
        required this.wooCommerceEventsProductId,
        required this.wooCommerceEventsOrderId,
        required this.wooCommerceEventsTicketType,
        required this.wooCommerceEventsStatus,
        required this.wooCommerceEventsCustomerId,
        required this.wooCommerceEventsAttendeeName,
        required this.wooCommerceEventsAttendeeLastName,
        required this.wooCommerceEventsAttendeeEmail,
        required this.wooCommerceEventsAttendeeTelephone,
        required this.wooCommerceEventsAttendeeCompany,
        required this.wooCommerceEventsAttendeeDesignation,
        required this.wooCommerceEventsVariations,
        required this.wooCommerceEventsVariationId,
        required this.wooCommerceEventsPrice,
        required this.wooCommerceEventsPurchaserFirstName,
        required this.wooCommerceEventsPurchaserLastName,
        required this.wooCommerceEventsPurchaserEmail,
        required this.wooCommerceEventsPurchaserPhone,
        required this.wooCommerceEventsCustomAttendeeFields,
        required this.wooCommerceEventsSeatingFields,
        required this.wooCommerceEventsBookingOptions,
    });

    String wooCommerceEventsProductId;
    String wooCommerceEventsOrderId;
    String wooCommerceEventsTicketType;
    String wooCommerceEventsStatus;
    String wooCommerceEventsCustomerId;
    String wooCommerceEventsAttendeeName;
    String wooCommerceEventsAttendeeLastName;
    String wooCommerceEventsAttendeeEmail;
    String wooCommerceEventsAttendeeTelephone;
    String wooCommerceEventsAttendeeCompany;
    String wooCommerceEventsAttendeeDesignation;
    String wooCommerceEventsVariations;
    String wooCommerceEventsVariationId;
    String wooCommerceEventsPrice;
    String wooCommerceEventsPurchaserFirstName;
    String wooCommerceEventsPurchaserLastName;
    String wooCommerceEventsPurchaserEmail;
    String wooCommerceEventsPurchaserPhone;
    String wooCommerceEventsCustomAttendeeFields;
    String wooCommerceEventsSeatingFields;
    WooCommerceEventsBookingOptions? wooCommerceEventsBookingOptions;

    factory The1.fromJson(Map<String, dynamic> json) => The1(
        wooCommerceEventsProductId: json["WooCommerceEventsProductID"],
        wooCommerceEventsOrderId: json["WooCommerceEventsOrderID"],
        wooCommerceEventsTicketType: json["WooCommerceEventsTicketType"],
        wooCommerceEventsStatus: json["WooCommerceEventsStatus"],
        wooCommerceEventsCustomerId: json["WooCommerceEventsCustomerID"],
        wooCommerceEventsAttendeeName: json["WooCommerceEventsAttendeeName"],
        wooCommerceEventsAttendeeLastName: json["WooCommerceEventsAttendeeLastName"],
        wooCommerceEventsAttendeeEmail: json["WooCommerceEventsAttendeeEmail"],
        wooCommerceEventsAttendeeTelephone: json["WooCommerceEventsAttendeeTelephone"],
        wooCommerceEventsAttendeeCompany: json["WooCommerceEventsAttendeeCompany"],
        wooCommerceEventsAttendeeDesignation: json["WooCommerceEventsAttendeeDesignation"],
        wooCommerceEventsVariations: json["WooCommerceEventsVariations"],
        wooCommerceEventsVariationId: json["WooCommerceEventsVariationID"],
        wooCommerceEventsPrice: json["WooCommerceEventsPrice"],
        wooCommerceEventsPurchaserFirstName: json["WooCommerceEventsPurchaserFirstName"],
        wooCommerceEventsPurchaserLastName: json["WooCommerceEventsPurchaserLastName"],
        wooCommerceEventsPurchaserEmail: json["WooCommerceEventsPurchaserEmail"],
        wooCommerceEventsPurchaserPhone: json["WooCommerceEventsPurchaserPhone"],
        wooCommerceEventsCustomAttendeeFields: json["WooCommerceEventsCustomAttendeeFields"],
        wooCommerceEventsSeatingFields: json["WooCommerceEventsSeatingFields"],
        wooCommerceEventsBookingOptions: json["WooCommerceEventsBookingOptions"] == null ? null : WooCommerceEventsBookingOptions.fromJson(json["WooCommerceEventsBookingOptions"]),
    );

    Map<String, dynamic> toJson() => {
        "WooCommerceEventsProductID": wooCommerceEventsProductId,
        "WooCommerceEventsOrderID": wooCommerceEventsOrderId,
        "WooCommerceEventsTicketType": wooCommerceEventsTicketType,
        "WooCommerceEventsStatus": wooCommerceEventsStatus,
        "WooCommerceEventsCustomerID": wooCommerceEventsCustomerId,
        "WooCommerceEventsAttendeeName": wooCommerceEventsAttendeeName,
        "WooCommerceEventsAttendeeLastName": wooCommerceEventsAttendeeLastName,
        "WooCommerceEventsAttendeeEmail": wooCommerceEventsAttendeeEmail,
        "WooCommerceEventsAttendeeTelephone": wooCommerceEventsAttendeeTelephone,
        "WooCommerceEventsAttendeeCompany": wooCommerceEventsAttendeeCompany,
        "WooCommerceEventsAttendeeDesignation": wooCommerceEventsAttendeeDesignation,
        "WooCommerceEventsVariations": wooCommerceEventsVariations,
        "WooCommerceEventsVariationID": wooCommerceEventsVariationId,
        "WooCommerceEventsPrice": wooCommerceEventsPrice,
        "WooCommerceEventsPurchaserFirstName": wooCommerceEventsPurchaserFirstName,
        "WooCommerceEventsPurchaserLastName": wooCommerceEventsPurchaserLastName,
        "WooCommerceEventsPurchaserEmail": wooCommerceEventsPurchaserEmail,
        "WooCommerceEventsPurchaserPhone": wooCommerceEventsPurchaserPhone,
        "WooCommerceEventsCustomAttendeeFields": wooCommerceEventsCustomAttendeeFields,
        "WooCommerceEventsSeatingFields": wooCommerceEventsSeatingFields,
        "WooCommerceEventsBookingOptions": wooCommerceEventsBookingOptions == null ? null : wooCommerceEventsBookingOptions!.toJson(),
    };
}

class WooCommerceEventsBookingOptions {
    WooCommerceEventsBookingOptions({
        required this.slot,
        required this.slotLabel,
        required this.date,
        required this.dateLabel,
    });

    String slot;
    String slotLabel;
    String date;
    String dateLabel;

    factory WooCommerceEventsBookingOptions.fromJson(Map<String, dynamic> json) => WooCommerceEventsBookingOptions(
        slot: json["slot"],
        slotLabel: json["slot_label"],
        date: json["date"],
        dateLabel: json["date_label"],
    );

    Map<String, dynamic> toJson() => {
        "slot": slot,
        "slot_label": slotLabel,
        "date": date,
        "date_label": dateLabel,
    };
}

class The2 {
    The2({
        required this.the1,
    });

    The1 the1;

    factory The2.fromJson(Map<String, dynamic> json) => The2(
        the1: The1.fromJson(json["1"]),
    );

    Map<String, dynamic> toJson() => {
        "1": the1.toJson(),
    };
}