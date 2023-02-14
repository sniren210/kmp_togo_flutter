

import 'dart:convert';

List<ItemModelProductSKU> itemModelProductSKUFromJson(String str) =>
    List<ItemModelProductSKU>.from(
        json.decode(str).map((x) => ItemModelProductSKU.fromJson(x)));

String itemModelProductSKUToJson(List<ItemModelProductSKU> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemModelProductSKU {
  ItemModelProductSKU({
    required this.price,
    required this.weight,
    required this.stock,
    required this.variant,
  });

  int price;
  int weight;
  int stock;
  List<VariantSKUModel> variant;

  factory ItemModelProductSKU.fromJson(Map<String, dynamic> json) =>
      ItemModelProductSKU(
        price: json["price"],
        weight: json["weight"],
        stock: json["stock"],
        variant:
            List<VariantSKUModel>.from(json["variant"].map((x) => VariantSKUModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "weight": weight,
        "stock": stock,
        "variant": List<dynamic>.from(variant.map((x) => x.toJson())),
      };
}

class VariantSKUModel {
  VariantSKUModel({
    required this.name,
    required this.variantOption,
  });

  String name;
  VariantOptionSKUModel variantOption;

  factory VariantSKUModel.fromJson(Map<String, dynamic> json) => VariantSKUModel(
        name: json["name"],
        variantOption: VariantOptionSKUModel.fromJson(json["variantOption"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "variantOption": variantOption.toJson(),
      };
}

class VariantOptionSKUModel {
  VariantOptionSKUModel({
    required this.name,
  });

  String name;

  factory VariantOptionSKUModel.fromJson(Map<String, dynamic> json) => VariantOptionSKUModel(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
