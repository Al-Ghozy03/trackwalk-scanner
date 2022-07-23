// To parse required this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

List<EventModel> eventModelFromJson(String str) => List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
    EventModel({
        required this.id,
        required this.name,
        required this.slug,
        required this.permalink,
        required this.dateCreated,
        required this.dateCreatedGmt,
        required this.dateModified,
        required this.dateModifiedGmt,
        required this.type,
        required this.status,
        required this.featured,
        required this.catalogVisibility,
        required this.description,
        required this.shortDescription,
        required this.sku,
        required this.price,
        required this.regularPrice,
        required this.salePrice,
        required this.dateOnSaleFrom,
        required this.dateOnSaleFromGmt,
        required this.dateOnSaleTo,
        required this.dateOnSaleToGmt,
        required this.onSale,
        required this.purchasable,
        required this.totalSales,
        required this.virtual,
        required this.downloadable,
        required this.downloads,
        required this.downloadLimit,
        required this.downloadExpiry,
        required this.externalUrl,
        required this.buttonText,
        required this.taxStatus,
        required this.taxClass,
        required this.manageStock,
        required this.stockQuantity,
        required this.backorders,
        required this.backordersAllowed,
        required this.backordered,
        required this.lowStockAmount,
        required this.soldIndividually,
        required this.weight,
        required this.dimensions,
        required this.shippingRequired,
        required this.shippingTaxable,
        required this.shippingClass,
        required this.shippingClassId,
        required this.reviewsAllowed,
        required this.averageRating,
        required this.ratingCount,
        required this.upsellIds,
        required this.crossSellIds,
        required this.parentId,
        required this.purchaseNote,
        required this.categories,
        required this.tags,
        required this.images,
        required this.attributes,
        required this.defaultAttributes,
        required this.variations,
        required this.groupedProducts,
        required this.menuOrder,
        required this.priceHtml,
        required this.relatedIds,
        required this.metaData,
        required this.stockStatus,
        required this.hasOptions,
        required this.bundledBy,
        required this.bundleStockStatus,
        required this.bundleStockQuantity,
        required this.bundleVirtual,
        required this.bundleLayout,
        required this.bundleAddToCartFormLocation,
        required this.bundleEditableInCart,
        required this.bundleSoldIndividuallyContext,
        required this.bundleItemGrouping,
        required this.bundleMinSize,
        required this.bundleMaxSize,
        required this.bundledItems,
        required this.bundleSellIds,
        required this.links,
    });

    int id;
    String name;
    String slug;
    String permalink;
    DateTime dateCreated;
    DateTime dateCreatedGmt;
    DateTime dateModified;
    DateTime dateModifiedGmt;
    String type;
    String status;
    bool featured;
    String catalogVisibility;
    String description;
    String shortDescription;
    String sku;
    String price;
    String regularPrice;
    String salePrice;
    dynamic dateOnSaleFrom;
    dynamic dateOnSaleFromGmt;
    dynamic dateOnSaleTo;
    dynamic dateOnSaleToGmt;
    bool onSale;
    bool purchasable;
    int totalSales;
    bool virtual;
    bool downloadable;
    List<dynamic> downloads;
    int downloadLimit;
    int downloadExpiry;
    String externalUrl;
    String buttonText;
    String taxStatus;
    String taxClass;
    bool manageStock;
    dynamic stockQuantity;
    String backorders;
    bool backordersAllowed;
    bool backordered;
    dynamic lowStockAmount;
    bool soldIndividually;
    String weight;
    Dimensions dimensions;
    bool shippingRequired;
    bool shippingTaxable;
    String shippingClass;
    int shippingClassId;
    bool reviewsAllowed;
    String averageRating;
    int ratingCount;
    List<dynamic> upsellIds;
    List<dynamic> crossSellIds;
    int parentId;
    String purchaseNote;
    List<Category> categories;
    List<dynamic> tags;
    List<Image> images;
    List<dynamic> attributes;
    List<dynamic> defaultAttributes;
    List<dynamic> variations;
    List<dynamic> groupedProducts;
    int menuOrder;
    String priceHtml;
    List<int> relatedIds;
    List<MetaDatum> metaData;
    String stockStatus;
    bool hasOptions;
    List<String> bundledBy;
    String bundleStockStatus;
    dynamic bundleStockQuantity;
    bool bundleVirtual;
    String bundleLayout;
    String bundleAddToCartFormLocation;
    bool bundleEditableInCart;
    String bundleSoldIndividuallyContext;
    String bundleItemGrouping;
    String bundleMinSize;
    String bundleMaxSize;
    List<dynamic> bundledItems;
    List<int> bundleSellIds;
    Links links;

    factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        type: json["type"],
        status: json["status"],
        featured: json["featured"],
        catalogVisibility: json["catalog_visibility"],
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        dateOnSaleFrom: json["date_on_sale_from"],
        dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
        dateOnSaleTo: json["date_on_sale_to"],
        dateOnSaleToGmt: json["date_on_sale_to_gmt"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        totalSales: json["total_sales"],
        virtual: json["virtual"],
        downloadable: json["downloadable"],
        downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: json["tax_status"],
        taxClass: json["tax_class"],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        backorders: json["backorders"],
        backordersAllowed: json["backorders_allowed"],
        backordered: json["backordered"],
        lowStockAmount: json["low_stock_amount"],
        soldIndividually: json["sold_individually"],
        weight: json["weight"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        shippingRequired: json["shipping_required"],
        shippingTaxable: json["shipping_taxable"],
        shippingClass: json["shipping_class"],
        shippingClassId: json["shipping_class_id"],
        reviewsAllowed: json["reviews_allowed"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
        crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
        parentId: json["parent_id"],
        purchaseNote: json["purchase_note"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
        defaultAttributes: List<dynamic>.from(json["default_attributes"].map((x) => x)),
        variations: List<dynamic>.from(json["variations"].map((x) => x)),
        groupedProducts: List<dynamic>.from(json["grouped_products"].map((x) => x)),
        menuOrder: json["menu_order"],
        priceHtml: json["price_html"],
        relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
        metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
        stockStatus: json["stock_status"],
        hasOptions: json["has_options"],
        bundledBy: List<String>.from(json["bundled_by"].map((x) => x)),
        bundleStockStatus: json["bundle_stock_status"],
        bundleStockQuantity: json["bundle_stock_quantity"],
        bundleVirtual: json["bundle_virtual"],
        bundleLayout: json["bundle_layout"],
        bundleAddToCartFormLocation: json["bundle_add_to_cart_form_location"],
        bundleEditableInCart: json["bundle_editable_in_cart"],
        bundleSoldIndividuallyContext: json["bundle_sold_individually_context"],
        bundleItemGrouping: json["bundle_item_grouping"],
        bundleMinSize: json["bundle_min_size"],
        bundleMaxSize: json["bundle_max_size"],
        bundledItems: List<dynamic>.from(json["bundled_items"].map((x) => x)),
        bundleSellIds: List<int>.from(json["bundle_sell_ids"].map((x) => x)),
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "permalink": permalink,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "type": type,
        "status": status,
        "featured": featured,
        "catalog_visibility": catalogVisibility,
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "date_on_sale_from": dateOnSaleFrom,
        "date_on_sale_from_gmt": dateOnSaleFromGmt,
        "date_on_sale_to": dateOnSaleTo,
        "date_on_sale_to_gmt": dateOnSaleToGmt,
        "on_sale": onSale,
        "purchasable": purchasable,
        "total_sales": totalSales,
        "virtual": virtual,
        "downloadable": downloadable,
        "downloads": List<dynamic>.from(downloads.map((x) => x)),
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status": taxStatus,
        "tax_class": taxClass,
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "backorders": backorders,
        "backorders_allowed": backordersAllowed,
        "backordered": backordered,
        "low_stock_amount": lowStockAmount,
        "sold_individually": soldIndividually,
        "weight": weight,
        "dimensions": dimensions.toJson(),
        "shipping_required": shippingRequired,
        "shipping_taxable": shippingTaxable,
        "shipping_class": shippingClass,
        "shipping_class_id": shippingClassId,
        "reviews_allowed": reviewsAllowed,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "upsell_ids": List<dynamic>.from(upsellIds.map((x) => x)),
        "cross_sell_ids": List<dynamic>.from(crossSellIds.map((x) => x)),
        "parent_id": parentId,
        "purchase_note": purchaseNote,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "attributes": List<dynamic>.from(attributes.map((x) => x)),
        "default_attributes": List<dynamic>.from(defaultAttributes.map((x) => x)),
        "variations": List<dynamic>.from(variations.map((x) => x)),
        "grouped_products": List<dynamic>.from(groupedProducts.map((x) => x)),
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
        "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
        "stock_status": stockStatus,
        "has_options": hasOptions,
        "bundled_by": List<dynamic>.from(bundledBy.map((x) => x)),
        "bundle_stock_status": bundleStockStatus,
        "bundle_stock_quantity": bundleStockQuantity,
        "bundle_virtual": bundleVirtual,
        "bundle_layout": bundleLayout,
        "bundle_add_to_cart_form_location": bundleAddToCartFormLocation,
        "bundle_editable_in_cart": bundleEditableInCart,
        "bundle_sold_individually_context": bundleSoldIndividuallyContext,
        "bundle_item_grouping": bundleItemGrouping,
        "bundle_min_size": bundleMinSize,
        "bundle_max_size": bundleMaxSize,
        "bundled_items": List<dynamic>.from(bundledItems.map((x) => x)),
        "bundle_sell_ids": List<dynamic>.from(bundleSellIds.map((x) => x)),
        "_links": links.toJson(),
    };
}

class Category {
    Category({
        required this.id,
        required this.name,
        required this.slug,
    });

    int id;
    String name;
    String slug;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
    };
}

class Dimensions {
    Dimensions({
        required this.length,
        required this.width,
        required this.height,
    });

    String length;
    String width;
    String height;

    factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json["length"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "length": length,
        "width": width,
        "height": height,
    };
}

class Image {
    Image({
        required this.id,
        required this.dateCreated,
        required this.dateCreatedGmt,
        required this.dateModified,
        required this.dateModifiedGmt,
        required this.src,
        required this.name,
        required this.alt,
    });

    int id;
    DateTime dateCreated;
    DateTime dateCreatedGmt;
    DateTime dateModified;
    DateTime dateModifiedGmt;
    String src;
    String name;
    String alt;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
    };
}

