// To parse this JSON data, do
//
//     final privacyPolicyModel = privacyPolicyModelFromJson(jsonString);

import 'dart:convert';

PrivacyPolicyModel privacyPolicyModelFromJson(String str) =>
    PrivacyPolicyModel.fromJson(json.decode(str));

String privacyPolicyModelToJson(PrivacyPolicyModel data) =>
    json.encode(data.toJson());

class PrivacyPolicyModel {
  PrivacyPolicyModel({
    required this.status,
    required this.success,
    required this.data,
  });

  int status;
  bool success;
  Data data;

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =>
      PrivacyPolicyModel(
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
    required this.description,
    required this.createdAt,
    this.updatedAt,
  });

  String description;
  DateTime createdAt;
  dynamic updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}
