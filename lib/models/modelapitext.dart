class ModelApiText {
  Data? data;

  ModelApiText({this.data});

  ModelApiText.fromJson(Map<String, dynamic> json) {
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
  String? imagePath;
  String? key;
  String? value;
  String? image;

  Data({this.imagePath, this.key, this.value, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    key = json['key'];
    value = json['value'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['key'] = this.key;
    data['value'] = this.value;
    data['image'] = this.image;
    return data;
  }
}
