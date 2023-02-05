// To parse this JSON data, do
//
//     final providerModel = providerModelFromJson(jsonString);

import 'dart:convert';

List<ProviderModel> providerModelFromJson(String str) =>
    List<ProviderModel>.from(
        json.decode(str).map((x) => ProviderModel.fromJson(x)));

String providerModelToJson(List<ProviderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProviderModel {
  ProviderModel({
    required this.id,
    required this.providerName,
  });

  final int id;
  final String providerName;

  factory ProviderModel.fromJson(Map<String, dynamic> json) => ProviderModel(
        id: json["id"],
        providerName: json["provider_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "provider_name": providerName,
      };
}
