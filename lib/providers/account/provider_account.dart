import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/models/account/accountInfo.dart';
import 'package:kmp_togo_mobile/models/account/login_info.dart';
import 'package:kmp_togo_mobile/models/base_model.dart';
import 'package:kmp_togo_mobile/models/member_model.dart';

class ProviderAccountInfo with ChangeNotifier implements BaseModel {
  final _dio = Helper().dio;
  final Repository _authenticationService;
  bool _busy = false;
  DataUser? _items;

  ProviderAccountInfo(this._authenticationService);

  final _streamController = StreamController<DataUser>();
  Stream<DataUser> get catPhotoStream {
    return _streamController.stream;
  }

  Future<DataUser> fetchAccountInfo() async {
    setBusy(true);

    var success = await _authenticationService.fetchAccountInfo();
    _items = success;

    sharedPreferencesManager.setInt('ownerId', success.user.id);

    setBusy(false);
    return success;
  }

  Future<DataUser> updateAccountInfo() async {
    setBusy(true);

    var success = await _authenticationService.updateAccountInfo();
    _items = success;

    sharedPreferencesManager.setInt('ownerId', success.user.id);

    setBusy(false);
    return success;
  }

  Future<bool> editRekening(String noRek) async {
    print(noRek);
    final res = await _dio.post(
      '/api/v1/rekening',
      data: {
        'account_bank_account': noRek,
      },
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
      ),
    );

    if (res.data['success'] == true) {
      final dataRes = LoginInfo.fromJson(res.data).data;

      _items = dataRes;
      notifyListeners();

      return true;
    } else {
      return false;
    }
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  DataUser? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
