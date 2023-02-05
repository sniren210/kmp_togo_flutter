class ModelNFTItemProdusen {
  List<Data>? data;
  Meta? meta;

  ModelNFTItemProdusen({this.data, this.meta});

  ModelNFTItemProdusen.fromJson(Map<String, dynamic> json) {
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
        sku!.add(Sku.fromJson(v));
      });
    }
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    subCategory = json['subCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imagePath'] = imagePath;
    data['id'] = id;
    data['storeId'] = storeId;
    data['categoryId'] = categoryId;
    data['subCategoryId'] = subCategoryId;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['productSelling'] = productSelling;
    data['rating'] = rating;
    data['ratingCount'] = ratingCount;
    data['ratingTotal'] = ratingTotal;
    data['soldCount'] = soldCount;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (sku != null) {
      data['sku'] = sku!.map((v) => v.toJson()).toList();
    }
    if (store != null) {
      data['store'] = store!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['subCategory'] = subCategory;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productId'] = productId;
    data['price'] = price;
    data['stock'] = stock;
    data['weight'] = weight;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['storeId'] = storeId;
    return data;
  }
}
