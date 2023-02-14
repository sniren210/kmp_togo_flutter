

import 'dart:convert';

ItemModelProductInquiry itemModelBuyProductDFromJson(String str) => ItemModelProductInquiry.fromJson(json.decode(str));

String itemModelBuyProductDToJson(ItemModelProductInquiry data) => json.encode(data.toJson());

class ItemModelProductInquiry {
  ItemModelProductInquiry({
    required this.data,
  });

  Data data;

  factory ItemModelProductInquiry.fromJson(Map<String, dynamic> json) => ItemModelProductInquiry(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.orders,
    required this.miscellaneous,
    required this.discount,
    required this.subtotal,
    required this.gasefee,
    required this.admfee,
    required this.total,
  });

  List<Order> orders;
  int? miscellaneous;
  int discount;
  int subtotal;
  double gasefee;
  int admfee;
  double total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
    miscellaneous: json["miscellaneous"] ?? 0,
    discount: json["discount"],
    subtotal: json["subtotal"],
    gasefee: json["gasefee"].toDouble(),
    admfee: json["admfee"].toInt(),
    total: json["total"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    "miscellaneous": miscellaneous,
    "discount": discount,
    "subtotal": subtotal,
    "gasefee": gasefee,
    "admfee": admfee,
    "total": total,
  };
}

class Order {
  Order({
    required this.sku,
    required this.storeId,
    required this.shippingTotal,
    required this.subTotalOrderDetail,
    required this.totalOrderDetail,
    required this.notes,
  });

  List<Sku> sku;
  int storeId;
  int shippingTotal;
  int subTotalOrderDetail;
  int totalOrderDetail;
  String notes;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    sku: List<Sku>.from(json["sku"].map((x) => Sku.fromJson(x))),
    storeId: json["storeId"],
    shippingTotal: json["shippingTotal"],
    subTotalOrderDetail: json["subTotalOrderDetail"],
    totalOrderDetail: json["totalOrderDetail"],
    notes: json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "sku": List<dynamic>.from(sku.map((x) => x.toJson())),
    "storeId": storeId,
    "shippingTotal": shippingTotal,
    "subTotalOrderDetail": subTotalOrderDetail,
    "totalOrderDetail": totalOrderDetail,
    "notes": notes,
  };
}

class Sku {
  Sku({
    required this.skuId,
    required this.qty,
    required this.price,
    required this.weight,
    required this.totalSkuPrice,
  });

  int skuId;
  int qty;
  int price;
  int weight;
  int totalSkuPrice;

  factory Sku.fromJson(Map<String, dynamic> json) => Sku(
    skuId: json["skuId"],
    qty: json["qty"],
    price: json["price"],
    weight: json["weight"],
    totalSkuPrice: json["totalSkuPrice"],
  );

  Map<String, dynamic> toJson() => {
    "skuId": skuId,
    "qty": qty,
    "price": price,
    "weight": weight,
    "totalSkuPrice": totalSkuPrice,
  };
}