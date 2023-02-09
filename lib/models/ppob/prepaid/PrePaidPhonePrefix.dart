// To parse this JSON data, do
//
//     final phonePrefix = phonePrefixFromJson(jsonString);

import 'dart:convert';

ItemModelPhonePrefix phonePrefixFromJson(String str) =>
    ItemModelPhonePrefix.fromJson(json.decode(str));

String phonePrefixToJson(ItemModelPhonePrefix data) =>
    json.encode(data.toJson());

class ItemModelPhonePrefix {
  ItemModelPhonePrefix({
    required this.data,
  });

  final Data data;

  factory ItemModelPhonePrefix.fromJson(Map<String, dynamic> json) =>
      ItemModelPhonePrefix(
        data: Data.fromJson(json["data"]),
      );

  factory ItemModelPhonePrefix.dummy() {
    return ItemModelPhonePrefix(
        data: Data(
      dataOperator: 'telkomsel',
      message: 'exampele msg',
      rc: '',
    ));
  }

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.dataOperator,
    required this.message,
    required this.rc,
  });

  final String dataOperator;
  final String message;
  final String rc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dataOperator: json["operator"] ?? '',
        message: json["message"] ?? '',
        rc: json["rc"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "operator": dataOperator,
        "message": message,
        "rc": rc,
      };
}
