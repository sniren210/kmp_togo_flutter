

import 'dart:convert';

ItemModelPostPaidInquiry itemModelPostPaidInquiryFromJson(String str) =>
    ItemModelPostPaidInquiry.fromJson(json.decode(str));

String itemModelPostPaidInquiryToJson(ItemModelPostPaidInquiry data) =>
    json.encode(data.toJson());

class ItemModelPostPaidInquiry {
  ItemModelPostPaidInquiry({
    required this.data,
  });

  Data data;

  factory ItemModelPostPaidInquiry.fromJson(Map<String, dynamic> json) =>
      ItemModelPostPaidInquiry(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.trId,
    required this.code,
    required this.hp,
    required this.trName,
    required this.period,
    required this.nominal,
    required this.admin,
    required this.refId,
    required this.responseCode,
    required this.message,
    required this.price,
    required this.sellingPrice,
    required this.desc,
  });

  int trId;
  String code;
  String hp;
  String trName;
  String period;
  int nominal;
  int admin;
  String refId;
  String responseCode;
  String message;
  double price;
  int sellingPrice;
  Desc desc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trId: json["tr_id"] ?? 0,
        code: json["code"] ?? '',
        hp: json["hp"] ?? '',
        trName: json["tr_name"] ?? '',
        period: json["period"] ?? '',
        nominal: json["nominal"] ?? 0,
        admin: json["admin"] ?? 0,
        refId: json["ref_id"] ?? '',
        responseCode: json["response_code"] ?? '',
        message: json["message"] ?? '',
        price: json["price"] ?? 0,
        sellingPrice: json["selling_price"] ?? 0,
        desc: Desc.fromJson(json["desc"] ??
            {
              "bill_quantity": 0,
              "address": "",
              "biller_admin": "",
              "pdam_name": "",
              "stamp_duty": "",
              "due_date": "",
              "kode_tarif": "",
              "bill": {
                "detail": [
                  {
                    "period": "",
                    "first_meter": 0,
                    "last_meter": 0,
                    "penalty": 0,
                    "bill_amount": 0,
                    "misc_amount": 0,
                    "stand": ""
                  }
                ]
              }
            }),
      );

  Map<String, dynamic> toJson() => {
        "tr_id": trId,
        "code": code,
        "hp": hp,
        "tr_name": trName,
        "period": period,
        "nominal": nominal,
        "admin": admin,
        "ref_id": refId,
        "response_code": responseCode,
        "message": message,
        "price": price,
        "selling_price": sellingPrice,
        "desc": desc.toJson(),
      };
}

class Desc {
  Desc({
    required this.billQuantity,
    required this.address,
    required this.billerAdmin,
    required this.pdamName,
    required this.stampDuty,
    required this.dueDate,
    required this.kodeTarif,
    required this.bill,
  });

  int billQuantity;
  String address;
  String billerAdmin;
  String pdamName;
  String stampDuty;
  String dueDate;
  String kodeTarif;
  Bill bill;

  factory Desc.fromJson(Map<String, dynamic> json) => Desc(
        billQuantity: json["bill_quantity"] ?? 0,
        address: json["address"] ?? '',
        billerAdmin: json["biller_admin"] ?? '',
        pdamName: json["pdam_name"] ?? '',
        stampDuty: json["stamp_duty"] ?? '',
        dueDate: json["due_date"] ?? '',
        kodeTarif: json["kode_tarif"] ?? '',
        bill: Bill.fromJson(json["bill"] ?? Bill(detail: [])),
      );

  Map<String, dynamic> toJson() => {
        "bill_quantity": billQuantity,
        "address": address,
        "biller_admin": billerAdmin,
        "pdam_name": pdamName,
        "stamp_duty": stampDuty,
        "due_date": dueDate,
        "kode_tarif": kodeTarif,
        "bill": bill.toJson(),
      };
}

class Bill {
  Bill({
    required this.detail,
  });

  List<Detail> detail;

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    required this.period,
    required this.firstMeter,
    required this.lastMeter,
    required this.penalty,
    required this.billAmount,
    required this.miscAmount,
    required this.stand,
  });

  String period;
  int firstMeter;
  int lastMeter;
  int penalty;
  int billAmount;
  int miscAmount;
  String stand;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        period: json["period"] ?? '',
        firstMeter: json["first_meter"] ?? 0,
        lastMeter: json["last_meter"] ?? 0,
        penalty: json["penalty"] ?? 0,
        billAmount: json["bill_amount"] ?? 0,
        miscAmount: json["misc_amount"] ?? 0,
        stand: json["stand"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "period": period,
        "first_meter": firstMeter,
        "last_meter": lastMeter,
        "penalty": penalty,
        "bill_amount": billAmount,
        "misc_amount": miscAmount,
        "stand": stand,
      };
}

ItemModelPostPaidError itemModelPostPaidErrorFromJson(String str) =>
    ItemModelPostPaidError.fromJson(json.decode(str));

String itemModelPostPaidErrorToJson(ItemModelPostPaidError data) =>
    json.encode(data.toJson());

class ItemModelPostPaidError {
  ItemModelPostPaidError({
    required this.data,
  });

  Res data;

  factory ItemModelPostPaidError.fromJson(Map<String, dynamic> json) =>
      ItemModelPostPaidError(
        data: Res.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Res {
  Res({
    required this.responseCode,
    required this.message,
  });

  String responseCode;
  String message;

  factory Res.fromJson(Map<String, dynamic> json) => Res(
        responseCode: json["response_code"] ?? '',
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "message": message,
      };
}
