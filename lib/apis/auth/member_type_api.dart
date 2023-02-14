import 'package:dio/dio.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/models/member_model.dart';

class MemberTypeApi with ApiMachine {
  final _dio = Helper().dio;

  Future<ItemModelMemberType> fetchAllMemberType() async {
    try {
      final res = await _dio.get('/api/v1/get-role');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      return ItemModelMemberType.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
