class ModelKecamatan {
  List<DataKecamatan>? data;

  ModelKecamatan({this.data});

  ModelKecamatan.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataKecamatan>[];
      json['data'].forEach((v) {
        data!.add(new DataKecamatan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataKecamatan {
  String? subdistrictId;
  String? provinceId;
  String? province;
  String? cityId;
  String? city;
  String? type;
  String? subdistrictName;

  DataKecamatan(
      {this.subdistrictId,
      this.provinceId,
      this.province,
      this.cityId,
      this.city,
      this.type,
      this.subdistrictName});

  DataKecamatan.fromJson(Map<String, dynamic> json) {
    subdistrictId = json['subdistrict_id'];
    provinceId = json['province_id'];
    province = json['province'];
    cityId = json['city_id'];
    city = json['city'];
    type = json['type'];
    subdistrictName = json['subdistrict_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subdistrict_id'] = this.subdistrictId;
    data['province_id'] = this.provinceId;
    data['province'] = this.province;
    data['city_id'] = this.cityId;
    data['city'] = this.city;
    data['type'] = this.type;
    data['subdistrict_name'] = this.subdistrictName;
    return data;
  }
}
