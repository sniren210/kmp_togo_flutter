class ModelApiText {
  Data? data;

  ModelApiText({this.data});

  ModelApiText.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  ModelApiText dummy() {
    return ModelApiText(
      data: Data(
        imagePath: 'https://i.imgur.com/NO25iZV.png',
        key: '0',
        value: 'example',
        image: 'https://i.imgur.com/NO25iZV.png',
      ),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imagePath'] = imagePath;
    data['key'] = key;
    data['value'] = value;
    data['image'] = image;
    return data;
  }
}
