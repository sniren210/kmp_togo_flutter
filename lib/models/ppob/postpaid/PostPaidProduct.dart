// To parse this JSON data, do
//
//     final itemModelPostPaidProduct = itemModelPostPaidProductFromJson(jsonString);

import 'dart:convert';

ItemModelPostPaidProduct itemModelPostPaidProductFromJson(String str) =>
    ItemModelPostPaidProduct.fromJson(json.decode(str));

String itemModelPostPaidProductToJson(ItemModelPostPaidProduct data) =>
    json.encode(data.toJson());

class ItemModelPostPaidProduct {
  ItemModelPostPaidProduct({
    required this.data,
  });

  List<PostPaidProduct> data;

  factory ItemModelPostPaidProduct.fromJson(Map<String, dynamic> json) =>
      ItemModelPostPaidProduct(
        data: List<PostPaidProduct>.from(
            json["data"].map((x) => PostPaidProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PostPaidProduct {
  PostPaidProduct({
    required this.code,
    required this.name,
    required this.status,
    required this.fee,
    required this.komisi,
    required this.type,
  });

  String code;
  String name;
  int status;
  int fee;
  int komisi;
  String type;

  factory PostPaidProduct.fromJson(Map<String, dynamic> json) =>
      PostPaidProduct(
        code: json["code"] ?? '',
        name: json["name"] ?? '',
        status: json["status"] ?? 0,
        fee: json["fee"] ?? 0,
        komisi: json["komisi"] ?? 0,
        type: json["type"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "status": status,
        "fee": fee,
        "komisi": komisi,
        "type": type,
      };
}
