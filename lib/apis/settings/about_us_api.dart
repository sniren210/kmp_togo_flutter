import 'package:dio/dio.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/models/settings/aboutUs_model.dart';

class AboutUsApi with ApiMachine {
  final _dio = Helper().dio;

  Future<ItemModelAboutUs> fetchAboutUs() async {
    try {
      final res = await _dio.get('/v1/app/aboutus');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      return ItemModelAboutUs.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}

final aboutUsApi = AboutUsApi();