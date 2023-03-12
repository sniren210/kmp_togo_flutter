// To parse this JSON data, do
//
//     final imageAssetModel = imageAssetModelFromJson(jsonString);

import 'dart:convert';

ImageAssetModel imageAssetModelFromJson(String str) =>
    ImageAssetModel.fromJson(json.decode(str));

String imageAssetModelToJson(ImageAssetModel data) =>
    json.encode(data.toJson());

class ImageAssetModel {
  ImageAssetModel({
    required this.status,
    required this.success,
    required this.data,
  });

  int status;
  bool success;
  List<Datum> data;

  factory ImageAssetModel.fromJson(Map<String, dynamic> json) =>
      ImageAssetModel(
        status: json["status"],
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.description,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.imageUrl,
  });

  int id;
  String title;
  String slug;
  String image;
  String description;
  String type;
  DateTime createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String imageUrl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        description: json["description"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        deletedAt: json["deleted_at"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "image": image,
        "description": description,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "image_url": imageUrl,
      };
}
