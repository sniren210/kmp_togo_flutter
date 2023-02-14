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
}
