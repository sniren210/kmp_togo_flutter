import 'package:dio/dio.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/models/settings/privacyPolicy_model.dart';

class PrivacyPolicyApi with ApiMachine {
  final _dio = Helper().dio;

  Future<ItemModelPrivacyPolicy> fetchPrivacyPolicy() async {
    try {
      final res = await _dio.get('/v1/app/privacy');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      return ItemModelPrivacyPolicy.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}

final privacyPolicyApi = PrivacyPolicyApi();