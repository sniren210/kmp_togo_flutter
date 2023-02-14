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
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.role,
    required this.currentMember,
  });

  int id;
  String name;
  String email;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String status;
  String role;
  CurrentMember currentMember;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        role: 'konsumen1',
        currentMember: CurrentMember.fromJson(json["current_member"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
        "role": role,
        "current_member": currentMember.toJson(),
      };
}

class CurrentMember {
  CurrentMember({
    required this.id,
    required this.userId,
    required this.memberId,
    this.nik,
    required this.name,
    this.logo,
    this.phoneNumber,
    this.address,
    this.birthDate,
    this.birthPlace,
    this.pin,
    this.accountNumber,
    this.otherBank,
    this.walletAddress,
    this.walletStringify,
    this.walletPasswrod,
    required this.status,
    this.meta,
    this.expiresAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String memberId;
  dynamic nik;
  String name;
  dynamic logo;
  dynamic phoneNumber;
  dynamic address;
  dynamic birthDate;
  dynamic birthPlace;
  dynamic pin;
  dynamic accountNumber;
  dynamic otherBank;
  dynamic walletAddress;
  dynamic walletStringify;
  dynamic walletPasswrod;
  String status;
  dynamic meta;
  dynamic expiresAt;
  dynamic createdAt;
  dynamic updatedAt;

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
        accountNumber: json["account_number"],
        otherBank: json["other_bank"],
        walletAddress: json["wallet_address"],
        walletStringify: json["wallet_stringify"],
        walletPasswrod: json["wallet_passwrod"],
        status: json["status"],
        meta: json["meta"],
        expiresAt: json["expires_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
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
        "account_number": accountNumber,
        "other_bank": otherBank,
        "wallet_address": walletAddress,
        "wallet_stringify": walletStringify,
        "wallet_passwrod": walletPasswrod,
        "status": status,
        "meta": meta,
        "expires_at": expiresAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