class Links {
    Links({
        required this.self,
        required this.collection,
    });

    List<Collection> self;
    List<Collection> collection;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
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

class MetaDatum {
    MetaDatum({
        required this.id,
        required this.key,
        required this.value,
    });

    int id;
    String key;
    dynamic value;

    factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
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

class PurpleValue {
    PurpleValue({
        required this.amount,
        required this.unit,
    });

    String amount;
    String unit;

    factory PurpleValue.fromJson(Map<String, dynamic> json) => PurpleValue(
        amount: json["amount"],
        unit: json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "unit": unit,
    };
}

class FluffyValue {
    FluffyValue({
        required this.enableProd,
        required this.gateways,
    });

    String enableProd;
    Map<String, Gateway> gateways;

    factory FluffyValue.fromJson(Map<String, dynamic> json) => FluffyValue(
        enableProd: json["enable_prod"],
        gateways: Map.from(json["gateways"]).map((k, v) => MapEntry<String, Gateway>(k, Gateway.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "enable_prod": enableProd,
        "gateways": Map.from(gateways).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Gateway {
    Gateway({
        required this.enable,
        required this.outputtext,
        required this.taxclass,
        required this.addvaluetype,
        required this.addvalue,
        required this.addvalueFix,
        required this.fixedValPos,
        required this.maxvalue,
        required this.minvalue,
        required this.minimumFee,
        required this.outputtextWpml,
    });

    String enable;
    String outputtext;
    String taxclass;
    String addvaluetype;
    int addvalue;
    int addvalueFix;
    String fixedValPos;
    int maxvalue;
    int minvalue;
    int minimumFee;
    List<dynamic> outputtextWpml;

    factory Gateway.fromJson(Map<String, dynamic> json) => Gateway(
        enable: json["enable"],
        outputtext: json["outputtext"],
        taxclass: json["taxclass"],
        addvaluetype: json["addvaluetype"],
        addvalue: json["addvalue"],
        addvalueFix: json["addvalue_fix"],
        fixedValPos: json["fixed_val_pos"],
        maxvalue: json["maxvalue"],
        minvalue: json["minvalue"],
        minimumFee: json["minimum_fee"],
        outputtextWpml: List<dynamic>.from(json["outputtext_wpml"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "enable": enable,
        "outputtext": outputtext,
        "taxclass": taxclass,
        "addvaluetype": addvaluetype,
        "addvalue": addvalue,
        "addvalue_fix": addvalueFix,
        "fixed_val_pos": fixedValPos,
        "maxvalue": maxvalue,
        "minvalue": minvalue,
        "minimum_fee": minimumFee,
        "outputtext_wpml": List<dynamic>.from(outputtextWpml.map((x) => x)),
    };
}
