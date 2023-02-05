class ModelMyInfo {
  Data? data;

  ModelMyInfo({this.data});

  ModelMyInfo.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? nik;
  String? name;
  String? image;
  String? email;
  String? phoneNumber;
  String? birthdate;
  Null? cityId;
  Null? provinceId;
  Null? subdistrictId;
  String? address;
  String? membertype;
  Null? role;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
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
        ? new TokenWallet.fromJson(json['tokenWallet'])
        : null;
    coinWallet = json['coinWallet'] != null
        ? new CoinWallet.fromJson(json['coinWallet'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['id'] = this.id;
    data['nik'] = this.nik;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['birthdate'] = this.birthdate;
    data['cityId'] = this.cityId;
    data['provinceId'] = this.provinceId;
    data['subdistrictId'] = this.subdistrictId;
    data['address'] = this.address;
    data['membertype'] = this.membertype;
    data['role'] = this.role;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.tokenWallet != null) {
      data['tokenWallet'] = this.tokenWallet!.toJson();
    }
    if (this.coinWallet != null) {
      data['coinWallet'] = this.coinWallet!.toJson();
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
  Null? deletedAt;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['token'] = this.token;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}

class CoinWallet {
  int? id;
  int? userId;
  double? coin;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['coin'] = this.coin;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
