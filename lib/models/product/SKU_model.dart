

import 'dart:convert';

List<SkuModel> skuModelFromJson(String str) =>
    List<SkuModel>.from(json.decode(str).map((x) => SkuModel.fromJson(x)));

String skuModelToJson(List<SkuModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SkuModel {
  SkuModel({
    required this.price,
    required this.weight,
    required this.stock,
  });

  int price;
  int weight;
  int stock;

  factory SkuModel.fromJson(Map<String, dynamic> json) => SkuModel(
        price: json["price"],
        weight: json["weight"],
        stock: json["stock"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "weight": weight,
        "stock": stock,
      };
}
