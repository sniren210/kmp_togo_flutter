class ModelSku {
  int? price;
  int? weight;

  ModelSku({this.price, this.weight});

  ModelSku.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['weight'] = this.weight;
    return data;
  }
}
