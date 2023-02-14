import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/models/account/accountInfo.dart';
import 'package:kmp_togo_mobile/models/account/login_info.dart';
import 'package:kmp_togo_mobile/models/base_model.dart';
import 'package:kmp_togo_mobile/models/member_model.dart';

class ProviderAccountInfo with ChangeNotifier implements BaseModel {
  final Repository _authenticationService;
  bool _busy = false;
  User? _items;

  ProviderAccountInfo(this._authenticationService);

  final _streamController = StreamController<User>();
  Stream<User> get catPhotoStream {
    return _streamController.stream;
  }

  Future<User> fetchAccountInfo() async {
    setBusy(true);

    var success = await _authenticationService.fetchAccountInfo();
    _items = success;

    sharedPreferencesManager.setInt('ownerId', success.id);

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  User? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
