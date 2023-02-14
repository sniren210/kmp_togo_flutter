

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
    required this.price,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  String id;
  String name;
  int price;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
