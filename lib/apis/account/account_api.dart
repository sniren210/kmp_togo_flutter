import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/models/account/accountInfo.dart';
import 'package:kmp_togo_mobile/models/account/login_info.dart';
import 'package:kmp_togo_mobile/providers/database/database.dart';

class AccountApi with ApiMachine {
  final _dio = Helper().dio;

  Future<DataUser> fetchAccountInfo() async {
    final SharedPreferencesManager sharedPreferencesManager =
        locator<SharedPreferencesManager>();
    try {
      final db = await databaseApp.getResponse();
      final res = LoginInfo.fromJson(jsonDecode(
              db.firstWhere((element) => element.path == 'login').responseBody))
          .data;

      sharedPreferencesManager.setInt(
          SharedPreferencesManager.userId, res.user.id);

      return res;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DataUser> updateAccountInfo() async {
    try {
      final db = await databaseApp.getResponse();
      final dataDb = jsonDecode(
          db.firstWhere((element) => element.path == 'login').responseBody);

      final res = await _dio.get('/api/v1/user');

      final dataRes = LoginInfo.fromJson(res.data);

      dataDb['data']['user'] = res.data['data']['user'];

      await databaseApp.insertResponseAPI(ResponseFromAPIData(
        method: 'GET',
        status: res.statusMessage ?? '',
        path: 'login',
        responseBody: jsonEncode(dataDb),
      ));

      sharedPreferencesManager.setInt(
          SharedPreferencesManager.userId, dataRes.data.user.id);

      return dataRes.data;
    } catch (e) {
      final db = await databaseApp.getResponse();
      final res = LoginInfo.fromJson(jsonDecode(
              db.firstWhere((element) => element.path == 'login').responseBody))
          .data;

      sharedPreferencesManager.setInt(
          SharedPreferencesManager.userId, res.user.id);

      return res;
    }
  }
}
