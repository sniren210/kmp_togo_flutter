// To parse this JSON data, do
//
//     final itemModelUserAddressBook = itemModelUserAddressBookFromJson(jsonString);

import 'dart:convert';

ItemModelUserAddressBook itemModelUserAddressBookFromJson(String str) =>
    ItemModelUserAddressBook.fromJson(json.decode(str));

String itemModelUserAddressBookToJson(ItemModelUserAddressBook data) =>
    json.encode(data.toJson());

class ItemModelUserAddressBook {
  ItemModelUserAddressBook({
    required this.data,
  });

  List<DatumAddressBook> data;

  factory ItemModelUserAddressBook.fromJson(Map<String, dynamic> json) =>
      ItemModelUserAddressBook(
        data: List<DatumAddressBook>.from(
            json["data"].map((x) => DatumAddressBook.fromJson(x))),
      );

  factory ItemModelUserAddressBook.dummy() => ItemModelUserAddressBook(
        data: [
          DatumAddressBook(
            coordinates: Coordinates(latitude: '0', longitude: '0'),
            id: 0,
            userId: 0,
            name: 'name,',
            contactName: 'contactName,',
            phoneNumber: 'phoneNumber,',
            detailAddress: 'detailAddress,',
            provinceId: 0,
            cityId: 0,
            subdistrictId: 0,
            postalCode: 'postalCode,',
            latitude: '0',
            longitude: '0',
            geometry: '',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            deletedAt: '',
            province: Province(id: 0, name: 'provinsi'),
            city: City(
              id: 0,
              name: 'name',
              provinceId: 0,
              province: 'province',
              type: 'type',
              postalCode: 'postalCode',
            ),
            subdistrict: Subdistrict(
              id: 0,
              name: 'name',
              type: 'type',
              cityId: 0,
              city: 'city',
              provinceId: 0,
              province: 'province',
            ),
          )
        ],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

ItemModelAddressBookAdd itemModelAddressBookAddFromJson(String str) =>
    ItemModelAddressBookAdd.fromJson(json.decode(str));

String itemModelAddressBookAddToJson(ItemModelAddressBookAdd data) =>
    json.encode(data.toJson());

class ItemModelAddressBookAdd {
  ItemModelAddressBookAdd({
    required this.data,
  });

  final DatumAddressBookAdd data;

  factory ItemModelAddressBookAdd.fromJson(Map<String, dynamic> json) =>
      ItemModelAddressBookAdd(
        data: DatumAddressBookAdd.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DatumAddressBook {
  DatumAddressBook({
    required this.coordinates,
    required this.id,
    required this.userId,
    required this.name,
    required this.contactName,
    required this.phoneNumber,
    required this.detailAddress,
    required this.provinceId,
    required this.cityId,
    required this.subdistrictId,
    required this.postalCode,
    required this.latitude,
    required this.longitude,
    required this.geometry,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.province,
    required this.city,
    required this.subdistrict,
  });

  Coordinates coordinates;
  int id;
  int userId;
  String name;
  String contactName;
  String phoneNumber;
  String detailAddress;
  int provinceId;
  int cityId;
  int subdistrictId;
  String postalCode;
  dynamic latitude;
  dynamic longitude;
  dynamic geometry;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Province province;
  City city;
  Subdistrict subdistrict;

  factory DatumAddressBook.fromJson(Map<String, dynamic> json) =>
      DatumAddressBook(
        coordinates: Coordinates.fromJson(json["coordinates"]),
        id: json["id"],
        userId: json["userId"],
        name: json["name"],
        contactName: json["contactName"],
        phoneNumber: json["phoneNumber"],
        detailAddress: json["detailAddress"],
        provinceId: json["provinceId"],
        cityId: json["cityId"],
        subdistrictId: json["subdistrictId"],
        postalCode: json["postalCode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        geometry: json["geometry"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        province: Province.fromJson(json["province"]),
        city: City.fromJson(json["city"]),
        subdistrict: Subdistrict.fromJson(json["subdistrict"]),
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates.toJson(),
        "id": id,
        "userId": userId,
        "name": name,
        "contactName": contactName,
        "phoneNumber": phoneNumber,
        "detailAddress": detailAddress,
        "provinceId": provinceId,
        "cityId": cityId,
        "subdistrictId": subdistrictId,
        "postalCode": postalCode,
        "latitude": latitude,
        "longitude": longitude,
        "geometry": geometry,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "province": province.toJson(),
        "city": city.toJson(),
        "subdistrict": subdistrict.toJson(),
      };
}

class DatumAddressBookAdd {
  DatumAddressBookAdd({
    required this.coordinates,
    required this.latitude,
    required this.longitude,
    required this.geometry,
    required this.id,
    required this.userId,
    required this.name,
    required this.contactName,
    required this.phoneNumber,
    required this.detailAddress,
    required this.provinceId,
    required this.cityId,
    required this.subdistrictId,
    required this.postalCode,
    required this.updatedAt,
    required this.createdAt,
  });

  final Coordinates coordinates;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic geometry;
  final int id;
  final int userId;
  final String name;
  final String contactName;
  final String phoneNumber;
  final String detailAddress;
  final int provinceId;
  final int cityId;
  final int subdistrictId;
  final String postalCode;
  final DateTime updatedAt;
  final DateTime createdAt;

  factory DatumAddressBookAdd.fromJson(Map<String, dynamic> json) =>
      DatumAddressBookAdd(
        coordinates: Coordinates.fromJson(json["coordinates"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
        geometry: json["geometry"],
        id: json["id"],
        userId: json["userId"],
        name: json["name"] ?? '',
        contactName: json["contactName"] ?? '',
        phoneNumber: json["phoneNumber"] ?? '',
        detailAddress: json["detailAddress"],
        provinceId: json["provinceId"],
        cityId: json["cityId"],
        subdistrictId: json["subdistrictId"],
        postalCode: json["postalCode"] ?? '',
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates.toJson(),
        "latitude": latitude,
        "longitude": longitude,
        "geometry": geometry,
        "id": id,
        "userId": userId,
        "name": name,
        "contactName": contactName,
        "phoneNumber": phoneNumber,
        "detailAddress": detailAddress,
        "provinceId": provinceId,
        "cityId": cityId,
        "subdistrictId": subdistrictId,
        "postalCode": postalCode,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class City {
  City({
    required this.id,
    required this.name,
    required this.provinceId,
    required this.province,
    required this.type,
    required this.postalCode,
  });

  int id;
  String name;
  int provinceId;
  String province;
  String type;
  String postalCode;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        provinceId: json["provinceId"],
        province: json["province"],
        type: json["type"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "provinceId": provinceId,
        "province": province,
        "type": type,
        "postal_code": postalCode,
      };
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  dynamic latitude;
  dynamic longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class ItemModelAddressSuccess {
  ItemModelAddressSuccess({
    required this.data,
  });

  final String data;

  factory ItemModelAddressSuccess.fromJson(Map<String, dynamic> json) =>
      ItemModelAddressSuccess(
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
      };
}

class Province {
  Province({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Subdistrict {
  Subdistrict({
    required this.id,
    required this.name,
    required this.type,
    required this.cityId,
    required this.city,
    required this.provinceId,
    required this.province,
  });

  int id;
  String name;
  String type;
  int cityId;
  String city;
  int provinceId;
  String province;

  factory Subdistrict.fromJson(Map<String, dynamic> json) => Subdistrict(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        cityId: json["cityId"],
        city: json["city"],
        provinceId: json["provinceId"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "cityId": cityId,
        "city": city,
        "provinceId": provinceId,
        "province": province,
      };
}
