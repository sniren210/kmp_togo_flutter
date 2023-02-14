

import 'dart:convert';

ItemModelPostPaidType postPaidTypeFromJson(String str) =>
    ItemModelPostPaidType.fromJson(json.decode(str));

String postPaidTypeToJson(ItemModelPostPaidType data) =>
    json.encode(data.toJson());

class ItemModelPostPaidType {
  ItemModelPostPaidType({
    required this.data,
  });

  List<Datum> data;

  factory ItemModelPostPaidType.fromJson(Map<String, dynamic> json) =>
      ItemModelPostPaidType(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.key,
    required this.name,
    required this.postpaid,
  });

  int id;
  String key;
  String name;
  bool postpaid;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        key: json["key"],
        name: json["name"],
        postpaid: json["postpaid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "name": name,
        "postpaid": postpaid,
      };
}
