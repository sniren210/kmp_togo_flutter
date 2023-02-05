class ModelAllNFT {
  List<Data>? data;
  Meta? meta;

  ModelAllNFT({this.data, this.meta});

  ModelAllNFT.fromJson(Map<String, dynamic> json) {
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
  dynamic description;
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
  Store? store;
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
      this.store,
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
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
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
    data['description'] = this.description;
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
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
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

class Store {
  String? imagePath;
  Coordinates? coordinates;
  int? id;
  String? name;
  String? image;
  String? address;
  dynamic provinceId;
  dynamic cityId;
  dynamic subdistrictId;
  String? postalCode;
  int? latitude;
  int? longitude;
  Geometry? geometry;
  int? ownerId;
  int? rating;
  int? ratingCount;
  int? ratingTotal;
  String? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Store(
      {this.imagePath,
      this.coordinates,
      this.id,
      this.name,
      this.image,
      this.address,
      this.provinceId,
      this.cityId,
      this.subdistrictId,
      this.postalCode,
      this.latitude,
      this.longitude,
      this.geometry,
      this.ownerId,
      this.rating,
      this.ratingCount,
      this.ratingTotal,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Store.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    id = json['id'];
    name = json['name'];
    image = json['image'];
    address = json['address'];
    provinceId = json['provinceId'];
    cityId = json['cityId'];
    subdistrictId = json['subdistrictId'];
    postalCode = json['postalCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    ownerId = json['ownerId'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    ratingTotal = json['ratingTotal'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['address'] = this.address;
    data['provinceId'] = this.provinceId;
    data['cityId'] = this.cityId;
    data['subdistrictId'] = this.subdistrictId;
    data['postalCode'] = this.postalCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    data['ownerId'] = this.ownerId;
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;
    data['ratingTotal'] = this.ratingTotal;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}

class Coordinates {
  int? latitude;
  int? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Geometry {
  String? type;
  List<int>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class NftUnit {
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
  String? imagePath;
  String? name;
  String? image;
  String? email;
  String? phoneNumber;

  Owner({this.imagePath, this.name, this.image, this.email, this.phoneNumber});

  Owner.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
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
