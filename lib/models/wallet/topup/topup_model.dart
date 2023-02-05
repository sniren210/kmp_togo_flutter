import 'dart:convert';

ItemModelTopup itemModelTopupFromJson(String str) =>
    ItemModelTopup.fromJson(json.decode(str));

String itemModelTopupToJson(ItemModelTopup data) => json.encode(data.toJson());

class ItemModelTopup {
  ItemModelTopup({
    required this.data,
  });

  final DataTopUpModel data;

  factory ItemModelTopup.fromJson(Map<String, dynamic> json) => ItemModelTopup(
        data: DataTopUpModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ItemModelBuyCoin {
  ItemModelBuyCoin({
    required this.data,
  });

  final DataBuyCoinModel data;

  factory ItemModelBuyCoin.fromJson(Map<String, dynamic> json) => ItemModelBuyCoin(
        data: DataBuyCoinModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ItemModelSellCoin {
  ItemModelSellCoin({
    required this.data,
  });

  final DataBuyCoinModel data;

  factory ItemModelSellCoin.fromJson(Map<String, dynamic> json) => ItemModelSellCoin(
        data: DataBuyCoinModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataTopUpModel {
  DataTopUpModel({
    required this.vanumber,
    required this.name,
  });

  final String vanumber;
  final String name;

  factory DataTopUpModel.fromJson(Map<String, dynamic> json) => DataTopUpModel(
        vanumber: json["vanumber"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "vanumber": vanumber,
        "name": name,
      };
}

class DataBuyCoinModel {
  DataBuyCoinModel({
    required this.token,
    required this.coin,
  });

  final int token;
  final int coin;

  factory DataBuyCoinModel.fromJson(Map<String, dynamic> json) =>
      DataBuyCoinModel(
        token: json["token"],
        coin: json["coin"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "coin": coin,
      };
}

