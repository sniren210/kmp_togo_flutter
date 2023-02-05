class ModelTipeAnggota {
  List<DataTipeAnggota>? data;

  ModelTipeAnggota({this.data});

  ModelTipeAnggota.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataTipeAnggota>[];
      json['data'].forEach((v) {
        data!.add(new DataTipeAnggota.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataTipeAnggota {
  String? id;
  String? name;
  int? price;
  String? description;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  DataTipeAnggota(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  DataTipeAnggota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
