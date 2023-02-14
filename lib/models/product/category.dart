

import 'dart:convert';

ItemModelProductCategory itemModelProductCategoryFromJson(String str) => ItemModelProductCategory.fromJson(json.decode(str));

String itemModelProductCategoryToJson(ItemModelProductCategory data) => json.encode(data.toJson());

class ItemModelProductCategory {
  ItemModelProductCategory({
    required this.data,
    required this.meta,
  });

  List<Category> data;
  Meta meta;

  factory ItemModelProductCategory.fromJson(Map<String, dynamic> json) => ItemModelProductCategory(
    data: List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "meta": meta.toJson(),
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.subcategories,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<dynamic> subcategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    subcategories: List<dynamic>.from(json["subcategories"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "subcategories": List<dynamic>.from(subcategories.map((x) => x)),
  };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
  );

  Map<String, dynamic> toJson() => {
  };
}
