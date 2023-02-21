// To parse this JSON data, do
//
//     final paymentCreateModel = paymentCreateModelFromJson(jsonString);

import 'dart:convert';

PaymentCreateModel paymentCreateModelFromJson(String str) =>
    PaymentCreateModel.fromJson(json.decode(str));

String paymentCreateModelToJson(PaymentCreateModel data) =>
    json.encode(data.toJson());

class PaymentCreateModel {
  PaymentCreateModel({
    required this.status,
    required this.success,
    required this.data,
  });

  int status;
  bool success;
  Data data;

  factory PaymentCreateModel.fromJson(Map<String, dynamic> json) =>
      PaymentCreateModel(
        status: json["status"],
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.uuid,
    required this.userId,
    required this.name,
    required this.accountNumber,
    required this.procode,
    required this.merchatTrxId,
    required this.transactionId,
    this.additionalData,
    required this.merchatId,
    required this.amount,
    required this.flagAmount,
    required this.status,
    required this.createAt,
    required this.expiresAt,
    required this.id,
  });

  String uuid;
  int userId;
  String name;
  String accountNumber;
  String procode;
  String merchatTrxId;
  String transactionId;
  dynamic additionalData;
  String merchatId;
  int amount;
  String flagAmount;
  String status;
  DateTime createAt;
  DateTime expiresAt;
  String id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        uuid: json["uuid"],
        userId: json["user_id"],
        name: json["name"],
        accountNumber: json["account_number"],
        procode: json["procode"],
        merchatTrxId: json["merchat_trx_id"],
        transactionId: json["transaction_id"],
        additionalData: json["additional_data"],
        merchatId: json["merchat_id"],
        amount: json["amount"],
        flagAmount: json["flag_amount"],
        status: json["status"],
        createAt: DateTime.parse(json["create_at"]),
        expiresAt: DateTime.parse(json["expires_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "user_id": userId,
        "name": name,
        "account_number": accountNumber,
        "procode": procode,
        "merchat_trx_id": merchatTrxId,
        "transaction_id": transactionId,
        "additional_data": additionalData,
        "merchat_id": merchatId,
        "amount": amount,
        "flag_amount": flagAmount,
        "status": status,
        "create_at": createAt.toIso8601String(),
        "expires_at": expiresAt.toIso8601String(),
        "id": id,
      };
}
