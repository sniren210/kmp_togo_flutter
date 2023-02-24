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
    required this.policy,
    required this.member,
  });

  List<dynamic> policy;
  List<dynamic> member;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        policy: List<dynamic>.from(json["policy"].map((x) => x)),
        member: List<dynamic>.from(json["member"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "policy": List<dynamic>.from(policy.map((x) => x)),
        "member": List<dynamic>.from(member.map((x) => x)),
      };
}
