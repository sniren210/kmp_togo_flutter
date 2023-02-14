import 'package:dio/dio.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/models/ppob/PPOBCheckOut.dart';
import 'package:kmp_togo_mobile/models/ppob/postpaid/PostPaidInquery.dart';
import 'package:kmp_togo_mobile/models/ppob/postpaid/PostPaidInquery2.dart';
import 'package:kmp_togo_mobile/models/ppob/postpaid/PostPaidProduct.dart';
import 'package:kmp_togo_mobile/models/ppob/postpaid/PostPaidType.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidInqGameH.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidInqGameS.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidInqPLN.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidProduct.dart';

class PPOBPrePaidApi with ApiMachine {
  final _dio = Helper().dio;

  Future<ItemModelPrePaidProduct> fetchPrePaidProduct() async {
    try {
      final res = await _dio.post('/v1/ppob/prepaid/product/');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      return ItemModelPrePaidProduct.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ItemModelPrepaidPLN> prePaidInqueryPLN(String customerId) async {
    try {
      Map<String, dynamic> data = {
        "customer_id": customerId,
      };

    
      return ItemModelPrepaidPLN.dummy();
    } on DioError catch (e) {
      await customSnackbar(
          type: 'error', title: 'error', text: 'Terjadi kesalahan');

      throw Exception(e.toString());
    }
  }

  Future<ItemModelPrepaidGameH> prePaidInquiryGameHP(String gameCode) async {
    try {
      Map<String, dynamic> data = {
        "game_code": gameCode,
      };

      final res =
          await _dio.post('/v1/ppob/prepaid/inq-game-phone', data: data);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), data.toString());

      return ItemModelPrepaidGameH.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ItemModelPrepaidGameS> prePaidInquiryGameServer(
      String gameCode) async {
    try {
      Map<String, dynamic> data = {
        "game_code": gameCode,
      };

      final res =
          await _dio.post('/v1/ppob/prepaid/inq-game-server', data: data);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), data.toString());

      return ItemModelPrepaidGameS.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ItemModelPPOBCheckOut> prePaidCheckout(String tipe, String customerId,
      String operator, PrepaidProduct product, String pinValue) async {
    try {
      Map mapB = Map.from(product.toJson());

      mapB.removeWhere((key, value) => key == 'maxprice');

      Map<String, dynamic> data = {
        "customer_id": customerId,
        "tipe": tipe,
        "operator": operator,
        "product": mapB
      };

      final res = await _dio.post(
        '/v1/ppob/prepaid/checkout',
        data: data,
        options: Options(headers: await headersApi(pinValue)),
      );

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), data.toString());

      await customSnackbar(
          type: 'success', title: 'Success', text: 'Transaksi berhasil');

      return ItemModelPPOBCheckOut.fromJson(res.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.receiveTimeout) {
        await customSnackbar(
            type: 'warning',
            title: 'Pending',
            text: 'Transaksi kamu sedang diproses sistem');

        Get.offAllNamed('/home');
        throw Exception(e.toString());
      }
      await customSnackbar(
          type: 'error', title: 'error', text: 'Terjadi kesalahan');

      Get.offAllNamed('/home');

      throw Exception(e.toString());
    }
  }
}

class PPOBPostPaidApi with ApiMachine {
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

  Future<ItemModelPostPaidProduct> fetchPostPaidProduct(
      String productName) async {
    try {
      final res = await _dio.post('/v1/ppob/postpaid/product/$productName');

      await saveResponsePost(
          res.requestOptions.path, res.statusMessage, res.data.toString(), '');

      return ItemModelPostPaidProduct.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> postPaidInquiry(String code, String customerId) async {
    try {
      Map<String, dynamic> data = {
        "code": code,
        "customer_id": customerId,
      };

      final res = await _dio.post('/v1/ppob/postpaid/inquiry', data: data);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), data.toString());

      String responseCode = res.data['data']['response_code'];

      switch (checkStatusResponse(responseCode)) {
        case 'Success':
          if (code.contains('PDAM')) {
            return ItemModelPostPaidInquiry.fromJson(res.data);
          }
          return ItemModelPostPaidInquery2.fromJson(res.data);
        case 'Pending':
          return ItemModelPostPaidInquery2.fromJson01(res.data);
        case 'Failed':
          return ItemModelPostPaidInquery2.fromJson01(res.data);
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ItemModelPPOBCheckOut> postPaidCheckout(
      String code, String tipe, String customerId, String pinValue) async {
    try {
      Map<String, dynamic> data = {
        "code": code,
        "tipe": tipe,
        "customer_id": customerId,
      };

      final res = await _dio.post(
        '/v1/ppob/postpaid/checkout',
        data: data,
        options: Options(headers: await headersApi(pinValue)),
      );

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), data.toString());

      await customSnackbar(
          type: 'success', title: 'Success', text: 'Transaksi berhasil');

      return ItemModelPPOBCheckOut.fromJson(res.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.receiveTimeout) {
        await customSnackbar(
            type: 'warning',
            title: 'Pending',
            text: 'Transaksi kamu sedang diproses sistem');

        Get.offAllNamed('/home');
        throw Exception(e.toString());
      }
      await customSnackbar(
          type: 'error', title: 'error', text: 'Terjadi kesalahan');

      Get.offAllNamed('/home');

      throw Exception(e.toString());
    }
  }
}
