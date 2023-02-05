// To parse this JSON data, do
//
//     final itemModelPostPaidInquery2 = itemModelPostPaidInquery2FromJson(jsonString);

import 'dart:convert';

ItemModelPostPaidInquery2 itemModelPostPaidInquery2FromJson(String str) =>
    ItemModelPostPaidInquery2.fromJson(json.decode(str));

String itemModelPostPaidInquery2ToJson(ItemModelPostPaidInquery2 data) =>
    json.encode(data.toJson());

class ItemModelPostPaidInquery2 {
  ItemModelPostPaidInquery2({
    required this.data,
  });

  dynamic data;

  factory ItemModelPostPaidInquery2.fromJson(Map<String, dynamic> json) =>
      ItemModelPostPaidInquery2(
        data: Data.fromJson(json["data"]),
      );

  factory ItemModelPostPaidInquery2.fromJson01(Map<String, dynamic> json) =>
      ItemModelPostPaidInquery2(
        data: Data01.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.gasfee,
    required this.admin,
    required this.price,
    required this.trId,
    required this.code,
    required this.hp,
    required this.trName,
    required this.period,
    required this.nominal,
    required this.refId,
    required this.responseCode,
    required this.message,
    required this.desc,
  });

  double? gasfee;
  dynamic admin;
  double? price;
  int? trId;
  String? code;
  String? hp;
  String? trName;
  String? period;
  int? nominal;
  String? refId;
  String? responseCode;
  String? message;
  Desc? desc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        gasfee: json["gasfee"] != null ? json["gasfee"].toDouble() : 0,
        admin: json["admin"] ?? '',
        price: json["price"] != null ? json["price"].toDouble() : 0,
        trId: json["tr_id"] ?? '',
        code: json["code"] ?? '',
        hp: json["hp"] ?? '',
        trName: json["tr_name"] ?? '',
        period: json["period"] ?? '',
        nominal: json["nominal"] ?? '',
        refId: json["ref_id"] ?? '',
        responseCode: json["response_code"] ?? '',
        message: json["message"] ?? '',
        desc: Desc.fromJson(json["desc"] ??
            Desc(
              kodeArea: json["kode_area"],
              divre: json["divre"],
              datel: json["datel"],
              jumlahTagihan: json["jumlah_tagihan"],
              tagihan: json.containsKey('tagihan')
                  ? Tagihan.fromJson(json["tagihan"])
                  : null,
            )),
      );

  Map<String, dynamic> toJson() => {
        "gasfee": gasfee,
        "admin": admin,
        "price": price,
        "tr_id": trId,
        "code": code,
        "hp": hp,
        "tr_name": trName,
        "period": period,
        "nominal": nominal,
        "ref_id": refId,
        "response_code": responseCode,
        "message": message,
        "desc": desc!.toJson(),
      };
}

class Data01 {
  Data01({
    required this.gasfee,
    required this.admin,
    required this.price,
    required this.responseCode,
    required this.message,
  });

  double? gasfee;
  dynamic admin;
  double? price;
  String? responseCode;
  String? message;

  factory Data01.fromJson(Map<String, dynamic> json) => Data01(
        gasfee: json["gasfee"] != null ? json["gasfee"].toDouble() : 0,
        admin: json["admin"] ?? '',
        price: json["price"] != null ? json["price"].toDouble() : 0,
        responseCode: json["response_code"] ?? '',
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "gasfee": gasfee,
        "admin": admin,
        "price": price,
        "response_code": responseCode,
        "message": message,
      };
}

class Desc {
  Desc({
    required this.kodeArea,
    required this.divre,
    required this.datel,
    required this.jumlahTagihan,
    required this.tagihan,
  });

  String? kodeArea;
  String? divre;
  String? datel;
  int? jumlahTagihan;
  Tagihan? tagihan;

  factory Desc.fromJson(Map<String, dynamic> json) => Desc(
        kodeArea: json["kode_area"] ?? '',
        divre: json["divre"] ?? '',
        datel: json["datel"] ?? '',
        jumlahTagihan: json["jumlah_tagihan"] ?? 0,
        tagihan: json.containsKey('tagihan')
            ? Tagihan.fromJson(json["tagihan"] ?? Tagihan(detail: []))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "kode_area": kodeArea,
        "divre": divre,
        "datel": datel,
        "jumlah_tagihan": jumlahTagihan,
        "tagihan": tagihan != null ? tagihan!.toJson() : null,
      };
}

class Tagihan {
  Tagihan({
    required this.detail,
  });

  List<Detail> detail;

  factory Tagihan.fromJson(Map<String, dynamic> json) => Tagihan(
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    required this.periode,
    required this.nilaiTagihan,
    required this.admin,
    required this.total,
  });

  String periode;
  String nilaiTagihan;
  String admin;
  int total;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        periode: json["periode"],
        nilaiTagihan: json["nilai_tagihan"],
        admin: json["admin"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "periode": periode,
        "nilai_tagihan": nilaiTagihan,
        "admin": admin,
        "total": total,
      };
}
