import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
import 'package:kmp_togo_mobile/models/register/payment_create.dart';
import 'package:kmp_togo_mobile/models/response/error/model_error.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerIdValidationPage.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerOtpPage.dart';
import 'package:kmp_togo_mobile/pages/common/takePictures.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/auth/registermemberid.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../../pages/auth/register/payments/registerPaymentsProcess.dart';

class ProviderRegister with ChangeNotifier, ApiMachine {
  final _dio = Helper().dio;
  final _dio2 = Helper().dio2;
  ModelProvinsi? dataProvinsi;
  ModelKota? dataKota;
  ModelKecamatan? dataKecamatan;
  ModelKtpData? dataktp;
  ModelTipeAnggota? dataTipeAnggota;
  ModelSelectMemberID? dataMemberID;
  ModelInfoRegister? dataMyinfo;
  PaymentCreateModel? dataPayment;
  bool? loadingOtp = false;
  bool? loadingKodeOtp = false;
  bool? loadingOcrKtp = false;
  bool? loadingRegister = false;
  bool? loadingmemberid = false;
  bool? loadinggetMyInfo = false;
  bool? loadingPayment = false;
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

  Future<bool> validate_ocrktp(context, File image) async {
    String fileName = image.path.split('/').last;
    final res = await _dio.post(
      '/api/v1/ktp-ocr',
      data: FormData.fromMap(
        {
          "image": await MultipartFile.fromFile(image.path, filename: fileName),
        },
      ),
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) => true,
      ),
    );

    await saveResponsePost(
        res.requestOptions.path, res.statusMessage, res.data.toString(), '');

    print('res: ${res.data}');
    if (res.data['success'] == true) {
      dataktp = ModelKtpData.fromJson(res.data);

      if (dataktp!.data!.id != '' &&
          dataktp!.data!.name != '' &&
          dataktp!.data!.dob != '' &&
          dataktp!.data!.province != '' &&
          dataktp!.data!.city != '' &&
          dataktp!.data!.village != '' &&
          dataktp!.data!.address != '' &&
          dataktp!.data!.pob != '' &&
          dataktp!.data!.religion != '' &&
          dataktp!.data!.maritalStatus != '' &&
          dataktp!.data!.work != '' &&
          dataktp!.data!.gender != '' &&
          dataktp!.data!.nationnality != '' &&
          dataktp!.data!.village != '' &&
          dataktp!.data!.rt != '' &&
          dataktp!.data!.rw != '') {
        loadingKodeOtp = false;
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.nomorKTP, dataktp?.data?.id ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.nama, dataktp?.data?.name ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.tgllahir, dataktp?.data?.dob ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.provinsiid, dataktp?.data?.province ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.kotaid, dataktp?.data?.city ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.kecamatan, dataktp?.data?.district ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.alamat, dataktp?.data?.address ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.birthPlace, dataktp?.data?.pob ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.religion, dataktp?.data?.religion ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.status,
            dataktp?.data?.maritalStatus ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.work, dataktp?.data?.work ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.gender, dataktp?.data?.gender ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.nationnality,
            dataktp?.data?.nationnality ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.village, dataktp?.data?.village ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.rt, dataktp?.data?.rt ?? "");
        await sharedPreferencesManager.setString(
            SharedPreferencesManager.rw, dataktp?.data?.rw ?? "");
        return true;
      } else {
        loadingKodeOtp = false;
        await customSnackbar(
            type: 'error',
            title: 'Kesalahan',
            text: 'Data KTP tidak terbaca, silahkan coba retake foto kembali');
        notifyListeners();

        return false;
      }
    } else {
      loadingKodeOtp = false;
      notifyListeners();
      await customSnackbar(
          type: 'error',
          title: 'error ${res.statusCode}',
          text: 'Terjadi kesalahan!');

      return false;
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
    context, {
    required String email,
    required String password,
    required String name,
    required String nik,
    required String birthdate,
    required String birthPlace,
    required String gender,
    required String address,
    required String rt,
    required String rw,
    required String village,
    required String subdistrict,
    required String religion,
    required String maritalStatus,
    required String work,
    required String nationnality,
    required String city,
    required String province,
    required String phoneNumber,
    required String pin,
    required String membertypeId,
    required String membertypeanggota,
    required String referral,
    required int adminFee,
    required int monthlyPrincipalFee,
    required int monthlyMandatoryFee,
  }) async {
    var inputFormat = DateFormat('dd-MM-yyyy');
    var outputFormat = DateFormat('dd-MM-yyyy');
    var date1 = inputFormat.parse(birthdate);
    var date2 = outputFormat.format(date1);

    String? deviceId = await PlatformDeviceId.getDeviceId;
    final body = {
      // 'email': 'example3@gmail.com',
      'email': email,
      // 'password': 'Sniren123',
      'password': password,
      // 'password_confirmation': 'Sniren123',
      'password_confirmation': password,
      // 'name': 'RENDI DWIKURNIASANDI',
      'name': name,
      // 'nik': 3210192013138233,
      'nik': int.parse(nik),
      // 'birth_place': 'MAJALENGKA',
      'birth_place': birthPlace,
      // 'birth_date': '20-10-2002',
      'birth_date': date2,
      // 'gender': 'LAKI-LAKI',
      'gender': gender,
      // 'address': 'DUSUN MAJAMULIA',
      'address': address,
      // 'rt': '004',
      'rt': rt,
      // 'rw': '002',
      'rw': rw,
      // 'village': 'MAJASUKA',
      'village': village,
      // 'district': 'PALASAH',
      'district': subdistrict,
      // 'religion': 'ISLAM',
      'religion': religion,
      // 'marital_status': 'BELUM KAWIN',
      'marital_status': maritalStatus,
      // 'work': 'PELAJAR/MAHASISWA',
      'work': work,
      // 'nationnality': 'WNI',
      'nationnality': nationnality,
      // 'city': 'KABUPATEN MAJALENGKA',
      'city': city,
      // 'province': 'JAWA BARAT',
      'province': province,
      // 'phone_number': 085215137045,
      'phone_number': int.parse(phoneNumber),
      // 'pin': 123456,
      'pin': int.parse(pin),
      // 'member_type': 'platinum',
      'member_type': membertypeanggota,

      'device_id': deviceId,
      'referral': referral,
    };
    // final body1 = {"email": email, "password": password};

    // print('body: $body');
    // print('body: $body1');
    final res = await _dio.post(
      '/api/v1/register',
      data: body,
      options: Options(
        headers: {'Accept': 'application/json'},
        followRedirects: false,
        validateStatus: (status) => true,
      ),
    );

    await saveResponsePost(res.requestOptions.path, res.statusMessage,
        res.data.toString(), body.toString());

    print(res.data);
    if (res.data['success'] == true) {
      await customSnackbar(
          type: 'success', title: 'Berhasil', text: 'Akun sudah terbuat');
      return res.data;
    } else if (res.statusCode == 422) {
      await customSnackbar(
          type: 'error',
          title: 'Terjadi kesalahan!',
          text: 'NIK/Email sudah terdaftar');
      throw Exception();
    } else {
      await customSnackbar(
          type: 'error', title: 'Error', text: 'Terjadi kesalahan!');
      throw Exception();
    }
  }

  createPayment(
    context, {
    required String token,
    String voucher = '',
  }) async {
    try {
      // dataPayment = null;
      // notifyListeners();
      print(token);
      final res = await _dio.post(
        '/api/v1/create-payment',
        data: {'voucher': voucher},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      await saveResponsePost(
          res.requestOptions.path, res.statusMessage, res.data.toString(), '');

      print(res.data);
      if (res.data['success'] == true) {
        dataPayment = PaymentCreateModel.fromJson(res.data);
        notifyListeners();
      } else {
        loadingPayment = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      if (kDebugMode) rethrow;
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        await customSnackbar(
            type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        await customSnackbar(
            type: 'error', title: 'error', text: 'Terjadi kesalahan!');
        rethrow;
      }
    } catch (e) {
      await customSnackbar(
          type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      rethrow;
    }
  }

  Future<bool> checkPayment(
    context, {
    required String token,
    required String uuid,
  }) async {
    print(token);
    print(uuid);
    final res = await _dio2.post(
      '/api/v1/check-payment',
      data: {'uuid': uuid},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          // 'Accept': 'application/json'
        },
        followRedirects: false,
        validateStatus: (status) => true,
      ),
    );

    await saveResponsePost(
        res.requestOptions.path, res.statusMessage, res.data.toString(), '');

    print(res.data);
    // if (res.data['success']['message'] == 'User has been ACTIVE') {
    //   return true;
    // }

    if (res.data['success'] == true) {
      if (res.data['data']['status'] == 'PAID') {
        return true;
      }

      await customSnackbar(
          type: 'error',
          title: 'error',
          text: 'Selesaikan pembayaran Anda terlebih dahulu!');
      return false;
    } else if (res.data['success'] == false) {
      await customSnackbar(
          type: 'error',
          title: 'error',
          text: 'Selesaikan pembayaran Anda terlebih dahulu!');
      return false;
    }

    await customSnackbar(
        type: 'error', title: 'error', text: 'Terjadi kesalahan!');

    return false;
  }

  Future<bool> checkVoucher(
    context, {
    required String token,
    required String code,
  }) async {
    final res = await _dio2.post(
      '/api/v1/check-voucher',
      data: {'code': code},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          // 'Accept': 'application/json'
        },
        followRedirects: false,
        validateStatus: (status) => true,
      ),
    );

    await saveResponsePost(
        res.requestOptions.path, res.statusMessage, res.data.toString(), '');

    print(res.data);
    // if (res.data['success']['message'] == 'User has been ACTIVE') {
    //   return true;
    // }

    if (res.data['success'] == true) {
      if (res.data['data']['message'] == 'Expired') {
        await customSnackbar(
            type: 'error',
            title: 'error',
            text: 'Kode voucher sudah kadaluarsa');
        return false;
      }
      if (res.data['data']['message'] == 'Used') {
        await customSnackbar(
            type: 'error',
            title: 'error',
            text: 'Kode voucher sudah digunakan');
        return false;
      }

      if (res.data['data']['message'] == 'UnUsed') {
        return true;
      }

      await customSnackbar(
          type: 'error', title: 'error', text: 'Kode voucher tidak valid');
      return false;
    } else if (res.data['success'] == false) {
      await customSnackbar(
          type: 'error', title: 'error', text: 'Kode voucher tidak valid');
      return false;
    }

    await customSnackbar(
        type: 'error', title: 'error', text: 'Terjadi kesalahan!');

    return false;
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
