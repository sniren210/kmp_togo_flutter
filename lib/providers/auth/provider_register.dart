import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/models/modelkecamatan.dart';
import 'package:kmp_togo_mobile/models/modelkota.dart';
import 'package:kmp_togo_mobile/models/modelprovinsi.dart';
import 'package:kmp_togo_mobile/models/modeltipeanggota.dart';
import 'package:kmp_togo_mobile/models/myinfo/modelinforegister.dart';
import 'package:kmp_togo_mobile/models/register/modelktp.dart';
import 'package:kmp_togo_mobile/models/response/error/model_error.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerIdValidationPage.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerOtpPage.dart';
import 'package:kmp_togo_mobile/pages/common/takePictures.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/auth/registermemberid.dart';

import '../../pages/auth/register/payments/registerPaymentsProcess.dart';

class ProviderRegister with ChangeNotifier, ApiMachine {
  final _dio = Helper().dio;
  ModelProvinsi? dataProvinsi;
  ModelKota? dataKota;
  ModelKecamatan? dataKecamatan;
  ModelKtpData? dataktp;
  ModelTipeAnggota? dataTipeAnggota;
  ModelSelectMemberID? dataMemberID;
  ModelInfoRegister? dataMyinfo;
  bool? loadingOtp = false;
  bool? loadingKodeOtp = false;
  bool? loadingOcrKtp = false;
  bool? loadingRegister = false;
  bool? loadingmemberid = false;
  bool? loadinggetMyInfo = false;
  int countOtp = 0;

