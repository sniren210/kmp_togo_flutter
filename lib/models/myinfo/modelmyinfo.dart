class ModelMyInfo {
  Data? data;

  ModelMyInfo({this.data});

  ModelMyInfo.fromJson(Map<String, dynamic> json) {
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
  String? imagePath;
  int? id;
  String? nik;
  String? name;
  String? image;
  String? email;
  String? phoneNumber;
  String? birthdate;
  Null cityId;
  Null provinceId;
  Null subdistrictId;
  String? address;
  String? membertype;
  Null role;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  TokenWallet? tokenWallet;
  CoinWallet? coinWallet;

  Data(
      {this.imagePath,
      this.id,
      this.nik,
      this.name,
      this.image,
      this.email,
      this.phoneNumber,
      this.birthdate,
      this.cityId,
      this.provinceId,
      this.subdistrictId,
      this.address,
      this.membertype,
      this.role,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.tokenWallet,
      this.coinWallet});

  Data.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    id = json['id'];
    nik = json['nik'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    birthdate = json['birthdate'];
    cityId = json['cityId'];
    provinceId = json['provinceId'];
    subdistrictId = json['subdistrictId'];
    address = json['address'];
    membertype = json['membertype'];
    role = json['role'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    tokenWallet = json['tokenWallet'] != null
        ? TokenWallet.fromJson(json['tokenWallet'])
        : null;
    coinWallet = json['coinWallet'] != null
        ? CoinWallet.fromJson(json['coinWallet'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imagePath'] = imagePath;
    data['id'] = id;
    data['nik'] = nik;
    data['name'] = name;
    data['image'] = image;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['birthdate'] = birthdate;
    data['cityId'] = cityId;
    data['provinceId'] = provinceId;
    data['subdistrictId'] = subdistrictId;
    data['address'] = address;
    data['membertype'] = membertype;
    data['role'] = role;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (tokenWallet != null) {
      data['tokenWallet'] = tokenWallet!.toJson();
    }
    if (coinWallet != null) {
      data['coinWallet'] = coinWallet!.toJson();
    }
    return data;
  }
}

class TokenWallet {
  int? id;
  int? userId;
  double? token;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;

  TokenWallet(
      {this.id,
      this.userId,
      this.token,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  TokenWallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    token = json['token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['token'] = token;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class CoinWallet {
  int? id;
  int? userId;
  double? coin;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;

  CoinWallet(
      {this.id,
      this.userId,
      this.coin,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  CoinWallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    coin = json['coin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['coin'] = coin;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
