// To parse this JSON data, do
//
//     final itemModelAccountInfo = itemModelAccountInfoFromJson(jsonString);

import 'dart:convert';

ItemModelAccountInfo itemModelAccountInfoFromJson(String str) =>
    ItemModelAccountInfo.fromJson(json.decode(str));

String itemModelAccountInfoToJson(ItemModelAccountInfo data) =>
    json.encode(data.toJson());

class ItemModelAccountInfo {
  ItemModelAccountInfo({
    required this.data,
  });

  Data data;

  factory ItemModelAccountInfo.fromJson(Map<String, dynamic> json) =>
      ItemModelAccountInfo(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.imagePath,
    required this.id,
    required this.nik,
    required this.name,
    required this.image,
    required this.email,
    required this.phoneNumber,
    required this.birthdate,
    required this.cityId,
    required this.provinceId,
    required this.subdistrictId,
    required this.address,
    required this.membertype,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.tokenWallet,
    required this.coinWallet,
  });

  String imagePath;
  int id;
  String nik;
  String name;
  String image;
  String email;
  String phoneNumber;
  dynamic birthdate;
  dynamic cityId;
  dynamic provinceId;
  dynamic subdistrictId;
  dynamic address;
  String membertype;
  dynamic role;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  NWallet tokenWallet;
  NWallet2 coinWallet;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        imagePath: json["imagePath"] ?? '',
        id: json["id"] ?? 0,
        nik: json["nik"] ?? '',
        name: json["name"] ?? '',
        image: json["image"] ?? '',
        email: json["email"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        birthdate: json["birthdate"] ?? '',
        cityId: json["cityId"],
        provinceId: json["provinceId"],
        subdistrictId: json["subdistrictId"],
        address: json["address"] ?? '',
        membertype: json["membertype"],
        role: json["role"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        tokenWallet: NWallet.fromJson(json["tokenWallet"]),
        coinWallet: NWallet2.fromJson(json["coinWallet"]),
      );

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
        "id": id,
        "nik": nik,
        "name": name,
        "image": image,
        "email": email,
        "phoneNumber": phoneNumber,
        "birthdate":
            "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "cityId": cityId,
        "provinceId": provinceId,
        "subdistrictId": subdistrictId,
        "address": address,
        "membertype": membertype,
        "role": role,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "tokenWallet": tokenWallet.toJson(),
        "coinWallet": coinWallet.toJson(),
      };
}

class NWallet {
  NWallet({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.token,
  });

  int id;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  double token;

  factory NWallet.fromJson(Map<String, dynamic> json) => NWallet(
        id: json["id"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        token: json["token"] == null ? 0 : json["token"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "token": token,
      };
}

class NWallet2 {
  NWallet2({
    required this.id,
    required this.userId,
    required this.coin,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  int userId;
  double coin;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory NWallet2.fromJson(Map<String, dynamic> json) => NWallet2(
        id: json["id"],
        userId: json["userId"],
        coin: json["coin"] == null ? 0 : json["coin"].toDouble(),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "coin": coin,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
