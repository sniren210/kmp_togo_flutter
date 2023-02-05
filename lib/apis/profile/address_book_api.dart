import 'package:dio/dio.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/models/address/addressBook.dart';

class AddressBookApi with ApiMachine {
  final _dio = Helper().dio;

  Future<ItemModelUserAddressBook> fetchMyAddress() async {
    try {
      final res = await _dio.get('/v1/user/address');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      return ItemModelUserAddressBook.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> addUpdateAddressBook(
      id,
      name,
      contactName,
      phoneNumber,
      detailAddress,
      provinceId,
      cityId,
      subdistrictId,
      postalCode,
      isUpdate) async {
    try {
      Map<String, dynamic> data = {
        "name": name,
        "contactName": contactName,
        "phoneNumber": phoneNumber,
        "detailAddress": detailAddress,
        "provinceId": provinceId,
        "cityId": cityId,
        "subdistrictId": subdistrictId,
        "postalCode": postalCode,
      };

      Response res;

      if (isUpdate) {
        res = await _dio.patch(
          '/v1/user/address/$id',
          data: data,
        );

        await saveResponsePatch(res.requestOptions.path, res.statusMessage,
            res.data.toString(), data.toString());

        return ItemModelAddressSuccess.fromJson(res.data);
      } else {
        res = await _dio.post(
          '/v1/user/address',
          data: data,
        );

        await saveResponsePost(res.requestOptions.path, res.statusMessage,
            res.data.toString(), data.toString());

        return ItemModelAddressBookAdd.fromJson(res.data);
      }
    } on DioError catch (e) {
      try {
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan');

        // Get.offAllNamed('/home');

        throw Exception(e.toString());
      } catch (e) {
        throw Exception(e.toString());
      }
    }
  }
}
