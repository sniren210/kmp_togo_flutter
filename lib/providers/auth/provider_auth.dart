import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/models/account/login_info.dart';
import 'package:kmp_togo_mobile/models/response/error/model_error.dart';
import 'package:kmp_togo_mobile/pages/auth/login/changepasswordpages.dart';
import 'package:kmp_togo_mobile/pages/auth/login/loginPages.dart';
import 'package:kmp_togo_mobile/providers/database/database.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../models/myinfo/modelinforegister.dart';
import '../../pages/auth/register/payments/registerPaymentsProcess.dart';

class ProviderAuthLogin with ChangeNotifier, ApiMachine {
  final _dio = Helper().dio;
  LoginInfo? dataMyinfo;
  bool loading = false;
  bool loadingLupaPassword = false;
  bool loadingLupaPasswordA = false;
  bool statususpen = false;
  bool statusbanned = false;
  String? time = '';
  login(context, username, password) async {
    try {
      final body = {
        "email": username,
        "password": password,
      };
      final res = await _dio.post('/api/v1/login', data: body);
      print(res.data);

      if (res.data['success'] == true) {
        dataMyinfo = LoginInfo.fromJson(res.data);

        await databaseApp.insertResponseAPI(ResponseFromAPIData(
          method: 'GET',
          status: res.statusMessage ?? '',
          path: 'login',
          responseBody: jsonEncode(res.data),
        ));

        if (dataMyinfo?.data.user.status == 'ACTIVE') {
          await sharedPreferencesManager.setBool(
              SharedPreferencesManager.isLoggedIn, true);
          Get.offAllNamed('/home');
          loading = false;
        } else {
          loading = false;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PaymentProcess(
                      isTopup: false,
                      popContext: 1,
                      isRegister: true,
                      // tipeAnggota: membertypeanggota,
                      tipeAnggotaId: dataMyinfo?.data.user.status)));
        }
      } else {}
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
        if (data.meta?.suspend == false && data.meta!.nexttry != null) {
          statususpen = true;
          print('a');
          notifyListeners();
        } else if (data.meta?.suspend == true) {
          statususpen = false;
          statusbanned = true;
          print('b');
          notifyListeners();
        }
      } catch (e) {
        final msg = e.toString();
        print(msg);
        loading = false;
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
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

  kirimotpresetPass(
    context,
    String? phoneNumber,
  ) async {
    String numberA = '+62$phoneNumber';
    print(numberA);
    try {
      final body = {"phoneNumber": numberA};
      final res = await _dio.post('/v1/recovery/password', data: body);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), body.toString());

      if (res.data['success'] == true) {
        loadingLupaPassword = false;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChangePasswordPages(
                    number: numberA,
                  )),
        );
        await customSnackbar(
            type: 'success', title: 'success', text: 'Berhasil Terkirim');
      } else {
        loadingLupaPassword = false;
        await customSnackbar(
            type: 'success', title: 'error', text: 'Terjadi kesalahan!');
      }
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
        if (data.meta?.suspend == false && data.meta!.nexttry != null) {
          statususpen = true;
          print('a');
          notifyListeners();
        } else if (data.meta?.suspend == true) {
          statususpen = false;
          statusbanned = true;
          print('b');
          notifyListeners();
        }
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

  changePass(context, String? phoneNumber, String? password,
      String? tokenRecovery) async {
    print(phoneNumber);
    try {
      final body = {
        "phoneNumber": phoneNumber,
        "password": password,
        "recoveryToken": tokenRecovery
      };
      final res = await _dio.patch('/v1/recovery/password', data: body);

      await saveResponsePatch(res.requestOptions.path, res.statusMessage,
          res.data.toString(), body.toString());

      if (res.data['data'] == 'success') {
        loadingLupaPasswordA = false;

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPages()),
            (Route<dynamic> route) => false);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => LoginPages()),
        // );
        await customSnackbar(
            type: 'success', title: 'success', text: 'Berhasil');
      } else {
        loadingLupaPasswordA = false;
        await customSnackbar(
            type: 'success', title: 'error', text: 'Terjadi kesalahan!');
      }
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
        if (data.meta?.suspend == false && data.meta!.nexttry != null) {
          statususpen = true;
          print('a');
          notifyListeners();
        } else if (data.meta?.suspend == true) {
          statususpen = false;
          statusbanned = true;
          print('b');
          notifyListeners();
        }
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
}

class ProviderAuthChangePIN with ChangeNotifier, ApiMachine {
  final _dio = Helper().dio;
  bool loading = false;

  changePIN(oldpassword, newpassword) async {
    try {
      final body = {"oldpassword": oldpassword, "newpassword": newpassword};

      final res = await _dio.patch('/v1/user/password', data: body);

      await saveResponsePatch(res.requestOptions.path, res.statusMessage,
          res.data.toString(), body.toString());

      if (res.data['data']['message'] == 'success') {
        Get.offAllNamed('/home');
        loading = false;
      }
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        loading = false;
        await customSnackbar(type: 'error', title: 'error', text: e.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
