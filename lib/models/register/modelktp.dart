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
  String? status;
  Message? message;

  Data({this.status, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class Message {
  String? name;
  String? id;
  String? pob;
  String? dob;
  String? gender;
  String? address;
  String? rt;
  String? rw;
  String? village;
  String? district;
  String? religion;
  String? maritalStatus;
  String? work;
  String? nationnality;
  String? city;
  String? province;

  Message(
      {this.name,
      this.id,
      this.pob,
      this.dob,
      this.gender,
      this.address,
      this.rt,
      this.rw,
      this.village,
      this.district,
      this.religion,
      this.maritalStatus,
      this.work,
      this.nationnality,
      this.city,
      this.province});

  Message.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    pob = json['pob'];
    dob = json['dob'];
    gender = json['gender'];
    address = json['address'];
    rt = json['rt'];
    rw = json['rw'];
    village = json['village'];
    district = json['district'];
    religion = json['religion'];
    maritalStatus = json['marital_status'];
    work = json['work'];
    nationnality = json['nationnality'];
    city = json['city'];
    province = json['province'];
  }

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
