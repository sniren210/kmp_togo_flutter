// To parse this JSON data, do
//
//     final itemModelPostPaidCheckOut = itemModelPostPaidCheckOutFromJson(jsonString);

import 'dart:convert';

ItemModelPPOBCheckOut itemModelPostPaidCheckOutFromJson(String str) =>
    ItemModelPPOBCheckOut.fromJson(json.decode(str));

String itemModelPostPaidCheckOutToJson(ItemModelPPOBCheckOut data) =>
    json.encode(data.toJson());

class ItemModelPPOBCheckOut {
  ItemModelPPOBCheckOut({
    required this.data,
  });

  Data data;

  factory ItemModelPPOBCheckOut.fromJson(Map<String, dynamic> json) =>
      ItemModelPPOBCheckOut(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.ppobMobileOperatorId,
    required this.id,
    required this.userId,
    required this.productCode,
    required this.ppobTypeId,
    required this.refId,
    required this.total,
    required this.tokenTransactionId,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
  });

  dynamic ppobMobileOperatorId;
  String id;
  int userId;
  String productCode;
  String ppobTypeId;
  String refId;
  double total;
  int tokenTransactionId;
  String status;
  DateTime updatedAt;
  DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ppobMobileOperatorId: json["ppobMobileOperatorId"],
        id: json["id"],
        userId: json["userId"],
        productCode: json["productCode"],
        ppobTypeId: json["ppobTypeId"],
        refId: json["refId"],
        total: json["total"],
        tokenTransactionId: json["tokenTransactionId"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "ppobMobileOperatorId": ppobMobileOperatorId,
        "id": id,
        "userId": userId,
        "productCode": productCode,
        "ppobTypeId": ppobTypeId,
        "refId": refId,
        "total": total,
        "tokenTransactionId": tokenTransactionId,
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}



class CheckOutBody {
  // CheckOutBody({
  //   this.code,
  //   this.tipe,
  //   this.customerId,
  // });
  //
  // String? code;
  // String? tipe;
  // String? customerId;
  //
  // factory CheckOutBody.fromJson(Map<String, dynamic> json) => CheckOutBody(
  //   code: json["code"],
  //   tipe: json["tipe"],
  //   customerId: json["customer_id"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "code": code,
  //   "tipe": tipe,
  //   "customer_id": customerId,
  // };
  //
  // String? get codeV => code;
  // String? get tipeV => tipe;
  // String? get customerIdV => customerId;

  CheckOutBody({
    this.code,
    this.tipe,
    this.customerId,
  });

  String? code;
  String? tipe;
  String? customerId;

  factory CheckOutBody.fromJson(Map<String, dynamic> json) => CheckOutBody(
    code: json["code"],
    tipe: json["tipe"],
    customerId: json["customer_id"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "tipe": tipe,
    "customer_id": customerId,
  };
}