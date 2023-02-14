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
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String guardName;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guard_name": guardName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
