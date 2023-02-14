

import 'dart:convert';

ItemModelShipping itemModelShippingFromJson(String str) =>
    ItemModelShipping.fromJson(json.decode(str));

String itemModelShippingToJson(ItemModelShipping data) =>
    json.encode(data.toJson());

class ItemModelShipping {
  ItemModelShipping({
    required this.data,
  });

  List<Shipping> data;

  factory ItemModelShipping.fromJson(Map<String, dynamic> json) =>
      ItemModelShipping(
        data:
            List<Shipping>.from(json["data"].map((x) => Shipping.fromJson(x))),
      );

  factory ItemModelShipping.dummy() => ItemModelShipping(
        data: [
          Shipping(code: 'code', name: 'name'),
        ],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Shipping {
  Shipping({
    required this.code,
    required this.name,
  });

  String code;
  String name;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}
