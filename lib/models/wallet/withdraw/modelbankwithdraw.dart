class ModelBankWithdraw {
  List<Data>? data;

  ModelBankWithdraw({this.data});

  ModelBankWithdraw.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  ModelBankWithdraw.dummy() {
    ModelBankWithdraw(
      data: [
        Data(
          id: 0,
          userId: 0,
          name: 'name',
          number: 'number',
          createdAt: '2011-11-02T02:50:12.208Z',
          updatedAt: '2011-11-02T02:50:12.208Z',
          deletedAt: null,
        )
      ],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? name;
  String? number;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.number,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    number = json['number'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    data['number'] = number;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
