

import 'dart:convert';

ItemModelBuyProduct itemModelBuyProductFromJson(String str) => ItemModelBuyProduct.fromJson(json.decode(str));

String itemModelBuyProductToJson(ItemModelBuyProduct data) => json.encode(data.toJson());

class ItemModelBuyProduct {
  ItemModelBuyProduct({
    required this.data,
  });

  Data data;

  factory ItemModelBuyProduct.fromJson(Map<String, dynamic> json) => ItemModelBuyProduct(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.subTotal,
    required this.gasFee,
    required this.admFee,
    required this.discount,
    required this.miscellaneous,
    required this.total,
    required this.status,
    required this.tokenTransactionId,
    required this.updatedAt,
    required this.createdAt,
    required this.orders,
  });

  int id;
  int userId;
  int subTotal;
  double gasFee;
  double admFee;
  int discount;
  int miscellaneous;
  double total;
  String status;
  int tokenTransactionId;
  DateTime updatedAt;
  DateTime createdAt;
  List<Order> orders;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["userId"],
    subTotal: json["subTotal"],
    gasFee: json["gasFee"].toDouble(),
    admFee: json["admFee"].toDouble(),
    discount: json["discount"],
    miscellaneous: json["miscellaneous"],
    total: json["total"].toDouble(),
    status: json["status"],
    tokenTransactionId: json["tokenTransactionId"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "subTotal": subTotal,
    "gasFee": gasFee,
    "admFee": admFee,
    "discount": discount,
    "miscellaneous": miscellaneous,
    "total": total,
    "status": status,
    "tokenTransactionId": tokenTransactionId,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order {
  Order({
    required this.id,
    required this.userId,
    required this.productOrderId,
    required this.storeId,
    required this.subTotal,
    required this.shippingTotal,
    required this.miscellaneous,
    required this.discount,
    required this.total,
    required this.notes,
    required this.status,
    required this.store,
    required this.expireIn,
    required this.updatedAt,
    required this.createdAt,
    required this.orderItems,
  });

  String id;
  int userId;
  int productOrderId;
  int storeId;
  int subTotal;
  int shippingTotal;
  int miscellaneous;
  int discount;
  int total;
  String notes;
  String status;
  Store store;
  dynamic expireIn;
  DateTime updatedAt;
  DateTime createdAt;
  List<OrderItem> orderItems;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    userId: json["userId"],
    productOrderId: json["productOrderId"],
    storeId: json["storeId"],
    subTotal: json["subTotal"],
    shippingTotal: json["shippingTotal"],
    miscellaneous: json["miscellaneous"],
    discount: json["discount"],
    total: json["total"],
    notes: json["notes"],
    status: json["status"],
    store: Store.fromJson(json["store"]),
    expireIn: json["expireIn"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    orderItems: List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "productOrderId": productOrderId,
    "storeId": storeId,
    "subTotal": subTotal,
    "shippingTotal": shippingTotal,
    "miscellaneous": miscellaneous,
    "discount": discount,
    "total": total,
    "notes": notes,
    "status": status,
    "store": store.toJson(),
    "expireIn": expireIn,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
  };
}

class OrderItem {
  OrderItem({
    required this.isCanceled,
    required this.ratingId,
    required this.id,
    required this.skuId,
    required this.qty,
    required this.price,
    required this.total,
    required this.productId,
    required this.productOrderId,
    required this.productOrderDetailId,
    required this.updatedAt,
    required this.createdAt,
    required this.sku,
  });

  bool isCanceled;
  dynamic ratingId;
  int id;
  int skuId;
  int qty;
  int price;
  int total;
  int productId;
  int productOrderId;
  String productOrderDetailId;
  DateTime updatedAt;
  DateTime createdAt;
  Sku sku;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    isCanceled: json["isCanceled"],
    ratingId: json["ratingId"],
    id: json["id"],
    skuId: json["skuId"],
    qty: json["qty"],
    price: json["price"],
    total: json["total"],
    productId: json["productId"],
    productOrderId: json["productOrderId"],
    productOrderDetailId: json["productOrderDetailId"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    sku: Sku.fromJson(json["sku"]),
  );

  Map<String, dynamic> toJson() => {
    "isCanceled": isCanceled,
    "ratingId": ratingId,
    "id": id,
    "skuId": skuId,
    "qty": qty,
    "price": price,
    "total": total,
    "productId": productId,
    "productOrderId": productOrderId,
    "productOrderDetailId": productOrderDetailId,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "sku": sku.toJson(),
  };
}

class Sku {
  Sku({
    required this.id,
    required this.productId,
    required this.price,
    required this.stock,
    required this.weight,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.product,
  });

  int id;
  int productId;
  int price;
  int stock;
  int weight;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Product product;

  factory Sku.fromJson(Map<String, dynamic> json) => Sku(
    id: json["id"],
    productId: json["productId"],
    price: json["price"],
    stock: json["stock"],
    weight: json["weight"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "price": price,
    "stock": stock,
    "weight": weight,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "product": product.toJson(),
  };
}

class Product {
  Product({
    required this.imagePath,
    required this.id,
    required this.storeId,
    required this.categoryId,
    required this.subCategoryId,
    required this.name,
    required this.image,
    required this.description,
    required this.productSelling,
    required this.rating,
    required this.ratingCount,
    required this.ratingTotal,
    required this.soldCount,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  String imagePath;
  int id;
  int storeId;
  int categoryId;
  dynamic subCategoryId;
  String name;
  String image;
  String description;
  String productSelling;
  int rating;
  int ratingCount;
  int ratingTotal;
  int soldCount;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    imagePath: json["imagePath"],
    id: json["id"],
    storeId: json["storeId"],
    categoryId: json["categoryId"],
    subCategoryId: json["subCategoryId"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    productSelling: json["productSelling"],
    rating: json["rating"],
    ratingCount: json["ratingCount"],
    ratingTotal: json["ratingTotal"],
    soldCount: json["soldCount"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "imagePath": imagePath,
    "id": id,
    "storeId": storeId,
    "categoryId": categoryId,
    "subCategoryId": subCategoryId,
    "name": name,
    "image": image,
    "description": description,
    "productSelling": productSelling,
    "rating": rating,
    "ratingCount": ratingCount,
    "ratingTotal": ratingTotal,
    "soldCount": soldCount,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}

class Store {
  Store({
    required this.imagePath,
    required this.coordinates,
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.provinceId,
    required this.cityId,
    required this.subdistrictId,
    required this.postalCode,
    required this.latitude,
    required this.longitude,
    required this.geometry,
    required this.ownerId,
    required this.rating,
    required this.ratingCount,
    required this.ratingTotal,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.owner,
  });

  String imagePath;
  Coordinates coordinates;
  int id;
  String name;
  String image;
  String address;
  int provinceId;
  int cityId;
  int subdistrictId;
  String postalCode;
  int latitude;
  int longitude;
  Geometry geometry;
  int ownerId;
  int rating;
  int ratingCount;
  int ratingTotal;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Owner owner;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    imagePath: json["imagePath"],
    coordinates: Coordinates.fromJson(json["coordinates"]),
    id: json["id"],
    name: json["name"],
    image: json["image"],
    address: json["address"],
    provinceId: json["provinceId"],
    cityId: json["cityId"],
    subdistrictId: json["subdistrictId"],
    postalCode: json["postalCode"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    geometry: Geometry.fromJson(json["geometry"]),
    ownerId: json["ownerId"],
    rating: json["rating"],
    ratingCount: json["ratingCount"],
    ratingTotal: json["ratingTotal"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    owner: Owner.fromJson(json["owner"]),
  );

  Map<String, dynamic> toJson() => {
    "imagePath": imagePath,
    "coordinates": coordinates.toJson(),
    "id": id,
    "name": name,
    "image": image,
    "address": address,
    "provinceId": provinceId,
    "cityId": cityId,
    "subdistrictId": subdistrictId,
    "postalCode": postalCode,
    "latitude": latitude,
    "longitude": longitude,
    "geometry": geometry.toJson(),
    "ownerId": ownerId,
    "rating": rating,
    "ratingCount": ratingCount,
    "ratingTotal": ratingTotal,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
    "owner": owner.toJson(),
  };
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  int latitude;
  int longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<int> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: json["type"],
    coordinates: List<int>.from(json["coordinates"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class Owner {
  Owner({
    required this.imagePath,
    required this.id,
    required this.nik,
    required this.name,
    required this.image,
    required this.email,
    required this.phoneNumber,
    required this.birthdate,
    required this.cityId,
    required this.provinceId,
    required this.subdistrictId,
    required this.address,
    required this.membertype,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  String imagePath;
  int id;
  String nik;
  String name;
  String image;
  String email;
  String phoneNumber;
  DateTime birthdate;
  dynamic cityId;
  dynamic provinceId;
  dynamic subdistrictId;
  String address;
  String membertype;
  dynamic role;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    imagePath: json["imagePath"],
    id: json["id"],
    nik: json["nik"],
    name: json["name"],
    image: json["image"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    birthdate: DateTime.parse(json["birthdate"]),
    cityId: json["cityId"],
    provinceId: json["provinceId"],
    subdistrictId: json["subdistrictId"],
    address: json["address"],
    membertype: json["membertype"],
    role: json["role"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "imagePath": imagePath,
    "id": id,
    "nik": nik,
    "name": name,
    "image": image,
    "email": email,
    "phoneNumber": phoneNumber,
    "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "cityId": cityId,
    "provinceId": provinceId,
    "subdistrictId": subdistrictId,
    "address": address,
    "membertype": membertype,
    "role": role,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}