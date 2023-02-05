class ModelSku {
  int? price;
  int? weight;

  ModelSku({this.price, this.weight});

  ModelSku.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['weight'] = weight;
    return data;
  }
}
