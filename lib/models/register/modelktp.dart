class ModelKtpData {
  Data? data;

  ModelKtpData({this.data});

  ModelKtpData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
  final String name;
  final String id;
  final String pob;
  final String dob;
  final String gender;
  final String address;
  final String rt;
  final String rw;
  final String village;
  final String district;
  final String religion;
  final String maritalStatus;
  final String work;
  final String nationnality;
  final String city;
  final String province;

  Data(
      {required this.name,
      required this.id,
      required this.pob,
      required this.dob,
      required this.gender,
      required this.address,
      required this.rt,
      required this.rw,
      required this.village,
      required this.district,
      required this.religion,
      required this.maritalStatus,
      required this.work,
      required this.nationnality,
      required this.city,
      required this.province});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json['name'],
        id: json['id'],
        pob: json['pob'],
        dob: json['dob'],
        gender: json['gender'],
        address: json['address'],
        rt: json['rt'],
        rw: json['rw'],
        village: json['village'],
        district: json['district'],
        religion: json['religion'],
        maritalStatus: json['marital_status'],
        work: json['work'],
        nationnality: json['nationnality'],
        city: json['city'],
        province: json['province'],
      );
  // {
  //   name = json['name'];
  //   id = json['id'];
  //   pob = json['pob'];
  //   dob = json['dob'];
  //   gender = json['gender'];
  //   address = json['address'];
  //   rt = json['rt'];
  //   rw = json['rw'];
  //   village = json['village'];
  //   district = json['district'];
  //   religion = json['religion'];
  //   maritalStatus = json['marital_status'];
  //   work = json['work'];
  //   nationnality = json['nationnality'];
  //   city = json['city'];
  //   province = json['province'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['pob'] = pob;
    data['dob'] = dob;
    data['gender'] = gender;
    data['address'] = address;
    data['rt'] = rt;
    data['rw'] = rw;
    data['village'] = village;
    data['district'] = district;
    data['religion'] = religion;
    data['marital_status'] = maritalStatus;
    data['work'] = work;
    data['nationnality'] = nationnality;
    data['city'] = city;
    data['province'] = province;
    return data;
  }
}
