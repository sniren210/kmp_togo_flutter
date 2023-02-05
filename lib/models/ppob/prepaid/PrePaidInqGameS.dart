// To parse this JSON data, do
//
//     final itemModelPrepaidGameH = itemModelPrepaidGameHFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ItemModelPrepaidGameS itemModelPrepaidGameHFromJson(String str) => ItemModelPrepaidGameS.fromJson(json.decode(str));

String itemModelPrepaidGameHToJson(ItemModelPrepaidGameS data) => json.encode(data.toJson());

class ItemModelPrepaidGameS {
  ItemModelPrepaidGameS({
    required this.data,
  });

  Data data;

  factory ItemModelPrepaidGameS.fromJson(Map<String, dynamic> json) => ItemModelPrepaidGameS(
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
