class ModelNFTKonsumenUsaha {
  List<Data>? data;
  Meta? meta;

  ModelNFTKonsumenUsaha({this.data, this.meta});

  ModelNFTKonsumenUsaha.fromJson(Map<String, dynamic> json) {
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
        nftUnit!.add(NftUnit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imagePath'] = imagePath;
    data['status'] = status;
    data['nftId'] = nftId;
    data['categoryId'] = categoryId;
    data['name'] = name;
    data['image'] = image;
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
    data['gasfee'] = gasfee;
    data['admfee'] = admfee;
    data['priceCoin'] = priceCoin;
    if (nftUnit != null) {
      data['nftUnit'] = nftUnit!.map((v) => v.toJson()).toList();
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
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    gasfee = json['gasfee'];
    admfee = json['admfee'];
    priceCoin = json['priceCoin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['gasfee'] = gasfee;
    data['admfee'] = admfee;
    data['priceCoin'] = priceCoin;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
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
