// To parse this JSON data, do
//
//     final itemModelPrepaidPLN = itemModelPrepaidPLNFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ItemModelPrepaidPLN itemModelPrepaidPLNFromJson(String str) => ItemModelPrepaidPLN.fromJson(json.decode(str));

String itemModelPrepaidPLNToJson(ItemModelPrepaidPLN data) => json.encode(data.toJson());

class ItemModelPrepaidPLN {
  ItemModelPrepaidPLN({
    required this.data,
  });

  Data data;

  factory ItemModelPrepaidPLN.fromJson(Map<String, dynamic> json) => ItemModelPrepaidPLN(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.status,
    required this.customerId,
    required this.meterNo,
    required this.subscriberId,
    required this.name,
    required this.segmentPower,
    required this.message,
    required this.rc,
  });

  String status;
  String customerId;
  String meterNo;
  String subscriberId;
  String name;
  String segmentPower;
  String message;
  String rc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"].toString(),
    customerId: json["customer_id"] ?? '',
    meterNo: json["meter_no"] ?? '',
    subscriberId: json["subscriber_id"] ?? '',
    name: json["name"] ?? '',
    segmentPower: json["segment_power"] ?? '',
    message: json["message"] ?? '',
    rc: json["rc"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "customer_id": customerId,
    "meter_no": meterNo,
    "subscriber_id": subscriberId,
    "name": name,
    "segment_power": segmentPower,
    "message": message,
    "rc": rc,
  };
}