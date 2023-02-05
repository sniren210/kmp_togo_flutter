// To parse this JSON data, do
//
//     final itemModelProductSubCategory = itemModelProductSubCategoryFromJson(jsonString);

import 'dart:convert';

ItemModelProductSubCategory itemModelProductSubCategoryFromJson(String str) => ItemModelProductSubCategory.fromJson(json.decode(str));

String itemModelProductSubCategoryToJson(ItemModelProductSubCategory data) => json.encode(data.toJson());

class ItemModelProductSubCategory {
  ItemModelProductSubCategory({
    required this.data,
    required this.meta,
  });

  List<SubCategory> data;
  Meta meta;

  factory ItemModelProductSubCategory.fromJson(Map<String, dynamic> json) => ItemModelProductSubCategory(
    data: List<SubCategory>.from(json["data"].map((x) => SubCategory.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  int categoryId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    categoryId: json["categoryId"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryId": categoryId,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
  );

  Map<String, dynamic> toJson() => {
  };
}
