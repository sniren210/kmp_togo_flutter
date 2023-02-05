// To parse this JSON data, do
//
//     final itemModelPrivacyPolicy = itemModelPrivacyPolicyFromJson(jsonString);

import 'dart:convert';

ItemModelPrivacyPolicy itemModelPrivacyPolicyFromJson(String str) => ItemModelPrivacyPolicy.fromJson(json.decode(str));

String itemModelPrivacyPolicyToJson(ItemModelPrivacyPolicy data) => json.encode(data.toJson());

class ItemModelPrivacyPolicy {
  ItemModelPrivacyPolicy({
    required this.data,
  });

  Data data;

  factory ItemModelPrivacyPolicy.fromJson(Map<String, dynamic> json) => ItemModelPrivacyPolicy(
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
