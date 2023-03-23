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
    required this.merchantTrxId,
    required this.transactionId,
    required this.additionalData,
    required this.merchantId,
    required this.amount,
    required this.flagAmount,
    required this.isClosed,
    required this.status,
    required this.createdAt,
    required this.expiresAt,
    required this.id,
    required this.monthlyPrincipalFee,
    required this.monthlyMandatoryFee,
    required this.adminFee,
    required this.discountPercentage,
  });

  String uuid;
  int userId;
  String name;
  String accountNumber;
  String procode;
  String merchantTrxId;
  int transactionId;
  String additionalData;
  int merchantId;
  int amount;
  String flagAmount;
  String isClosed;
  String status;
  int monthlyPrincipalFee;
  int monthlyMandatoryFee;
  int adminFee;
  String discountPercentage;
  DateTime createdAt;
  DateTime expiresAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        uuid: json["uuid"],
        userId: json["user_id"],
        name: json["name"],
        accountNumber: json["account_number"],
        procode: json["procode"],
        merchantTrxId: json["merchant_trx_id"],
        transactionId: json["transaction_id"],
        additionalData: json["additional_data"],
        merchantId: json["merchant_id"],
        amount: json["amount"],
        flagAmount: json["flag_amount"],
        isClosed: json["is_closed"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        expiresAt: DateTime.parse(json["expires_at"]),
        id: json["id"],
        monthlyPrincipalFee: json["monthly_principal_fee"] == null
            ? 0
            : json["monthly_principal_fee"],
        monthlyMandatoryFee: json["monthly_mandatory_fee"] == null
            ? 0
            : json["monthly_mandatory_fee"],
        adminFee: json["admin_fee"] == null ? 0 : json["admin_fee"],
        discountPercentage: json["discount_percentage"] == null
            ? ''
            : json["discount_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "user_id": userId,
        "name": name,
        "account_number": accountNumber,
        "procode": procode,
        "merchant_trx_id": merchantTrxId,
        "transaction_id": transactionId,
        "additional_data": additionalData,
        "merchant_id": merchantId,
        "amount": amount,
        "flag_amount": flagAmount,
        "is_closed": isClosed,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "expires_at": expiresAt.toIso8601String(),
        "id": id,
        "monthly_principal_fee": monthlyPrincipalFee,
        "monthly_mandatory_fee": monthlyMandatoryFee,
        "admin_fee": adminFee,
        "discount_percentage": discountPercentage,
      };
}
