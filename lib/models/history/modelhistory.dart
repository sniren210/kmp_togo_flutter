class ModelHistory {
  List<Data>? data;
  Meta? meta;

  ModelHistory({this.data, this.meta});

  ModelHistory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  ModelHistory dummy() {
    return ModelHistory(
      data: [
        Data(
          id: '',
          userId: 0,
          total: 0,
          status: '',
          ppobTransactionId: '',
          productOrderId: 0,
          nftTransactionId: 0,
          createdAt: '',
          updatedAt: '',
          deletedAt: '2011-11-02T02:50:12.208Z',
          productOrder: ProductOrder(
              // int? id,
              // int? userId,
              // int? subTotal,
              // dynamic gasFee,
              // dynamic admFee,
              // int? miscellaneous,
              // int? discount,
              // dynamic total,
              // String? status,
              // int? tokenTransactionId,
              // String? createdAt,
              // String? updatedAt,
              // dynamic deletedAt,
              // List<Orders>? orders,
              ),
          // PpobTransaction? ppobTransaction,
          // NftTransaction? nftTransaction,
        )
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
  String? id;
  int? userId;
  dynamic total;
  String? status;
  String? ppobTransactionId;
  int? productOrderId;
  int? nftTransactionId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
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
        ? ProductOrder.fromJson(json['productOrder'])
        : null;
    ppobTransaction = json['ppobTransaction'] != null
        ? PpobTransaction.fromJson(json['ppobTransaction'])
        : null;
    nftTransaction = json['nftTransaction'] != null
        ? NftTransaction.fromJson(json['nftTransaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['total'] = total;
    data['status'] = status;
    data['ppobTransactionId'] = ppobTransactionId;
    data['productOrderId'] = productOrderId;
    data['nftTransactionId'] = nftTransactionId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (productOrder != null) {
      data['productOrder'] = productOrder!.toJson();
    }
    if (ppobTransaction != null) {
      data['ppobTransaction'] = ppobTransaction!.toJson();
    }
    if (nftTransaction != null) {
      data['nftTransaction'] = nftTransaction!.toJson();
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
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['subTotal'] = subTotal;
    data['gasFee'] = gasFee;
    data['admFee'] = admFee;
    data['miscellaneous'] = miscellaneous;
    data['discount'] = discount;
    data['total'] = total;
    data['status'] = status;
    data['tokenTransactionId'] = tokenTransactionId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
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
        orderItems!.add(OrderItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['productOrderId'] = productOrderId;
    data['storeId'] = storeId;
    data['shippingId'] = shippingId;
    data['subTotal'] = subTotal;
    data['shippingTotal'] = shippingTotal;
    data['miscellaneous'] = miscellaneous;
    data['discount'] = discount;
    data['total'] = total;
    data['notes'] = notes;
    data['storeNotes'] = storeNotes;
    data['status'] = status;
    data['expireIn'] = expireIn;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (orderItems != null) {
      data['orderItems'] = orderItems!.map((v) => v.toJson()).toList();
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
    sku = json['sku'] != null ? Sku.fromJson(json['sku']) : null;
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productOrderId'] = productOrderId;
    data['productOrderDetailId'] = productOrderDetailId;
    data['productId'] = productId;
    data['skuId'] = skuId;
    data['qty'] = qty;
    data['price'] = price;
    data['total'] = total;
    data['isCanceled'] = isCanceled;
    data['ratingId'] = ratingId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (sku != null) {
      data['sku'] = sku!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
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
    ppobType =
        json['ppobType'] != null ? PpobType.fromJson(json['ppobType']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['productCode'] = productCode;
    data['ppobTypeId'] = ppobTypeId;
    data['ppobMobileOperatorId'] = ppobMobileOperatorId;
    data['refId'] = refId;
    data['customerId'] = customerId;
    data['message'] = message;
    data['sn'] = sn;
    data['pin'] = pin;
    data['subTotal'] = subTotal;
    data['gasFee'] = gasFee;
    data['admFee'] = admFee;
    data['total'] = total;
    data['tokenTransactionId'] = tokenTransactionId;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (ppobType != null) {
      data['ppobType'] = ppobType!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['name'] = name;
    data['postpaid'] = postpaid;
    data['margin'] = margin;
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
        json['nftunit'] != null ? Nftunit.fromJson(json['nftunit']) : null;
    nft = json['nft'] != null ? Nft.fromJson(json['nft']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nftSerialId'] = nftSerialId;
    data['nftId'] = nftId;
    data['priceCoin'] = priceCoin;
    data['priceToken'] = priceToken;
    data['gasFee'] = gasFee;
    data['admFee'] = admFee;
    data['priceCoinTotal'] = priceCoinTotal;
    data['userId'] = userId;
    data['transaction'] = transaction;
    data['coinTransactionId'] = coinTransactionId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (nftunit != null) {
      data['nftunit'] = nftunit!.toJson();
    }
    if (nft != null) {
      data['nft'] = nft!.toJson();
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
