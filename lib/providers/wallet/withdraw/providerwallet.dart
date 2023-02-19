import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/models/response/error/model_error.dart';
import 'package:kmp_togo_mobile/models/wallet/historywallet/historysaldowallet.dart';
import 'package:kmp_togo_mobile/models/wallet/withdraw/modelbankwithdraw.dart';
import 'package:kmp_togo_mobile/pages/wallet/withdraw/withdrawsuccess.dart';

class ProviderWithDraw with ChangeNotifier, ApiMachine {
  final _dio = Helper().dio;
  ModelBankWithdraw? dataToken;
  ModelBankWithdraw? dataMybank;
  ModelHistorySaldoWallet? dataCoin;
  ModelHistorySaldoWallet? dataHistorySaldo;
  bool loading = false;
  bool loadinggetBank = false;
  bool loadingaddbank = false;
  bool loadinghistory = false;
  int? id;

  getTokenWallet() async {
    try {
      final res = await _dio.post('/api/v1/wallet/check-token');
      print(res.data);
      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());
      if (res.data != null) {
        dataToken = ModelBankWithdraw.fromJson(res.data);
        // dataToken = ModelBankWithdraw.dummy();
        // print(dataToken);
        // print('${dataToken.data?.first.id}');
        // id = dataToken.data?.first.id;
        loadinggetBank = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      if (kDebugMode) rethrow;
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
        loadinggetBank = false;
        notifyListeners();
      } catch (e) {
        loading = false;
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        notifyListeners();
        loadinggetBank = false;
        rethrow;
      }
    } catch (e) {
      loadinggetBank = false;
      rethrow;
    }
  }

  getCoinWallet() async {
    try {
      final res = await _dio.post('/api/v1/wallet/check-coin');
      print(res.data);
      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());
      if (res.data != null) {
        dataCoin = ModelHistorySaldoWallet.fromJson(res.data);
        // dataToken = ModelBankWithdraw.dummy();
        // print(dataToken);
        // print('${dataToken.data?.first.id}');
        // id = dataToken.data?.first.id;
        loadinggetBank = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      if (kDebugMode) rethrow;
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
        loadinggetBank = false;
        notifyListeners();
      } catch (e) {
        final msg = e.toString();
        print(msg);
        loading = false;
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        notifyListeners();
        loadinggetBank = false;
      }
    } catch (e) {
      loadinggetBank = false;
      rethrow;
    }
  }

  getNomorbank() async {
    try {
      // final res = await _dio.post('/api/v1/wallet/check-token');
      // print(res.data);
      // await saveResponseGet(
      //     res.requestOptions.path, res.statusMessage, res.data.toString());
      // if (res.data != null) {
      //   dataToken = ModelBankWithdraw.fromJson(res.data);
      dataHistorySaldo = ModelHistorySaldoWallet().dummy();
      //   print(dataToken);
      //   print('${dataToken.data?.first.id}');
      //   id = dataToken.data?.first.id;
      //   loadinggetBank = false;
      //   notifyListeners();
      // }
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
        loadinggetBank = false;
        notifyListeners();
      } catch (e) {
        final msg = e.toString();
        print(msg);
        loading = false;
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        notifyListeners();
        loadinggetBank = false;
      }
    } catch (e) {
      print(e);
      loadinggetBank = false;
    }

    // }
  }

  addnomorBank(context, String nama, String number) async {
    try {
      final dataA = {"name": nama, "number": number};
      final res = await _dio.post('/v1/bankaccount', data: dataA);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), dataA.toString());

      loadingaddbank = false;
      print(res.data);
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
        loadinggetBank = false;
        notifyListeners();
        // return Fluttertoast.showToast(
        //     msg: data.error.toString(),
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      } catch (e) {
        final msg = e.toString();
        print(msg);
        loading = false;
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        notifyListeners();
        loadinggetBank = false;
        // return Fluttertoast.showToast(
        //     msg: 'Terjadi kesalahan!',
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      }
    } catch (e) {
      print(e);
      loadinggetBank = false;
    }

    // }
  }

  sendwithdraw(context, int? amount, int? nomor, String? pinAA) async {
    // int? idA = int.parse(id!);
    try {
      // await getNomorbank();

      final body = {"bankAccountId": nomor, "amount": amount};
      print(body);
      final res = await _dio.post(
        '/v1/withdraw',
        data: body,
        options: Options(
          headers: {
            "pin": pinAA,
          },
        ),
      );

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), body.toString());

      if (res.data['data'] == 'success') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WithDraawSuccess()));
        loading = false;
        notifyListeners();
      } else {}
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
        loading = false;
        notifyListeners();
        // return Fluttertoast.showToast(
        //     msg: data.error.toString(),
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      } catch (e) {
        final msg = e.toString();
        print(msg);
        loading = false;
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        notifyListeners();
        loading = false;
        // return Fluttertoast.showToast(
        //     msg: 'Terjadi kesalahan!',
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.red,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
      }
    } catch (e) {
      print(e);
    }
  }

  getHistorySaldoWallet(context) async {
    try {
      final res = await _dio.get('/v1/wallet/transaction/token');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      // dataHistorySaldo = ModelHistorySaldoWallet.fromJson(res.data);
      dataCoin = ModelHistorySaldoWallet().dummy();

      loadinggetBank = false;
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
        loadinghistory = false;
        notifyListeners();
      } catch (e) {
        final msg = e.toString();
        print(msg);
        loadinghistory = false;
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        notifyListeners();
        loadinggetBank = false;
      } catch (e) {
        print(e);
        loadinghistory = false;
      }

      // }
    }
  }
}
