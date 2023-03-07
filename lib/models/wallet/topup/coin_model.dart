// To parse this JSON data, do
//
//     final itemModelCoinPriceInq = itemModelCoinPriceInqFromJson(jsonString);

import 'dart:convert';

ItemModelCoinPriceInq itemModelCoinPriceInqFromJson(String str) =>
    ItemModelCoinPriceInq.fromJson(json.decode(str));

String itemModelCoinPriceInqToJson(ItemModelCoinPriceInq data) =>
    json.encode(data.toJson());

class ItemModelCoinPriceInq {
  ItemModelCoinPriceInq({
    required this.data,
  });

  final Data data;

  factory ItemModelCoinPriceInq.fromJson(Map<String, dynamic> json) =>
      ItemModelCoinPriceInq(
        data: Data.fromJson(json["data"]),
      );

  factory ItemModelCoinPriceInq.dummy() => ItemModelCoinPriceInq(
        data: Data(
          coinPrice: 0,
          coinGasFee: 0.0,
          tokenGasFee: 0.0,
        ),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.coinPrice,
    required this.coinGasFee,
    required this.tokenGasFee,
  });

  final int coinPrice;
  final double coinGasFee;
  final double tokenGasFee;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        coinPrice: json["coinPrice"],
        coinGasFee: json["coinGasFee"].toDouble(),
        tokenGasFee: json["tokenGasFee"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "coinPrice": coinPrice,
        "coinGasFee": coinGasFee,
        "tokenGasFee": tokenGasFee,
      };
}
