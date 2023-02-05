// To parse this JSON data, do
//
//     final itemModelAboutUs = itemModelAboutUsFromJson(jsonString);

import 'dart:convert';

ItemModelAboutUs itemModelAboutUsFromJson(String str) => ItemModelAboutUs.fromJson(json.decode(str));

String itemModelAboutUsToJson(ItemModelAboutUs data) => json.encode(data.toJson());

class ItemModelAboutUs {
  ItemModelAboutUs({
    required this.data,
  });

  Data data;

  factory ItemModelAboutUs.fromJson(Map<String, dynamic> json) => ItemModelAboutUs(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.value,
  });

  String value;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
  };
}
