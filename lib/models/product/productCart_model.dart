// To parse this JSON data, do
//
//     final itemProductCart = itemProductCartFromJson(jsonString);

import 'dart:convert';

ItemProductCart? itemProductCartFromJson(String str) => ItemProductCart.fromJson(json.decode(str));

String itemProductCartToJson(ItemProductCart? data) => json.encode(data!.toJson());

class ItemProductCart {
  ItemProductCart({
    required this.sku,
    required this.storeId,
    required this.shipping,
  });

  final List<Map<String, int?>?>? sku;
  final int? storeId;
  final Shipping? shipping;

  factory ItemProductCart.fromJson(Map<String, dynamic> json) => ItemProductCart(
    sku: json["sku"] == null ? [] : List<Map<String, int?>?>.from(json["sku"]!.map((x) => Map.from(x!).map((k, v) => MapEntry<String, int?>(k, v)))),
    storeId: json["storeId"],
    shipping: Shipping.fromJson(json["shipping"]),
  );

  Map<String, dynamic> toJson() => {
    "sku": sku == null ? [] : List<dynamic>.from(sku!.map((x) => Map.from(x!).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    "storeId": storeId,
    "shipping": shipping!.toJson(),
  };
}

class Shipping {
  Shipping({
    required this.addressBookId,
    required this.code,
  });

  final int? addressBookId;
  final String? code;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
    addressBookId: json["addressBookId"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "addressBookId": addressBookId,
    "code": code,
  };
}
