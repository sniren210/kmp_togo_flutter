class ModelNFTItemProdusen {
  List<Data>? data;
  Meta? meta;

  ModelNFTItemProdusen({this.data, this.meta});

  ModelNFTItemProdusen.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? storeId;
  int? categoryId;
  dynamic subCategoryId;
  String? name;
  String? image;
  String? description;
  String? productSelling;
  int? rating;
  int? ratingCount;
  int? ratingTotal;
  int? soldCount;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Sku>? sku;
  Store? store;
  Category? category;
  dynamic subCategory;

  Data(
      {this.imagePath,
      this.id,
      this.storeId,
      this.categoryId,
      this.subCategoryId,
      this.name,
      this.image,
      this.description,
      this.productSelling,
      this.rating,
      this.ratingCount,
      this.ratingTotal,
      this.soldCount,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.sku,
      this.store,
      this.category,
      this.subCategory});

  Data.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    id = json['id'];
    storeId = json['storeId'];
    categoryId = json['categoryId'];
    subCategoryId = json['subCategoryId'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    productSelling = json['productSelling'];
    rating = json['rating'];
    ratingCount = json['ratingCount'];
    ratingTotal = json['ratingTotal'];
    soldCount = json['soldCount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    if (json['sku'] != null) {
      sku = <Sku>[];
      json['sku'].forEach((v) {
        sku!.add(new Sku.fromJson(v));
      });
    }
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subCategory = json['subCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['id'] = this.id;
    data['storeId'] = this.storeId;
    data['categoryId'] = this.categoryId;
    data['subCategoryId'] = this.subCategoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['productSelling'] = this.productSelling;
    data['rating'] = this.rating;
    data['ratingCount'] = this.ratingCount;
    data['ratingTotal'] = this.ratingTotal;
    data['soldCount'] = this.soldCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.sku != null) {
      data['sku'] = this.sku!.map((v) => v.toJson()).toList();
    }
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['subCategory'] = this.subCategory;
    return data;
  }
}

class Sku {
  int? id;
  int? productId;
  int? price;
  int? stock;
  int? weight;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Sku(
      {this.id,
      this.productId,
      this.price,
      this.stock,
      this.weight,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Sku.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    price = json['price'];
    stock = json['stock'];
    weight = json['weight'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['weight'] = this.weight;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
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

class Category {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Category(
      {this.id, this.name, this.createdAt, this.updatedAt, this.deletedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}

class Meta {
  String? storeId;

  Meta({this.storeId});

  Meta.fromJson(Map<String, dynamic> json) {
    storeId = json['storeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeId'] = this.storeId;
    return data;
  }
}