  setCountOtp(data) {
    countOtp = data;
    notifyListeners();
  }

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  request_otp(context, noHp, firstRequest) async {
    try {
      final res = await _dio.post(
        '/api/v1/get-otp',
        data: {'phone_number': firstRequest ? '0${noHp}' : noHp},
      );

      print(res.data);
      print(res.statusMessage);

      await saveResponsePost(
          res.requestOptions.path, res.statusMessage, res.data.toString(), '');

      if (res.data['success'] == true) {
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.nomerHP, '0$noHp');
        loadingOtp = false;

        if (firstRequest) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterOtpPage()),
          );
        }

        await customSnackbar(
            type: 'success',
            title: 'Success',
            text: 'Kode OTP berhasil dikirim');

        notifyListeners();
      } else {
        loadingOtp = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      await customSnackbar(
          type: 'error',
          title: 'error',
          text: kDebugMode
              ? e.message.toString()
              : 'Server sedang error mohon di coba lagi lain kali');
    }
  }

  validate_otp(context, noHp, String otpCode) async {
    try {
      final body = {"phone_number": noHp, "otp": otpCode};

      final res = await _dio.post('/api/v1/check-otp', data: body);
      print(res.data);
      if (res.data['success'] == true) {
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.otp, otpCode);
        loadingKodeOtp = false;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TakePicturePage(title: 'Unggah Foto KTP')),
        );
        notifyListeners();
      } else {
        loadingKodeOtp = false;
        notifyListeners();
      }

      print('body: ${res.data}');
    } on DioError catch (e) {
      try {
        if (countOtp > 2) {
          await customSnackbar(
              type: 'error',
              title: 'Maaf',
              text:
                  'Terlalu banyak kesalahan. Harap periksa kembali nomor handphone anda');
          Navigator.pop(context);
        } else {
          ErrorModel data = ErrorModel.fromJson(e.response!.data);
          await customSnackbar(
              type: 'error', title: 'error', text: data.error.toString());
        }
      } catch (e) {
        final msg = e.toString();
        print(msg);
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      }
    } catch (e) {
      print(e);
    }
  }

  validate_ocrktp(context, File image) async {
    try {
      // String fileName = images!.path.split('/').last;
      // FormData formData = FormData.fromMap({
      //   "img": await MultipartFile.fromFile(images.path, filename: fileName),
      // });
      // print('body: $formData');
      final res = await _dio.post('/api/v1/ktp-ocr',
          data: {'image': base64Encode(await image.readAsBytes())});

      await saveResponsePost(
          res.requestOptions.path, res.statusMessage, res.data.toString(), '');

      print(res.statusCode);

      print('res: ${res.data['data']}');
      if (res.data['success'] == true) {
        dataktp = ModelKtpData.fromJson(res.data);

        if (dataktp!.data!.id! != '' &&
            dataktp!.data!.name! != '' &&
            dataktp!.data!.dob! != '' &&
            dataktp!.data!.province! != '' &&
            dataktp!.data!.city! != '' &&
            dataktp!.data!.village! != '' &&
            dataktp!.data!.address! != '') {
          loadingKodeOtp = false;
          await sharedPreferencesManager.setString(
              SharedPreferencesManager.nomorKTP, dataktp?.data?.id ?? "");
          await sharedPreferencesManager.setString(
              SharedPreferencesManager.nama, dataktp?.data?.name ?? "");
          await sharedPreferencesManager.setString(
              SharedPreferencesManager.tgllahir, dataktp?.data?.dob ?? "");
          await sharedPreferencesManager.setString(
              SharedPreferencesManager.provinsiid,
              dataktp?.data?.province ?? "");
          await sharedPreferencesManager.setString(
              SharedPreferencesManager.kotaid, dataktp?.data?.city ?? "");
          await sharedPreferencesManager.setString(
              SharedPreferencesManager.kecamatan, dataktp?.data?.village ?? "");
          await sharedPreferencesManager.setString(
              SharedPreferencesManager.alamat, dataktp?.data?.address ?? "");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const RegisterIdValidationPage()),
          );
        } else {
          loadingKodeOtp = false;
          await customSnackbar(
              type: 'error',
              title: 'Kesalahan',
              text:
                  'Data KTP tidak terbaca, silahkan coba retake foto kembali');
          notifyListeners();
        }

        notifyListeners();
      } else {
        loadingKodeOtp = false;
        await customSnackbar(
            type: 'error',
            title: res.data['data']['status'],
            text: res.data['data']['message']);
        notifyListeners();
      }
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        final msg = e.toString();
        print(msg);
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      }
    }
  }

  getProvinsi(context) async {
    try {
      final res = await _dio.get('/v1/region/province');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataProvinsi = ModelProvinsi.fromJson(res.data);
      print('body: ${res.data}');
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        final msg = e.toString();
        print(msg);
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      }
    } catch (e) {
      print(e);
    }
  }

  getKota(context, String? id) async {
    try {
      final res = await _dio.get('/v1/region/city?province=$id');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataKota = ModelKota.fromJson(res.data);
      print('body: ${res.data}');
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        final msg = e.toString();
        print(msg);
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      }
    } catch (e) {
      print(e);
    }
  }

  getKecamatan(context, String? id) async {
    try {
      final res = await _dio.get('/v1/region/subdistrict?city=$id');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataKecamatan = ModelKecamatan.fromJson(res.data);
      print('body: ${res.data}');
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        final msg = e.toString();
        print(msg);
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      }
    } catch (e) {
      print(e);
    }
  }

  getTipeAnggota(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/member/type');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataTipeAnggota = ModelTipeAnggota.fromJson(res.data);
      print('body: ${res.data}');
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        final msg = e.toString();
        print(msg);
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      }
    } catch (e) {
      print(e);
    }
  }

  registerPost(
    context,
    String? nik,
    String? name,
    String? cityId,
    String? provinceId,
    String? subdistrictId,
    String? address,
    String? email,
    String? phoneNumber,
    String? birthdate,
    String? password,
    String? pin,
    String? membertypeId,
    String? membertypeanggota,
    String? otp,
  ) async {
    try {
      var inputFormat = DateFormat('dd-MM-yyyy');
      var outputFormat = DateFormat('yyyy-MM-dd');
      var date1 = inputFormat.parse(birthdate ?? "");
      var date2 = outputFormat.format(date1);
      print(date2);

      final body = {
        "nik": nik,
        "name": name,
        "city": cityId,
        "province": provinceId,
        "subdistrict": subdistrictId,
        "address": address,
        "email": email,
        "phoneNumber": phoneNumber,
        "birthdate": date2,
        "password": password,
        "pin": pin,
        "membertypeId": membertypeId,
        "otp": otp
      };
      final body1 = {"email": email, "password": password};

      print('body: $body');
      print('body: $body1');
      final res = await _dio.post('/v1/auth/register', data: body);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), body.toString());

      print(res.data['data']);
      if (res.data['data'] == 'success') {
        final resa = await _dio.post('/v1/auth/login', data: body1);

        await saveResponsePost(res.requestOptions.path, res.statusMessage,
            res.data.toString(), body.toString());

        if (resa.data['data'] == 'success') {
          // await sharedPreferencesManager.setBool(
          //     SharedPreferencesManager.isLoggedIn, true);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PaymentProcess(
                      isTopup: false,
                      popContext: 1,
                      isRegister: true,
                      tipeAnggota: membertypeanggota,
                      tipeAnggotaId: membertypeId,
                    )),
          );
        }
        notifyListeners();
      } else {
        loadingRegister = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        final msg = e.toString();
        print(msg);
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      }
    } catch (e) {
      print(e);
    }
  }

  selectmemberid(String? memberid) async {
    try {
      print(memberid);
      final body = {"membertypeId": memberid};
      final res = await _dio.post('/v1/auth/selectmember', data: body);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), body.toString());

      dataMemberID = ModelSelectMemberID.fromJson(res.data);
      if (res.data['data'] == 'success') {
        await sharedPreferencesManager.setBool(
            SharedPreferencesManager.isLoggedIn, true);
        loadingmemberid = false;
        // * Get.toNamed('/home'); -> boleh balik pake routing
        // * Get.offAll(Home()); -> ngga boleh balik pake class
        // * Get.to(Home()); -> boleh balik pake class
      } else {}
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
        loadingmemberid = false;
      } catch (e) {
        final msg = e.toString();
        print(msg);
        loadingmemberid = false;
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

  getmyinfoRegister(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/user/me');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataMyinfo = ModelInfoRegister.fromJson(res.data);
      print('body: ${res.data}');
      print(dataMyinfo?.data?.status);
      if (dataMyinfo?.data?.status == 'active') {
        await sharedPreferencesManager.setBool(
            SharedPreferencesManager.isLoggedIn, true);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()),
            (Route<dynamic> route) => false);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => RegisterLoadingPage()),
        // );
      }
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        final msg = e.toString();
        print(msg);
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      }
    } catch (e) {
      print(e);
    }
  }
}
