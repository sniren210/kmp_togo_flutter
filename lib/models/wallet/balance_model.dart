// To parse this JSON data, do
//
//     final balanceModel = balanceModelFromJson(jsonString);

import 'dart:convert';

BalanceModel balanceModelFromJson(String str) =>
    BalanceModel.fromJson(json.decode(str));

String balanceModelToJson(BalanceModel data) => json.encode(data.toJson());

class BalanceModel {
  BalanceModel({
    required this.status,
    required this.success,
    required this.data,
  });

  int status;
  bool success;
  Data data;

  factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(
        status: json["status"],
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.coin,
    required this.point,
  });

  String coin;
  String point;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        coin: json["coin"],
        point: json["point"],
      );

  Map<String, dynamic> toJson() => {
        "coin": coin,
        "point": point,
      };
}
