// To parse this JSON data, do
//
//     final itemModelProduct = itemModelProductFromJson(jsonString);

import 'dart:convert';

ItemModelProduct itemModelProductFromJson(String str) =>
    ItemModelProduct.fromJson(json.decode(str));

String itemModelProductToJson(ItemModelProduct data) =>
    json.encode(data.toJson());

class ItemModelProduct {
  ItemModelProduct({
    required this.data,
    required this.meta,
  });

  List<Datum> data;
  Meta? meta;

  factory ItemModelProduct.fromJson(Map<String, dynamic> json) =>
      ItemModelProduct(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: json.containsKey('meta') ? Meta.fromJson(json["meta"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta == null ? null : meta!.toJson(),
      };
}

class Datum {
  Datum({
    required this.imagePath,
    required this.id,
    required this.storeId,
    required this.categoryId,
    required this.subCategoryId,
    required this.name,
    required this.image,
    required this.description,
    required this.productSelling,
    required this.rating,
    required this.ratingCount,
    required this.ratingTotal,
    required this.soldCount,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.store,
    required this.category,
    required this.subCategory,
    required this.sku,
  });

  String imagePath;
  int id;
  int storeId;
  int categoryId;
  dynamic subCategoryId;
  String name;
  String image;
  String description;
  String productSelling;
  int rating;
  int ratingCount;
  int ratingTotal;
  int soldCount;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Store store;
  Category? category;
  dynamic subCategory;
  List<Sku> sku;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        imagePath: json["imagePath"],
        id: json["id"],
        storeId: json["storeId"],
        categoryId: json["categoryId"] ?? 0,
        subCategoryId: json["subCategoryId"],
        name: json["name"] ?? '',
        image: json["image"] ?? '',
        description: json["description"] ?? '',
        productSelling: json["productSelling"] ?? '',
        rating: json["rating"] ?? 0,
        ratingCount: json["ratingCount"] ?? 0,
        ratingTotal: json["ratingTotal"] ?? 0,
        soldCount: json["soldCount"] ?? 0,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        store: Store.fromJson(json["store"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        subCategory: json["subCategory"],
        sku: List<Sku>.from(json["sku"].map((x) => Sku.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
        "id": id,
        "storeId": storeId,
        "categoryId": categoryId,
        "subCategoryId": subCategoryId,
        "name": name,
        "image": image,
        "description": description,
        "productSelling": productSelling,
        "rating": rating,
        "ratingCount": ratingCount,
        "ratingTotal": ratingTotal,
        "soldCount": soldCount,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "store": store.toJson(),
        "category": category == null ? null : category!.toJson(),
        "subCategory": subCategory,
        "sku": List<dynamic>.from(sku.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class Sku {
  Sku({
    required this.id,
    required this.productId,
    required this.price,
    required this.stock,
    required this.weight,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.skuvariants,
  });

  int id;
  int productId;
  int price;
  int? stock;
  int? weight;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  final List<Skuvariant> skuvariants;

  factory Sku.fromJson(Map<String, dynamic> json) => Sku(
        id: json["id"],
        productId: json["productId"],
        price: json["price"],
        stock: json["stock"] ?? 0,
        weight: json["weight"] ?? 0,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
    skuvariants: List<Skuvariant>.from(json["skuvariants"].map((x) => Skuvariant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "price": price,
        "stock": stock ?? null,
        "weight": weight,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "skuvariants": List<dynamic>.from(skuvariants.map((x) => x.toJson())),
      };
}

class Skuvariant {
  Skuvariant({
    required this.variantOptionId,
    required this.variantOption,
  });

  final int variantOptionId;
  final VariantOption variantOption;

  factory Skuvariant.fromJson(Map<String, dynamic> json) => Skuvariant(
    variantOptionId: json["variantOptionId"],
    variantOption: VariantOption.fromJson(json["variantOption"]),
  );

  Map<String, dynamic> toJson() => {
    "variantOptionId": variantOptionId,
    "variantOption": variantOption.toJson(),
  };
}

class VariantOption {
  VariantOption({
    required this.name,
    required this.variant,
  });

  final String name;
  final VariantProductModel variant;

  factory VariantOption.fromJson(Map<String, dynamic> json) => VariantOption(
    name: json["name"],
    variant: VariantProductModel.fromJson(json["variant"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "variant": variant.toJson(),
  };
}

class VariantProductModel {
  VariantProductModel({
    required this.name,
  });

  final String name;

  factory VariantProductModel.fromJson(Map<String, dynamic> json) => VariantProductModel(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Store {
  Store({
    required this.imagePath,
    required this.coordinates,
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.provinceId,
    required this.cityId,
    required this.subdistrictId,
    required this.postalCode,
    required this.latitude,
    required this.longitude,
    required this.geometry,
    required this.ownerId,
    required this.rating,
    required this.ratingCount,
    required this.ratingTotal,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  String imagePath;
  Coordinates coordinates;
  int id;
  String name;
  String image;
  String address;
  dynamic provinceId;
  dynamic cityId;
  dynamic subdistrictId;
  String postalCode;
  int latitude;
  int longitude;
  Geometry geometry;
  int ownerId;
  int rating;
  int ratingCount;
  int ratingTotal;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        imagePath: json["imagePath"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        id: json["id"],
        name: json["name"],
        image: json["image"],
        address: json["address"],
        provinceId: json["provinceId"],
        cityId: json["cityId"],
        subdistrictId: json["subdistrictId"],
        postalCode: json["postalCode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        geometry: Geometry.fromJson(json["geometry"]),
        ownerId: json["ownerId"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        ratingTotal: json["ratingTotal"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
        "coordinates": coordinates.toJson(),
        "id": id,
        "name": name,
        "image": image,
        "address": address,
        "provinceId": provinceId,
        "cityId": cityId,
        "subdistrictId": subdistrictId,
        "postalCode": postalCode,
        "latitude": latitude,
        "longitude": longitude,
        "geometry": geometry.toJson(),
        "ownerId": ownerId,
        "rating": rating,
        "ratingCount": ratingCount,
        "ratingTotal": ratingTotal,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  int latitude;
  int longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<int> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: List<int>.from(json["coordinates"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class Meta {
  Meta({
    required this.storeId,
  });

  String? storeId;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        storeId: json.containsKey('storeId') ? json["storeId"] ?? '' : null,
      );

  Map<String, dynamic> toJson() => {
        "storeId": storeId ?? '',
      };
}

