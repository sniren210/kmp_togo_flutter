import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/models/base_model.dart';
import 'package:kmp_togo_mobile/models/member_model.dart';

class ProviderMemberType with ChangeNotifier implements BaseModel {
  final Repository _authenticationService;
  bool _busy = false;
  ItemModelMemberType? _items;

  ProviderMemberType(this._authenticationService);

  final _streamController = StreamController<ItemModelMemberType>();
  Stream<ItemModelMemberType> get catPhotoStream {
    return _streamController.stream;
  }

  Future<ItemModelMemberType> fetchAllMemberType() async {
    setBusy(true);
    var success = await _authenticationService.fetchAllMemberType();
    _items = success;

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  ItemModelMemberType? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
