class ModelNFTId {
  Data? data;
  Meta? meta;

  ModelNFTId({this.data, this.meta});

  ModelNFTId.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? nftSerialId;
  String? nftId;
  dynamic ownerId;
  int? priceToken;
  dynamic sharePercentage;
  int? monthlyPercentage;
  dynamic holdLimitTill;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Nft? nft;
  dynamic priceCoin;

  Data(
      {this.nftSerialId,
      this.nftId,
      this.ownerId,
      this.priceToken,
      this.sharePercentage,
      this.monthlyPercentage,
      this.holdLimitTill,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.nft,
      this.priceCoin});

  Data.fromJson(Map<String, dynamic> json) {
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
    nft = json['nft'] != null ? new Nft.fromJson(json['nft']) : null;
    priceCoin = json['priceCoin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nftSerialId'] = this.nftSerialId;
    data['nftId'] = this.nftId;
    data['ownerId'] = this.ownerId;
    data['priceToken'] = this.priceToken;
    data['sharePercentage'] = this.sharePercentage;
    data['monthlyPercentage'] = this.monthlyPercentage;
    data['holdLimitTill'] = this.holdLimitTill;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.nft != null) {
      data['nft'] = this.nft!.toJson();
    }
    data['priceCoin'] = this.priceCoin;
    return data;
  }
}

class Nft {
  String? imagePath;
  String? nftId;
  String? name;
  String? image;
  dynamic storeId;
  int? priceToken;
  dynamic sharePercentage;
  int? monthlyPercentage;
  bool? physicAvl;
  int? holdLimitinDay;
  String? expirationDate;
  int? qtyUnit;
  int? avlUnit;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Nft(
      {this.imagePath,
      this.nftId,
      this.name,
      this.image,
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
      this.deletedAt});

  Nft.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    nftId = json['nftId'];
    name = json['name'];
    image = json['image'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['nftId'] = this.nftId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['storeId'] = this.storeId;
    data['priceToken'] = this.priceToken;
    data['sharePercentage'] = this.sharePercentage;
    data['monthlyPercentage'] = this.monthlyPercentage;
    data['physicAvl'] = this.physicAvl;
    data['holdLimitinDay'] = this.holdLimitinDay;
    data['expirationDate'] = this.expirationDate;
    data['qtyUnit'] = this.qtyUnit;
    data['avlUnit'] = this.avlUnit;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}

class Meta {
  String? a;

  Meta({this.a});

  Meta.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
