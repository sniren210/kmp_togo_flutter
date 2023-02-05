class ModelMyNFT {
  List<Data>? data;
  Meta? meta;

  ModelMyNFT({this.data, this.meta});

  ModelMyNFT.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
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
  int? monthlyPercentage;
  String? holdLimitTill;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
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
    nft = json['nft'] != null ? new Nft.fromJson(json['nft']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gasfee'] = this.gasfee;
    data['admfee'] = this.admfee;
    data['priceCoin'] = this.priceCoin;
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
    return data;
  }
}

class Nft {
  dynamic gasfee;
  dynamic admfee;
  dynamic priceCoin;
  String? imagePath;
  String? nftId;
  String? name;
  String? image;
  int? storeId;
  int? priceToken;
  int? sharePercentage;
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
      {this.gasfee,
      this.admfee,
      this.priceCoin,
      this.imagePath,
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
    gasfee = json['gasfee'];
    admfee = json['admfee'];
    priceCoin = json['priceCoin'];
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
    data['gasfee'] = this.gasfee;
    data['admfee'] = this.admfee;
    data['priceCoin'] = this.priceCoin;
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
