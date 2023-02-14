import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/models/modelapitext.dart';
import 'package:kmp_togo_mobile/models/response/error/model_error.dart';

class ProviderApiText extends ChangeNotifier with ApiMachine {
  final _dio = Helper().dio;
  ModelApiText? dataApiText;
  ModelApiText? dataApiTextObaroding1;
  ModelApiText? dataApiTextObaroding2;
  ModelApiText? dataApiTextObaroding3;
  ModelApiText? dataApiTextObaroding4;
  ModelApiText? dataApiRegister;
  ModelApiText? dataApiHubungiCS;
  ModelApiText? dataApiBanner1;
  ModelApiText? dataApiBanner2;
  ModelApiText? dataApiBanner3;
  ModelApiText? dataApiBanner4;
  List<String>? listImageA;
  bool? loadinbanner = true;
  getTextLogin(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/app/login');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataApiText = ModelApiText.fromJson(res.data);
      print(dataApiText?.data?.value);
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
        // await customSnackbar(
        //     type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        final msg = e.toString();
        print(msg);
        // await customSnackbar(
        //     type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      }
    } catch (e) {
      print(e);
    }
  }

  getTextOnboarding1(
    context,
  ) async {
    print('ok1');
    try {
      final res = await _dio.get('/v1/app/onboarding1');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());


      dataApiTextObaroding1 = ModelApiText.fromJson(res.data);
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
      } catch (e) {
        final msg = e.toString();
        print(msg);
      }
    } catch (e) {
      print(e);
    }
  }

  getTextOnboarding2(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/app/onboarding2');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataApiTextObaroding2 = ModelApiText.fromJson(res.data);
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
      } catch (e) {
        final msg = e.toString();
        print(msg);
      }
    } catch (e) {
      print(e);
    }
  }

  getTextOnboarding3(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/app/onboarding3');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataApiTextObaroding3 = ModelApiText.fromJson(res.data);
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
      } catch (e) {
        final msg = e.toString();
        print(msg);
      }
    } catch (e) {
      print(e);
    }
  }

  getTextOnboarding4(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/app/onboarding4');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataApiTextObaroding4 = ModelApiText.fromJson(res.data);
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
      } catch (e) {
        final msg = e.toString();
        print(msg);
      }
    } catch (e) {
      print(e);
    }
  }

  getTextRegister(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/app/register');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataApiRegister = ModelApiText.fromJson(res.data);
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
      } catch (e) {
        final msg = e.toString();
        print(msg);
      }
    } catch (e) {
      print(e);
    }
  }

  getTextBanner1(
    context,
  ) async {
    try {
      dataApiBanner1 = ModelApiText().dummy();
      dataApiBanner2 = ModelApiText().dummy();
      dataApiBanner3 = ModelApiText().dummy();
      dataApiBanner4 = ModelApiText().dummy();

      String gambar1 = dataApiBanner1?.data?.imagePath ?? "";
      String gambar2 = dataApiBanner2?.data?.imagePath ?? "";
      String gambar3 = dataApiBanner3?.data?.imagePath ?? "";
      String gambar4 = dataApiBanner4?.data?.imagePath ?? "";
      List<String> listImage = [];

      listImage.add(gambar1);
      listImage.add(gambar2);
      listImage.add(gambar3);
      listImage.add(gambar4);

      listImageA = listImage;

      if (listImageA!.isNotEmpty) {
        loadinbanner = false;
        notifyListeners();
      } else {
        loadinbanner = true;
        notifyListeners();
      }

      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
      } catch (e) {
        final msg = e.toString();
        print(msg);
      }
    } catch (e) {
      print(e);
    }
  }

  

  getTextHubungiCS(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/app/customerService');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataApiHubungiCS = ModelApiText.fromJson(res.data);
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
      } catch (e) {
        final msg = e.toString();
        print(msg);
      }
    } catch (e) {
      print(e);
    }
  }

  getTextRegistera(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/app/customerService');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataApiHubungiCS = ModelApiText.fromJson(res.data);
      notifyListeners();
    } on DioError catch (e) {
      try {
        ErrorModel data = ErrorModel.fromJson(e.response!.data);
      } catch (e) {
        final msg = e.toString();
      }
    } catch (e) {
      print(e);
    }
  }
}
