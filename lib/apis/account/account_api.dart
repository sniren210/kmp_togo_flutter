import 'package:dio/dio.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/models/account/accountInfo.dart';

class AccountApi with ApiMachine {
  final _dio = Helper().dio;

  Future<ItemModelAccountInfo> fetchAccountInfo() async {
    final SharedPreferencesManager sharedPreferencesManager =
        locator<SharedPreferencesManager>();

    try {
      final res = await _dio.get('/v1/user/me');

      sharedPreferencesManager.setInt(
          SharedPreferencesManager.userId, res.data['data']['id']);

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());
      return ItemModelAccountInfo.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
