

import 'dart:convert';

ItemModelSuccess itemModelResponseFromJson(String str) => ItemModelSuccess.fromJson(json.decode(str));

String itemModelResponseToJson(ItemModelSuccess data) => json.encode(data.toJson());

class ItemModelSuccess {
  ItemModelSuccess({
    required this.data,
  });

  String data;

  factory ItemModelSuccess.fromJson(Map<String, dynamic> json) => ItemModelSuccess(
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
  };
}
