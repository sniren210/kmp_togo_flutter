

import 'dart:convert';

ItemModelPrePaidProduct checkOutBodyFromJson(String str) =>
    ItemModelPrePaidProduct.fromJson(json.decode(str));

String checkOutBodyToJson(ItemModelPrePaidProduct data) =>
    json.encode(data.toJson());

class ItemModelPrePaidProduct {
  ItemModelPrePaidProduct({
    required this.data,
  });

  List<PrepaidProduct> data;

  factory ItemModelPrePaidProduct.fromJson(Map<String, dynamic> json) =>
      ItemModelPrePaidProduct(
        data: List<PrepaidProduct>.from(
            json["data"].map((x) => PrepaidProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PrepaidProduct {
  PrepaidProduct({
    required this.productCode,
    required this.productDescription,
    required this.productNominal,
    required this.productDetails,
    required this.productPrice,
    required this.productType,
    required this.activePeriod,
    required this.status,
    required this.iconUrl,
    required this.maxprice,
  });

  String productCode;
  String productDescription;
  String productNominal;
  String? productDetails;
  int productPrice;
  String productType;
  String activePeriod;
  String status;
  String iconUrl;
  int maxprice;

  factory PrepaidProduct.fromJson(Map<String, dynamic> json) => PrepaidProduct(
        productCode: json["product_code"] ?? '',
        productDescription: json["product_description"] ?? '',
        productNominal: json["product_nominal"] ?? '',
        productDetails: json["product_details"] ?? '',
        productPrice: json["product_price"] ?? 0,
        productType: json["product_type"]!,
        activePeriod: json["active_period"] ?? '',
        status: json["status"] ?? '',
        iconUrl: json["icon_url"] ?? '',
        maxprice: json["maxprice"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "product_code": productCode,
        "product_description": productDescription,
        "product_nominal": productNominal,
        "product_details": productDetails,
        "product_price": productPrice,
        "product_type": productType,
        "active_period": activePeriod,
        "status": status,
        "icon_url": iconUrl,
        "maxprice": maxprice,
      };
}

enum ProductType {
  VOUCHER,
  MALAYSIA,
  GAME,
  DATA,
  INDONESIA,
  CHINA,
  ETOLL,
  PULSA,
  PLN,
  KOREA,
  SINGAPORE,
  TAIWAN,
  PHILIPINES,
  THAILAND,
  VIETNAM
}

final productTypeValues = EnumValues({
  "china": ProductType.CHINA,
  "data": ProductType.DATA,
  "etoll": ProductType.ETOLL,
  "game": ProductType.GAME,
  "indonesia": ProductType.INDONESIA,
  "korea": ProductType.KOREA,
  "malaysia": ProductType.MALAYSIA,
  "philipines": ProductType.PHILIPINES,
  "pln": ProductType.PLN,
  "pulsa": ProductType.PULSA,
  "singapore": ProductType.SINGAPORE,
  "taiwan": ProductType.TAIWAN,
  "thailand": ProductType.THAILAND,
  "vietnam": ProductType.VIETNAM,
  "voucher": ProductType.VOUCHER
});

enum Status { ACTIVE, NON_ACTIVE }

final statusValues =
    EnumValues({"active": Status.ACTIVE, "non active": Status.NON_ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap.isEmpty) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
