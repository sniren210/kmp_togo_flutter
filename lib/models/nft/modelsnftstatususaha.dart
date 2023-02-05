class ModelNFTStatusMyUsaha {
  List<Data>? data;
  Meta? meta;

  ModelNFTStatusMyUsaha({this.data, this.meta});

  ModelNFTStatusMyUsaha.fromJson(Map<String, dynamic> json) {
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
  dynamic gasfee;
  dynamic admfee;
  dynamic priceCoin;
  String? nftSerialId;
  String? nftId;
  int? ownerId;
  int? priceToken;
  int? sharePercentage;
  Null monthlyPercentage;
  Null holdLimitTill;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  Nft? nft;

  Data(
      {this.gasfee,
      this.admfee,
      this.priceCoin,
      this.nftSerialId,
      this.nftId,
      this.ownerId,
      this.priceToken,
      this.sharePercentage,
      this.monthlyPercentage,
      this.holdLimitTill,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.nft});

  Data.fromJson(Map<String, dynamic> json) {
    gasfee = json['gasfee'];
    admfee = json['admfee'];
    priceCoin = json['priceCoin'];
    nftSerialId = json['nftSerialId'];
    nftId = json['nftId'];
    ownerId = json['ownerId'];
    priceToken = json['priceToken'];
    sharePercentage = json['sharePercentage'];
    monthlyPercentage = json['monthlyPercentage'];
    holdLimitTill = json['holdLimitTill'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    nft = json['nft'] != null ? Nft.fromJson(json['nft']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gasfee'] = gasfee;
    data['admfee'] = admfee;
    data['priceCoin'] = priceCoin;
    data['nftSerialId'] = nftSerialId;
    data['nftId'] = nftId;
    data['ownerId'] = ownerId;
    data['priceToken'] = priceToken;
    data['sharePercentage'] = sharePercentage;
    data['monthlyPercentage'] = monthlyPercentage;
    data['holdLimitTill'] = holdLimitTill;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (nft != null) {
      data['nft'] = nft!.toJson();
    }
    return data;
  }
}

class Nft {
  dynamic gasfee;
  dynamic admfee;
  dynamic priceCoin;
  String? imagePath;
  String? status;
  String? nftId;
  Null categoryId;
  String? name;
  String? image;
  Null description;
  int? storeId;
  int? priceToken;
  int? sharePercentage;
  Null monthlyPercentage;
  bool? physicAvl;
  int? holdLimitinDay;
  Null expirationDate;
  int? qtyUnit;
  int? avlUnit;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  Null category;

  Nft(
      {this.gasfee,
      this.admfee,
      this.priceCoin,
      this.imagePath,
      this.status,
      this.nftId,
      this.categoryId,
      this.name,
      this.image,
      this.description,
      this.storeId,
      this.priceToken,
      this.sharePercentage,
      this.monthlyPercentage,
      this.physicAvl,
      this.holdLimitinDay,
      this.expirationDate,
      this.qtyUnit,
      this.avlUnit,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.category});

  Nft.fromJson(Map<String, dynamic> json) {
    gasfee = json['gasfee'];
    admfee = json['admfee'];
    priceCoin = json['priceCoin'];
    imagePath = json['imagePath'];
    status = json['status'];
    nftId = json['nftId'];
    categoryId = json['categoryId'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    storeId = json['storeId'];
    priceToken = json['priceToken'];
    sharePercentage = json['sharePercentage'];
    monthlyPercentage = json['monthlyPercentage'];
    physicAvl = json['physicAvl'];
    holdLimitinDay = json['holdLimitinDay'];
    expirationDate = json['expirationDate'];
    qtyUnit = json['qtyUnit'];
    avlUnit = json['avlUnit'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gasfee'] = gasfee;
    data['admfee'] = admfee;
    data['priceCoin'] = priceCoin;
    data['imagePath'] = imagePath;
    data['status'] = status;
    data['nftId'] = nftId;
    data['categoryId'] = categoryId;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['storeId'] = storeId;
    data['priceToken'] = priceToken;
    data['sharePercentage'] = sharePercentage;
    data['monthlyPercentage'] = monthlyPercentage;
    data['physicAvl'] = physicAvl;
    data['holdLimitinDay'] = holdLimitinDay;
    data['expirationDate'] = expirationDate;
    data['qtyUnit'] = qtyUnit;
    data['avlUnit'] = avlUnit;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['category'] = category;
    return data;
  }
}

class Meta {
  String? status;

  Meta({this.status});

  Meta.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    return data;
  }
}
