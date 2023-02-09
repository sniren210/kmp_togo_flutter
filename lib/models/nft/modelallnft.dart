class ModelAllNFT {
  List<Data>? data;
  Meta? meta;

  ModelAllNFT({this.data, this.meta});

  ModelAllNFT.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  ModelAllNFT dummy() {
    return ModelAllNFT(
      data: [
        Data(
          imagePath: 'https://i.imgur.com/NO25iZV.png',
          status: '',
          nftId: 'example id',
          categoryId: '',
          name: '',
          image: '',
          description: '',
          storeId: 0,
          priceToken: 0,
          sharePercentage: 0,
          monthlyPercentage: 0,
          physicAvl: true,
          holdLimitinDay: 0,
          expirationDate: '2011-11-02T02:50:12.208Z',
          qtyUnit: 0,
          avlUnit: 0,
          createdAt: '2011-11-02T02:50:12.208Z',
          updatedAt: '2011-11-02T02:50:12.208Z',
          deletedAt: '2011-11-02T02:50:12.208Z',
          store: Store(),
          category: '',
          gasfee: '',
          admfee: '',
          priceCoin: '',
          nftUnit: [
            NftUnit(
              nftSerialId: '',
              nftId: 'example id',
              ownerId: 0,
              priceToken: 0,
              sharePercentage: 0,
              monthlyPercentage: 0,
              holdLimitTill: '',
              createdAt: '',
              updatedAt: '',
              deletedAt: '2011-11-02T02:50:12.208Z',
              owner: Owner(
                imagePath: 'https://i.imgur.com/NO25iZV.png',
                name: '',
                image: '',
                email: '',
                phoneNumber: '',
              ),
              gasfee: 0.0,
              admfee: 0.0,
              priceCoin: 0.0,
            )
          ],
        ),
      ],
    );
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
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
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
    if (store != null) {
      data['store'] = store!.toJson();
    }
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
        ? Coordinates.fromJson(json['coordinates'])
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
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imagePath'] = imagePath;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['address'] = address;
    data['provinceId'] = provinceId;
    data['cityId'] = cityId;
    data['subdistrictId'] = subdistrictId;
    data['postalCode'] = postalCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    data['ownerId'] = ownerId;
    data['rating'] = rating;
    data['ratingCount'] = ratingCount;
    data['ratingTotal'] = ratingTotal;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imagePath'] = imagePath;
    data['name'] = name;
    data['image'] = image;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

class Meta {
  String? a;
  Meta({this.a});

  Meta.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
