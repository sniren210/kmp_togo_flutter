class ModelKtpData {
  Data? data;

  ModelKtpData({this.data});

  ModelKtpData.fromJson(Map<String, dynamic> json) {
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
  String? status;
  Message? message;

  Data({this.status, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['pob'] = this.pob;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['rt'] = this.rt;
    data['rw'] = this.rw;
    data['village'] = this.village;
    data['district'] = this.district;
    data['religion'] = this.religion;
    data['marital_status'] = this.maritalStatus;
    data['work'] = this.work;
    data['nationnality'] = this.nationnality;
    data['city'] = this.city;
    data['province'] = this.province;
    return data;
  }
}
