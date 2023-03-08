import 'package:dio/dio.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/models/privacy_policy_model.dart';
import 'package:kmp_togo_mobile/models/settings/privacyPolicy_model.dart';

class PrivacyPolicyApi with ApiMachine {
  final _dio = Helper().dio;

  Future<PrivacyPolicyModel> fetchPrivacyPolicy(String subUrl) async {
    try {
      final res = await _dio.get('/api/v1/$subUrl');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      return PrivacyPolicyModel.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}

final privacyPolicyApi = PrivacyPolicyApi();
