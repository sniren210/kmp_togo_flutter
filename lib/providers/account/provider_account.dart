import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/models/account/accountInfo.dart';
import 'package:kmp_togo_mobile/models/base_model.dart';
import 'package:kmp_togo_mobile/models/member_model.dart';

class ProviderAccountInfo with ChangeNotifier implements BaseModel {
  final Repository _authenticationService;
  bool _busy = false;
  ItemModelAccountInfo? _items;

  ProviderAccountInfo(this._authenticationService);

  final _streamController = StreamController<ItemModelAccountInfo>();
  Stream<ItemModelAccountInfo> get catPhotoStream {
    return _streamController.stream;
  }

  Future<ItemModelAccountInfo> fetchAccountInfo() async {
    setBusy(true);
    var success = ItemModelAccountInfo(
        data: Data(
      imagePath: 'https://i.imgur.com/NO25iZV.png',
      id: 0,
      nik: '',
      name: 'exampple',
      image: '',
      email: '',
      phoneNumber: '',
      birthdate: '',
      cityId: '',
      provinceId: '',
      subdistrictId: '',
      address: '',
      membertype: '',
      role: '',
      status: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      deletedAt: '2011-11-02T02:50:12.208Z',
      tokenWallet: NWallet(
        id: 0,
        userId: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: '2011-11-02T02:50:12.208Z',
        token: 0.0,
      ),
      coinWallet: NWallet2(
        id: 0,
        userId: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: '2011-11-02T02:50:12.208Z',
        coin: 0.0,
      ),
    ));
    // var success = await _authenticationService.fetchAccountInfo();
    _items = success;

    sharedPreferencesManager.setInt('ownerId', success.data.id);

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  ItemModelAccountInfo? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
