class ModelNFTKonsumenUsaha {
  List<Data>? data;
  Meta? meta;

  ModelNFTKonsumenUsaha({this.data, this.meta});

  ModelNFTKonsumenUsaha.fromJson(Map<String, dynamic> json) {
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
  String? imagePath;
  String? status;
  String? nftId;
  dynamic categoryId;
  String? name;
  String? image;
  int? storeId;
  int? priceToken;
  int? sharePercentage;
  dynamic monthlyPercentage;
  bool? physicAvl;
  int? holdLimitinDay;
  dynamic expirationDate;
  int? qtyUnit;
  int? avlUnit;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic category;
  dynamic gasfee;
  dynamic admfee;
  dynamic priceCoin;
  List<NftUnit>? nftUnit;

  Data(
      {this.imagePath,
      this.status,
      this.nftId,
      this.categoryId,
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
      this.deletedAt,
      this.category,
      this.gasfee,
      this.admfee,
      this.priceCoin,
      this.nftUnit});

  Data.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    status = json['status'];
    nftId = json['nftId'];
    categoryId = json['categoryId'];
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
    category = json['category'];
    gasfee = json['gasfee'];
    admfee = json['admfee'];
    priceCoin = json['priceCoin'];
    if (json['nftUnit'] != null) {
      nftUnit = <NftUnit>[];
      json['nftUnit'].forEach((v) {
        nftUnit!.add(new NftUnit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['status'] = this.status;
    data['nftId'] = this.nftId;
    data['categoryId'] = this.categoryId;
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
    data['category'] = this.category;
    data['gasfee'] = this.gasfee;
    data['admfee'] = this.admfee;
    data['priceCoin'] = this.priceCoin;
    if (this.nftUnit != null) {
      data['nftUnit'] = this.nftUnit!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NftUnit {
  String? nftSerialId;
  String? nftId;
  int? ownerId;
  int? priceToken;
  int? sharePercentage;
  dynamic monthlyPercentage;
  String? holdLimitTill;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Owner? owner;
  dynamic gasfee;
  dynamic admfee;
  dynamic priceCoin;

  NftUnit(
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
      this.owner,
      this.gasfee,
      this.admfee,
      this.priceCoin});

  NftUnit.fromJson(Map<String, dynamic> json) {
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
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    gasfee = json['gasfee'];
    admfee = json['admfee'];
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
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['gasfee'] = this.gasfee;
    data['admfee'] = this.admfee;
    data['priceCoin'] = this.priceCoin;
    return data;
  }
}

class Owner {
  String? name;

  Owner({this.name});

  Owner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
