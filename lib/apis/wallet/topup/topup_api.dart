import 'package:dio/dio.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/models/wallet/topup/coin_model.dart';
import 'package:kmp_togo_mobile/models/wallet/topup/topup_model.dart';

class TopUpApi with ApiMachine {
  final _dio = Helper().dio;

  Future<ItemModelTopup> fetchTopUp() async {
    try {
      final res = await _dio.get('/v1/wallet/topup');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      return ItemModelTopup.fromJson(res.data);
    } on DioError catch (e) {
      await customSnackbar(
          type: 'error', title: 'error', text: e.response!.data.toString());

      Get.offAllNamed('/home');
      throw Exception(e.toString());
    }
  }

  Future<ItemModelCoinPriceInq> fetchCoinPriceInq() async {
    try {
      final res = await _dio.get('/v1/wallet/transaction/inquiry');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      return ItemModelCoinPriceInq.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ItemModelBuyCoin> buyCoin(double coin, pinValue) async {
    try {
      Map<String, dynamic> data = {
        "coin": coin,
      };

      final res = await _dio.post('/v1/wallet/buycoin', data: data);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), data.toString());

      return ItemModelBuyCoin.fromJson(res.data);
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

  Future<ItemModelSellCoin> sellCoin(double coin, pinValue) async {
    try {
      Map<String, dynamic> data = {
        "coin": coin,
      };

      final res = await _dio.post('/v1/wallet/sellcoin', data: data);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), data.toString());

      return ItemModelSellCoin.fromJson(res.data);
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
