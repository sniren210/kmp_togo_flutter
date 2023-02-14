// To parse this JSON data, do
//
//     final memberType = memberTypeFromJson(jsonString);

import 'dart:convert';

ItemModelMemberType memberTypeFromJson(String str) =>
    ItemModelMemberType.fromJson(json.decode(str));

String memberTypeToJson(ItemModelMemberType data) => json.encode(data.toJson());

class ItemModelMemberType {
  ItemModelMemberType({
    required this.data,
  });

  List<Datum> data;

  factory ItemModelMemberType.fromJson(Map<String, dynamic> json) =>
      ItemModelMemberType(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.monthlyPrincipalFee,
    required this.monthlyMandatoryFee,
    required this.adminFee,
    required this.benefit,
    required this.description,
    required this.status,
  });

  int id;
  String name;
  int monthlyPrincipalFee;
  int monthlyMandatoryFee;
  int adminFee;
  String benefit;
  String description;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        monthlyPrincipalFee: json["monthly_principal_fee"],
        monthlyMandatoryFee: json["monthly_mandatory_fee"],
        adminFee: json["admin_fee"],
        benefit: json["description"],
        description: json["benefit"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
