class ModelProvinsi {
  List<DataProvinsi>? data;

  ModelProvinsi({this.data});

  ModelProvinsi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataProvinsi>[];
      json['data'].forEach((v) {
        data!.add(DataProvinsi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataProvinsi {
  String? provinceId;
  String? province;

  DataProvinsi({this.provinceId, this.province});

  DataProvinsi.fromJson(Map<String, dynamic> json) {
    provinceId = json['province_id'];
    province = json['province'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['province_id'] = provinceId;
    data['province'] = province;
    return data;
  }
}
