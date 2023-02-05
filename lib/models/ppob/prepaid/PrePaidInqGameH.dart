// To parse this JSON data, do
//
//     final itemModelPrepaidGameH = itemModelPrepaidGameHFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ItemModelPrepaidGameH itemModelPrepaidGameHFromJson(String str) => ItemModelPrepaidGameH.fromJson(json.decode(str));

String itemModelPrepaidGameHToJson(ItemModelPrepaidGameH data) => json.encode(data.toJson());

class ItemModelPrepaidGameH {
  ItemModelPrepaidGameH({
    required this.data,
  });

  Data data;

  factory ItemModelPrepaidGameH.fromJson(Map<String, dynamic> json) => ItemModelPrepaidGameH(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.formatGameId,
    required this.status,
    required this.message,
    required this.rc,
  });

  String formatGameId;
  int status;
  String message;
  String rc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    formatGameId: json["formatGameId"] ?? '',
    status: json["status"] ?? 0,
    message: json["message"] ?? '',
    rc: json["rc"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "formatGameId": formatGameId,
    "status": status,
    "message": message,
    "rc": rc,
  };
}
