import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/models/account/accountInfo.dart';
import 'package:kmp_togo_mobile/models/address/addressBook.dart';
import 'package:kmp_togo_mobile/models/base_model.dart';
import 'package:kmp_togo_mobile/models/member_model.dart';

class ProviderAddressBook with ChangeNotifier implements BaseModel {
  final Repository _repo;
  bool _busy = false;
  ItemModelUserAddressBook? _items;
  ItemModelAddressBookAdd? _items2;
  ItemModelAddressSuccess? _items3;

  ProviderAddressBook(this._repo);

  final _streamController = StreamController<ItemModelUserAddressBook>();
  Stream<ItemModelUserAddressBook> get catPhotoStream {
    return _streamController.stream;
  }

  Future<ItemModelUserAddressBook> fetchAddressBook() async {
    setBusy(true);
    var success = await _repo.fetchMyAddress();
    _items = success;

    setBusy(false);
    return success;
  }

  Future<dynamic> addUpdateAddressBook(
      id,
      name,
      contactName,
      phoneNumber,
      detailAddress,
      provinceId,
      cityId,
      subdistrictId,
      postalCode,
      isUpdate) async {
    setBusy(true);
    var success = await _repo.addUpdateAddressBook(
        id,
        name,
        contactName,
        phoneNumber,
        detailAddress,
        provinceId,
        cityId,
        subdistrictId,
        postalCode,
        isUpdate);
    if (isUpdate) {
      _items3 = success;
    } else {
      _items2 = success;
    }

    setBusy(false);
    return success;
  }

  @override
  bool get busy => _busy;
  ItemModelUserAddressBook? get items => _items;
  ItemModelAddressBookAdd? get items2 => _items2;
  ItemModelAddressSuccess? get items3 => _items3;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
