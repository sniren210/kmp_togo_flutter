class ModelSelectMemberID {
  Data? data;

  ModelSelectMemberID({this.data});

  ModelSelectMemberID.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  int? price;
  String? description;
  Null? benefit;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Va? va;

  Data(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.benefit,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.va});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    benefit = json['benefit'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    va = json['va'] != null ? new Va.fromJson(json['va']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['benefit'] = this.benefit;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.va != null) {
      data['va'] = this.va!.toJson();
    }
    return data;
  }
}

class Va {
  int? id;
  String? vanumber;
  int? userId;
  bool? isOpenAmount;
  int? amount;
  String? expireAt;
  int? membertypeTransactionId;
  Null? deletedAt;
  String? name;

  Va(
      {this.id,
      this.vanumber,
      this.userId,
      this.isOpenAmount,
      this.amount,
      this.expireAt,
      this.membertypeTransactionId,
      this.deletedAt,
      this.name});

  Va.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vanumber = json['vanumber'];
    userId = json['userId'];
    isOpenAmount = json['isOpenAmount'];
    amount = json['amount'];
    expireAt = json['expireAt'];
    membertypeTransactionId = json['membertypeTransactionId'];
    deletedAt = json['deletedAt'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vanumber'] = this.vanumber;
    data['userId'] = this.userId;
    data['isOpenAmount'] = this.isOpenAmount;
    data['amount'] = this.amount;
    data['expireAt'] = this.expireAt;
    data['membertypeTransactionId'] = this.membertypeTransactionId;
    data['deletedAt'] = this.deletedAt;
    data['name'] = this.name;
    return data;
  }
}
