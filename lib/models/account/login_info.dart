// To parse this JSON data, do
//
//     final loginInfo = loginInfoFromJson(jsonString);

import 'dart:convert';

LoginInfo loginInfoFromJson(String str) => LoginInfo.fromJson(json.decode(str));

String loginInfoToJson(LoginInfo data) => json.encode(data.toJson());

class LoginInfo {
  LoginInfo({
    required this.status,
    required this.success,
    required this.data,
  });

  int status;
  bool success;
  DataUser data;

  factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
        status: json["status"],
        success: json["success"],
        data: DataUser.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": data.toJson(),
      };
}

class DataUser {
  DataUser({
    required this.message,
    required this.user,
    required this.token,
  });

  String message;
  User user;
  String token;

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    this.referral,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.status,
    required this.roles,
    required this.currentMember,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  dynamic referral;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String? status;
  List<Role> roles;
  CurrentMember currentMember;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        referral: json["referral"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        status: json["status"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        currentMember: CurrentMember.fromJson(json["current_member"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "referral": referral,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "status": status,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "current_member": currentMember.toJson(),
      };
}

class CurrentMember {
  CurrentMember({
    required this.id,
    required this.userId,
    required this.memberId,
    required this.nik,
    required this.name,
    this.logo,
    required this.phoneNumber,
    required this.address,
    required this.birthDate,
    required this.birthPlace,
    required this.pin,
    this.virtualAccount,
    this.accountNumber,
    this.otherBank,
    required this.walletAddress,
    required this.walletStringify,
    required this.walletPasswrod,
    required this.status,
    required this.meta,
    this.vaNumber,
    this.expiresAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int id;
  int userId;
  String memberId;
  String? nik;
  String name;
  dynamic logo;
  String? phoneNumber;
  String? address;
  String? birthDate;
  String? birthPlace;
  String? pin;
  dynamic virtualAccount;
  dynamic accountNumber;
  dynamic otherBank;
  String? walletAddress;
  WalletStringify? walletStringify;
  String? walletPasswrod;
  String status;
  Meta? meta;
  dynamic vaNumber;
  dynamic expiresAt;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory CurrentMember.fromJson(Map<String, dynamic> json) => CurrentMember(
        id: json["id"],
        userId: json["user_id"],
        memberId: json["member_id"],
        nik: json["nik"],
        name: json["name"],
        logo: json["logo"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        birthDate: json["birth_date"],
        birthPlace: json["birth_place"],
        pin: json["pin"],
        virtualAccount: json["virtual_account"],
        accountNumber: json["account_number"],
        otherBank: json["other_bank"],
        walletAddress: json["wallet_address"],
        walletStringify: json["wallet_stringify"] == null
            ? null
            : WalletStringify.fromJson(json["wallet_stringify"]),
        walletPasswrod: json["wallet_passwrod"],
        status: json["status"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        vaNumber: json["va_number"],
        expiresAt: json["expires_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "member_id": memberId,
        "nik": nik,
        "name": name,
        "logo": logo,
        "phone_number": phoneNumber,
        "address": address,
        "birth_date": birthDate,
        "birth_place": birthPlace,
        "pin": pin,
        "virtual_account": virtualAccount,
        "account_number": accountNumber,
        "other_bank": otherBank,
        "wallet_address": walletAddress,
        "wallet_stringify": walletStringify!.toJson(),
        "wallet_passwrod": walletPasswrod,
        "status": status,
        "meta": meta!.toJson(),
        "va_number": vaNumber,
        "expires_at": expiresAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}

class Meta {
  Meta({
    required this.ktp,
  });

  Ktp ktp;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        ktp: Ktp.fromJson(json["ktp"]),
      );

  Map<String, dynamic> toJson() => {
        "ktp": ktp.toJson(),
      };
}

class Ktp {
  Ktp({
    required this.name,
    required this.nik,
    required this.birthPlace,
    required this.birthDate,
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
    required this.province,
  });

  String name;
  String nik;
  String birthPlace;
  String birthDate;
  String gender;
  String address;
  String rt;
  String rw;
  String village;
  String district;
  String religion;
  String maritalStatus;
  String work;
  String nationnality;
  String city;
  String province;

  factory Ktp.fromJson(Map<String, dynamic> json) => Ktp(
        name: json["name"],
        nik: json["nik"],
        birthPlace: json["birth_place"],
        birthDate: json["birth_date"],
        gender: json["gender"],
        address: json["address"],
        rt: json["rt"],
        rw: json["rw"],
        village: json["village"],
        district: json["district"],
        religion: json["religion"],
        maritalStatus: json["marital_status"],
        work: json["work"],
        nationnality: json["nationnality"],
        city: json["city"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "nik": nik,
        "birth_place": birthPlace,
        "birth_date": birthDate,
        "gender": gender,
        "address": address,
        "rt": rt,
        "rw": rw,
        "village": village,
        "district": district,
        "religion": religion,
        "marital_status": maritalStatus,
        "work": work,
        "nationnality": nationnality,
        "city": city,
        "province": province,
      };
}

class WalletStringify {
  WalletStringify({
    required this.account,
    required this.wallet,
    required this.keystore,
    required this.network,
  });

  Account account;
  Wallet wallet;
  Keystore keystore;
  Network network;

  factory WalletStringify.fromJson(Map<String, dynamic> json) =>
      WalletStringify(
        account: Account.fromJson(json["account"]),
        wallet: Wallet.fromJson(json["wallet"]),
        keystore: Keystore.fromJson(json["keystore"]),
        network: Network.fromJson(json["network"]),
      );

  Map<String, dynamic> toJson() => {
        "account": account.toJson(),
        "wallet": wallet.toJson(),
        "keystore": keystore.toJson(),
        "network": network.toJson(),
      };
}

class Account {
  Account({
    required this.address,
    required this.privateKey,
  });

  String address;
  String privateKey;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        address: json["address"],
        privateKey: json["privateKey"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "privateKey": privateKey,
      };
}

class Keystore {
  Keystore({
    required this.version,
    required this.id,
    required this.address,
    required this.crypto,
  });

  int version;
  String id;
  String address;
  Crypto crypto;

  factory Keystore.fromJson(Map<String, dynamic> json) => Keystore(
        version: json["version"],
        id: json["id"],
        address: json["address"],
        crypto: Crypto.fromJson(json["crypto"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "id": id,
        "address": address,
        "crypto": crypto.toJson(),
      };
}

class Crypto {
  Crypto({
    required this.ciphertext,
    required this.cipherparams,
    required this.cipher,
    required this.kdf,
    required this.kdfparams,
    required this.mac,
  });

  String ciphertext;
  Cipherparams cipherparams;
  String cipher;
  String kdf;
  Kdfparams kdfparams;
  String mac;

  factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        ciphertext: json["ciphertext"],
        cipherparams: Cipherparams.fromJson(json["cipherparams"]),
        cipher: json["cipher"],
        kdf: json["kdf"],
        kdfparams: Kdfparams.fromJson(json["kdfparams"]),
        mac: json["mac"],
      );

  Map<String, dynamic> toJson() => {
        "ciphertext": ciphertext,
        "cipherparams": cipherparams.toJson(),
        "cipher": cipher,
        "kdf": kdf,
        "kdfparams": kdfparams.toJson(),
        "mac": mac,
      };
}

class Cipherparams {
  Cipherparams({
    required this.iv,
  });

  String iv;

  factory Cipherparams.fromJson(Map<String, dynamic> json) => Cipherparams(
        iv: json["iv"],
      );

  Map<String, dynamic> toJson() => {
        "iv": iv,
      };
}

class Kdfparams {
  Kdfparams({
    required this.dklen,
    required this.salt,
    required this.n,
    required this.r,
    required this.p,
  });

  int dklen;
  String salt;
  int n;
  int r;
  int p;

  factory Kdfparams.fromJson(Map<String, dynamic> json) => Kdfparams(
        dklen: json["dklen"],
        salt: json["salt"],
        n: json["n"],
        r: json["r"],
        p: json["p"],
      );

  Map<String, dynamic> toJson() => {
        "dklen": dklen,
        "salt": salt,
        "n": n,
        "r": r,
        "p": p,
      };
}

class Network {
  Network({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Wallet {
  Wallet({
    required this.address,
    required this.privateKey,
    required this.index,
  });

  String address;
  String privateKey;
  int index;

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        address: json["address"],
        privateKey: json["privateKey"],
        index: json["index"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "privateKey": privateKey,
        "index": index,
      };
}

class Role {
  Role({
    required this.id,
    required this.name,
    required this.guardName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  int id;
  String name;
  String guardName;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        guardName: json["guard_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "guard_name": guardName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    required this.modelId,
    required this.roleId,
    required this.modelType,
  });

  int modelId;
  int roleId;
  String modelType;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        modelId: json["model_id"],
        roleId: json["role_id"],
        modelType: json["model_type"],
      );

  Map<String, dynamic> toJson() => {
        "model_id": modelId,
        "role_id": roleId,
        "model_type": modelType,
      };
}
