import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/models/image_asset_model.dart';
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
  List<String> listImageSlider = [];
  List<String> listImageAds = [];
  List<String> listImagePopUp = [];
  ImageAssetModel? listImageOnboarding;
  bool? loadinSlider = true;
  bool? loadinAds = true;
  bool? loadinOnBoarding = true;
  bool? loadinPopUp = true;
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
      print(res.statusMessage);

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      print('ok');
      print(res.data);

      dataApiTextObaroding1 = ModelApiText.fromJson(res.data);
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

  getSlider(
    context,
  ) async {
    final res = await _dio.post(
      '/api/v1/get-image',
      data: {'type': 'SLIDER'},
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
      ),
    );

    // print(res.data);
    if (res.data['success'] == true) {
      final img = ImageAssetModel.fromJson(res.data);
      listImageSlider = img.data.map((e) => e.imageUrl).toList();

      loadinSlider = false;
      notifyListeners();
    } else {
      loadinAds = true;
      notifyListeners();
    }
  }

  getAds(
    context,
  ) async {
    final res = await _dio.post(
      '/api/v1/get-image',
      data: {'type': 'ADS'},
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
      ),
    );

    // print(res.data);
    if (res.data['success'] == true) {
      final img = ImageAssetModel.fromJson(res.data);
      listImageAds = img.data.map((e) => e.imageUrl).toList();
    }

    if (listImageAds.isNotEmpty) {
      loadinAds = false;
      notifyListeners();
    } else {
      loadinAds = true;
      notifyListeners();
    }
  }

  getPopUp(
    context,
  ) async {
    final res = await _dio.post(
      '/api/v1/get-image',
      data: {'type': 'popup'},
      options: Options(
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
      ),
    );

    // print(res.data);
    if (res.data['success'] == true) {
      final img = ImageAssetModel.fromJson(res.data);
      listImagePopUp = img.data.map((e) => e.imageUrl).toList();
    }

    if (listImagePopUp.isNotEmpty) {
      loadinPopUp = false;
      notifyListeners();
    } else {
      loadinPopUp = true;
      notifyListeners();
    }
  }

  getOnboarding(
    context,
  ) async {
    try {
      final res =
          await _dio.post('/api/v1/get-image', data: {'type': 'ONBOARDING'});

      if (res.data['success'] == true) {
        listImageOnboarding = ImageAssetModel.fromJson(res.data);
        if (listImageOnboarding != null) {
          loadinOnBoarding = false;
          notifyListeners();
        } else {
          loadinOnBoarding = true;
          notifyListeners();
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  // getTextBanner2(
  //   context,
  // ) async {
  //   try {
  //     final res = await _dio.get('/v1/app/banner1');
  //     dataApiRegister = ModelApiText.fromJson(res.data);
  //     listImage?.add(dataApiBanner?.data?.imagePath ?? "");
  //     notifyListeners();
  //   } on DioError catch (e) {
  //     try {
  //       ErrorModel data = ErrorModel.fromJson(e.response!.data);
  //       // await customSnackbar(
  //       //     type: 'error', title: 'error', text: data.error.toString());
  //     } catch (e) {
  //       final msg = e.toString();
  //       print(msg);
  //       // await customSnackbar(
  //       //     type: 'error', title: 'error', text: 'Terjadi kesalahan!');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // getTextBanner3(
  //   context,
  // ) async {
  //   try {
  //     final res = await _dio.get('/v1/app/banner1');
  //     dataApiRegister = ModelApiText.fromJson(res.data);
  //     listImage?.add(dataApiBanner?.data?.imagePath ?? "");
  //     notifyListeners();
  //   } on DioError catch (e) {
  //     try {
  //       ErrorModel data = ErrorModel.fromJson(e.response!.data);
  //       // await customSnackbar(
  //       //     type: 'error', title: 'error', text: data.error.toString());
  //     } catch (e) {
  //       final msg = e.toString();
  //       print(msg);
  //       // await customSnackbar(
  //       //     type: 'error', title: 'error', text: 'Terjadi kesalahan!');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // getTextBanner4(
  //   context,
  // ) async {
  //   try {
  //     final res = await _dio.get('/v1/app/banner1');
  //     dataApiRegister = ModelApiText.fromJson(res.data);
  //     listImage?.add(dataApiBanner?.data?.imagePath ?? "");
  //     notifyListeners();
  //   } on DioError catch (e) {
  //     try {
  //       ErrorModel data = ErrorModel.fromJson(e.response!.data);
  //       // await customSnackbar(
  //       //     type: 'error', title: 'error', text: data.error.toString());
  //     } catch (e) {
  //       final msg = e.toString();
  //       print(msg);
  //       // await customSnackbar(
  //       //     type: 'error', title: 'error', text: 'Terjadi kesalahan!');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
        // await customSnackbar(
        //     type: 'error', title: 'error', text: data.error.toString());
      } catch (e) {
        final msg = e.toString();
        // print(msg);
        // await customSnackbar(
        //     type: 'error', title: 'error', text: 'Terjadi kesalahan!');
      }
    } catch (e) {
      print(e);
    }
  }
}
