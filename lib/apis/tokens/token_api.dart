import 'package:dio/dio.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/models/ppob/postpaid/PostPaidType.dart';

class TokenApi with ApiMachine {
  final _dio = Helper().dio;

  Future<ItemModelPostPaidType> fetchAllPostPaidType() async {
    try {
      final res = await _dio.get('/v1/ppob/postpaid/type');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      return ItemModelPostPaidType.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
