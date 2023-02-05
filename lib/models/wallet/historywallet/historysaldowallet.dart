class ModelHistorySaldoWallet {
  List<Data>? data;
  Meta? meta;

  ModelHistorySaldoWallet({this.data, this.meta});

  ModelHistorySaldoWallet.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  double? trxIn;
  double? trxOut;
  String? description;
  double? gasFeeIncluded;
  double? gasFeeExcluded;
  String? cryptoResponse;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Data(
      {this.id,
      this.userId,
      this.trxIn,
      this.trxOut,
      this.description,
      this.gasFeeIncluded,
      this.gasFeeExcluded,
      this.cryptoResponse,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    trxIn = double.tryParse(json['trxIn'].toString());
    trxOut = double.tryParse(json['trxOut'].toString());
    description = json['description'];
    gasFeeIncluded = double.tryParse(json['gasFeeIncluded'].toString());
    gasFeeExcluded = double.tryParse(json['gasFeeExcluded'].toString());
    cryptoResponse = json['cryptoResponse'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['trxIn'] = trxIn;
    data['trxOut'] = trxOut;
    data['description'] = description;
    data['gasFeeIncluded'] = gasFeeIncluded;
    data['gasFeeExcluded'] = gasFeeExcluded;
    data['cryptoResponse'] = cryptoResponse;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class Meta {
  int? count;
  String? page;
  String? limit;

  Meta({this.count, this.page, this.limit});

  Meta.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['page'] = page;
    data['limit'] = limit;
    return data;
  }
}
