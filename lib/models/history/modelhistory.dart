class ModelHistory {
  List<Data>? data;
  Meta? meta;

  ModelHistory({this.data, this.meta});

  ModelHistory.fromJson(Map<String, dynamic> json) {
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
  String? id;
  int? userId;
  dynamic total;
  String? status;
  String? ppobTransactionId;
  int? productOrderId;
  int? nftTransactionId;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
  ProductOrder? productOrder;
  PpobTransaction? ppobTransaction;
  NftTransaction? nftTransaction;

  Data(
      {this.id,
      this.userId,
      this.total,
      this.status,
      this.ppobTransactionId,
      this.productOrderId,
      this.nftTransactionId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.productOrder,
      this.ppobTransaction,
      this.nftTransaction});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    total = json['total'];
    status = json['status'];
    ppobTransactionId = json['ppobTransactionId'];
    productOrderId = json['productOrderId'];
    nftTransactionId = json['nftTransactionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    productOrder = json['productOrder'] != null
        ? new ProductOrder.fromJson(json['productOrder'])
        : null;
    ppobTransaction = json['ppobTransaction'] != null
        ? new PpobTransaction.fromJson(json['ppobTransaction'])
        : null;
    nftTransaction = json['nftTransaction'] != null
        ? new NftTransaction.fromJson(json['nftTransaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['total'] = this.total;
    data['status'] = this.status;
    data['ppobTransactionId'] = this.ppobTransactionId;
    data['productOrderId'] = this.productOrderId;
    data['nftTransactionId'] = this.nftTransactionId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.productOrder != null) {
      data['productOrder'] = this.productOrder!.toJson();
    }
    if (this.ppobTransaction != null) {
      data['ppobTransaction'] = this.ppobTransaction!.toJson();
    }
    if (this.nftTransaction != null) {
      data['nftTransaction'] = this.nftTransaction!.toJson();
    }
    return data;
  }
}

class ProductOrder {
  int? id;
  int? userId;
  int? subTotal;
  dynamic gasFee;
  dynamic admFee;
  int? miscellaneous;
  int? discount;
  dynamic total;
  String? status;
  int? tokenTransactionId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Orders>? orders;

  ProductOrder(
      {this.id,
      this.userId,
      this.subTotal,
      this.gasFee,
      this.admFee,
      this.miscellaneous,
      this.discount,
      this.total,
      this.status,
      this.tokenTransactionId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.orders});

  ProductOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    subTotal = json['subTotal'];
    gasFee = json['gasFee'];
    admFee = json['admFee'];
    miscellaneous = json['miscellaneous'];
    discount = json['discount'];
    total = json['total'];
    status = json['status'];
    tokenTransactionId = json['tokenTransactionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['subTotal'] = this.subTotal;
    data['gasFee'] = this.gasFee;
    data['admFee'] = this.admFee;
    data['miscellaneous'] = this.miscellaneous;
    data['discount'] = this.discount;
    data['total'] = this.total;
    data['status'] = this.status;
    data['tokenTransactionId'] = this.tokenTransactionId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String? id;
  int? userId;
  int? productOrderId;
  int? storeId;
  dynamic shippingId;
  int? subTotal;
  int? shippingTotal;
  int? miscellaneous;
  int? discount;
  int? total;
  String? notes;
  dynamic storeNotes;
  String? status;
  dynamic expireIn;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<OrderItems>? orderItems;

  Orders(
      {this.id,
      this.userId,
      this.productOrderId,
      this.storeId,
      this.shippingId,
      this.subTotal,
      this.shippingTotal,
      this.miscellaneous,
      this.discount,
      this.total,
      this.notes,
      this.storeNotes,
      this.status,
      this.expireIn,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.orderItems});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    productOrderId = json['productOrderId'];
    storeId = json['storeId'];
    shippingId = json['shippingId'];
    subTotal = json['subTotal'];
    shippingTotal = json['shippingTotal'];
    miscellaneous = json['miscellaneous'];
    discount = json['discount'];
    total = json['total'];
    notes = json['notes'];
    storeNotes = json['storeNotes'];
    status = json['status'];
    expireIn = json['expireIn'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    if (json['orderItems'] != null) {
      orderItems = <OrderItems>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['productOrderId'] = this.productOrderId;
    data['storeId'] = this.storeId;
    data['shippingId'] = this.shippingId;
    data['subTotal'] = this.subTotal;
    data['shippingTotal'] = this.shippingTotal;
    data['miscellaneous'] = this.miscellaneous;
    data['discount'] = this.discount;
    data['total'] = this.total;
    data['notes'] = this.notes;
    data['storeNotes'] = this.storeNotes;
    data['status'] = this.status;
    data['expireIn'] = this.expireIn;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.orderItems != null) {
      data['orderItems'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  int? id;
  int? productOrderId;
  String? productOrderDetailId;
  int? productId;
  int? skuId;
  int? qty;
  int? price;
  int? total;
  bool? isCanceled;
  dynamic ratingId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Sku? sku;
  Product? product;

  OrderItems(
      {this.id,
      this.productOrderId,
      this.productOrderDetailId,
      this.productId,
      this.skuId,
      this.qty,
      this.price,
      this.total,
      this.isCanceled,
      this.ratingId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.sku,
      this.product});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productOrderId = json['productOrderId'];
    productOrderDetailId = json['productOrderDetailId'];
    productId = json['productId'];
    skuId = json['skuId'];
    qty = json['qty'];
    price = json['price'];
    total = json['total'];
    isCanceled = json['isCanceled'];
    ratingId = json['ratingId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    sku = json['sku'] != null ? new Sku.fromJson(json['sku']) : null;
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productOrderId'] = this.productOrderId;
    data['productOrderDetailId'] = this.productOrderDetailId;
    data['productId'] = this.productId;
    data['skuId'] = this.skuId;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['total'] = this.total;
    data['isCanceled'] = this.isCanceled;
    data['ratingId'] = this.ratingId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.sku != null) {
      data['sku'] = this.sku!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
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

class Product {
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

  Product(
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
      this.deletedAt});

  Product.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class PpobTransaction {
  String? id;
  int? userId;
  String? productCode;
  String? ppobTypeId;
  String? ppobMobileOperatorId;
  String? refId;
  String? customerId;
  dynamic message;
  dynamic sn;
  dynamic pin;
  int? subTotal;
  dynamic gasFee;
  int? admFee;
  dynamic total;
  int? tokenTransactionId;
  String? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  PpobType? ppobType;

  PpobTransaction(
      {this.id,
      this.userId,
      this.productCode,
      this.ppobTypeId,
      this.ppobMobileOperatorId,
      this.refId,
      this.customerId,
      this.message,
      this.sn,
      this.pin,
      this.subTotal,
      this.gasFee,
      this.admFee,
      this.total,
      this.tokenTransactionId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.ppobType});

  PpobTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    productCode = json['productCode'];
    ppobTypeId = json['ppobTypeId'];
    ppobMobileOperatorId = json['ppobMobileOperatorId'];
    refId = json['refId'];
    customerId = json['customerId'];
    message = json['message'];
    sn = json['sn'];
    pin = json['pin'];
    subTotal = json['subTotal'];
    gasFee = json['gasFee'];
    admFee = json['admFee'];
    total = json['total'];
    tokenTransactionId = json['tokenTransactionId'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    ppobType = json['ppobType'] != null
        ? new PpobType.fromJson(json['ppobType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['productCode'] = this.productCode;
    data['ppobTypeId'] = this.ppobTypeId;
    data['ppobMobileOperatorId'] = this.ppobMobileOperatorId;
    data['refId'] = this.refId;
    data['customerId'] = this.customerId;
    data['message'] = this.message;
    data['sn'] = this.sn;
    data['pin'] = this.pin;
    data['subTotal'] = this.subTotal;
    data['gasFee'] = this.gasFee;
    data['admFee'] = this.admFee;
    data['total'] = this.total;
    data['tokenTransactionId'] = this.tokenTransactionId;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.ppobType != null) {
      data['ppobType'] = this.ppobType!.toJson();
    }
    return data;
  }
}

class PpobType {
  int? id;
  String? key;
  String? name;
  bool? postpaid;
  dynamic margin;

  PpobType({this.id, this.key, this.name, this.postpaid, this.margin});

  PpobType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    name = json['name'];
    postpaid = json['postpaid'];
    margin = json['margin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['name'] = this.name;
    data['postpaid'] = this.postpaid;
    data['margin'] = this.margin;
    return data;
  }
}

class NftTransaction {
  int? id;
  String? nftSerialId;
  String? nftId;
  dynamic priceCoin;
  int? priceToken;
  dynamic gasFee;
  dynamic admFee;
  dynamic priceCoinTotal;
  int? userId;
  String? transaction;
  int? coinTransactionId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Nftunit? nftunit;
  Nft? nft;

  NftTransaction(
      {this.id,
      this.nftSerialId,
      this.nftId,
      this.priceCoin,
      this.priceToken,
      this.gasFee,
      this.admFee,
      this.priceCoinTotal,
      this.userId,
      this.transaction,
      this.coinTransactionId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.nftunit,
      this.nft});

  NftTransaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nftSerialId = json['nftSerialId'];
    nftId = json['nftId'];
    priceCoin = json['priceCoin'];
    priceToken = json['priceToken'];
    gasFee = json['gasFee'];
    admFee = json['admFee'];
    priceCoinTotal = json['priceCoinTotal'];
    userId = json['userId'];
    transaction = json['transaction'];
    coinTransactionId = json['coinTransactionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    nftunit =
        json['nftunit'] != null ? new Nftunit.fromJson(json['nftunit']) : null;
    nft = json['nft'] != null ? new Nft.fromJson(json['nft']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nftSerialId'] = this.nftSerialId;
    data['nftId'] = this.nftId;
    data['priceCoin'] = this.priceCoin;
    data['priceToken'] = this.priceToken;
    data['gasFee'] = this.gasFee;
    data['admFee'] = this.admFee;
    data['priceCoinTotal'] = this.priceCoinTotal;
    data['userId'] = this.userId;
    data['transaction'] = this.transaction;
    data['coinTransactionId'] = this.coinTransactionId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.nftunit != null) {
      data['nftunit'] = this.nftunit!.toJson();
    }
    if (this.nft != null) {
      data['nft'] = this.nft!.toJson();
    }
    return data;
  }
}

class Nftunit {
  String? nftSerialId;
  String? nftId;
  int? ownerId;
  int? priceToken;
  int? sharePercentage;
  int? monthlyPercentage;
  dynamic holdLimitTill;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Nftunit(
      {this.nftSerialId,
      this.nftId,
      this.ownerId,
      this.priceToken,
      this.sharePercentage,
      this.monthlyPercentage,
      this.holdLimitTill,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Nftunit.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Nft {
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
  dynamic expirationDate;
  int? qtyUnit;
  int? avlUnit;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Nft(
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
      this.deletedAt});

  Nft.fromJson(Map<String, dynamic> json) {
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
