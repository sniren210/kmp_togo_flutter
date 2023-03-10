// To parse this JSON data, do
//
//     final itemModelProductNoVarian = itemModelProductNoVarianFromJson(jsonString);

import 'dart:convert';

ItemModelProductWtVarian itemModelProductNoVarianFromJson(String str) => ItemModelProductWtVarian.fromJson(json.decode(str));

String itemModelProductNoVarianToJson(ItemModelProductWtVarian data) => json.encode(data.toJson());

class ItemModelProductWtVarian {
  ItemModelProductWtVarian({
    required this.data,
  });

  Data data;

  factory ItemModelProductWtVarian.fromJson(Map<String, dynamic> json) => ItemModelProductWtVarian(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.imagePath,
    required this.isAvailable,
    required this.rating,
    required this.ratingCount,
    required this.ratingTotal,
    required this.soldCount,
    required this.id,
    required this.storeId,
    required this.name,
    required this.image,
    required this.description,
    required this.productSelling,
    required this.updatedAt,
    required this.createdAt,
  });

  String imagePath;
  bool isAvailable;
  int rating;
  int ratingCount;
  int ratingTotal;
  int soldCount;
  int id;
  int storeId;
  String name;
  String image;
  String description;
  String productSelling;
  DateTime updatedAt;
  DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    imagePath: json["imagePath"],
    isAvailable: json["isAvailable"],
    rating: json["rating"],
    ratingCount: json["ratingCount"],
    ratingTotal: json["ratingTotal"],
    soldCount: json["soldCount"],
    id: json["id"],
    storeId: json["storeId"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    productSelling: json["productSelling"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "imagePath": imagePath,
    "isAvailable": isAvailable,
    "rating": rating,
    "ratingCount": ratingCount,
    "ratingTotal": ratingTotal,
    "soldCount": soldCount,
    "id": id,
    "storeId": storeId,
    "name": name,
    "image": image,
    "description": description,
    "productSelling": productSelling,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
  };
}
