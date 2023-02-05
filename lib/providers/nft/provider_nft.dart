import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/models/account/accountInfo.dart';
import 'package:kmp_togo_mobile/models/nft/modelMyNFTCategories.dart';
import 'package:kmp_togo_mobile/models/nft/modelNFTitemproduk.dart';
import 'package:kmp_togo_mobile/models/nft/modelallnft.dart';
import 'package:kmp_togo_mobile/models/nft/modelmynft.dart';
import 'package:kmp_togo_mobile/models/nft/modelnftid.dart';
import 'package:kmp_togo_mobile/models/nft/modelnftprodusenumum.dart';
import 'package:kmp_togo_mobile/models/nft/modelnftprodusenusaha.dart';
import 'package:kmp_togo_mobile/models/nft/modelsnftstatus.dart';
import 'package:kmp_togo_mobile/models/nft/modelsnftstatususaha.dart';
import 'package:kmp_togo_mobile/models/response/error/model_error.dart';
import 'package:kmp_togo_mobile/pages/home.dart';

import '../../helpers/ui_helper/custom_snackbar.dart';

class ProviderNft with ChangeNotifier, ApiMachine {
  final _dio = Helper().dio;
  ModelAllNFT? dataAllNFT;
  ModelMyNFT? dataAllNFTMy;
  ModelNFTStatusMy? dataAllStatusNFT;
  ModelNFTStatusMyUsaha? dataAllStatusNFTUsaha;
  ModelNFTKonsumenUmum? dataNFTProdusenUmum;
  ModelNFTKonsumenUsaha? dataNFTProdusenUsaha;
  ModelNFTItemProdusen? dataNFTItemProdusen;
  ModelNFTId? dataAllNFTid;
  ItemModelAccountInfo? dataMyInfo;
  ModelCategoryMyNFT? dataMCategoriesMyNFT;
  bool? loadinggetNFTALL = false;
  bool? loadinggetNFTMy = false;
  bool? loadinggetNFTId = false;
  bool? loadinggetPaymentNFT = false;
  bool? loadinggetSellNFT = false;
  bool? loadinggetaddnft = false;
  bool? loadinggetupdatenft = false;
  bool? loadinggethakasesnft = false;
  bool? loadinggetdeletenft = false;
  bool? statusPayment = false;
  bool? statusSell = false;
  bool? statusNFTstatus = false;
  bool? statusNFTstatusUsaha = false;
  bool? statusNFTProdusenUmum = false;
  bool? statusNFTProdusenUsaha = false;
  bool? statusNFTItemProdusen = false;
  int? lengthNftumum;
  int? lengthNftusaha;
  int? lengthNftprodusenUmum;
  int? lengthNftprodusenUsaha;

  getAllNFT(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/nft');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataAllNFT = ModelAllNFT.fromJson(res.data);
      loadinggetNFTALL = false;
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

  getNFTbyId(context, String? serialId) async {
    try {
      final res = await _dio.get('/v1/nft/unit/$serialId');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataAllNFTid = ModelNFTId.fromJson(res.data);
      loadinggetNFTId = false;
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

  getCoinKu(context) async {
    try {
      final res = await _dio.get('/v1/user/me');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());
      dataMyInfo = ItemModelAccountInfo.fromJson(res.data);
      loadinggetNFTId = false;
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

  sendPaymentNft(
      context, String? serialId, String? priceCoin, String? pin) async {
    try {
      print(pin);
      print(serialId);
      print(priceCoin);
      final body = {"nftSerialId": serialId, "priceCoin": priceCoin};
      final res = await _dio.post('/v1/nft/transaction/buy',
          options: Options(
            headers: {
              "pin": pin,
            },
          ),
          data: body);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), body.toString());

      print(res.data['data']);
      if (res.data['data'] == 'success') {
        loadinggetPaymentNFT = false;
        statusPayment = true;
        notifyListeners();
      }
    } on DioError catch (e) {
      try {
        loadinggetPaymentNFT = false;
        statusPayment = false;
        notifyListeners();
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

  getMyNFT(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/nft/my');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataAllNFTMy = ModelMyNFT.fromJson(res.data);
      loadinggetNFTMy = false;
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

  sellNft(context, String? serialId, String? priceCoin, String? pin) async {
    try {
      print(pin);
      print(serialId);
      print(priceCoin);
      // print(coinConverse);
      final body = {
        "nftSerialId": serialId,
        "priceCoin": priceCoin,
        "buybackFeePercentage": 20
      };
      final res = await _dio.post('/v1/nft/transaction/sell',
          options: Options(
            headers: {
              "pin": pin,
            },
          ),
          data: body);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), body.toString());

      print('${res.data['data']}haloo');
      if (res.data['data'] == 'success') {
        loadinggetPaymentNFT = false;
        statusSell = true;
        notifyListeners();
      }
      notifyListeners();
    } on DioError catch (e) {
      try {
        loadinggetPaymentNFT = false;
        statusPayment = false;
        notifyListeners();
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

  getMyStatusNFT(context, String status) async {
    print(status);
    try {
      final res = await _dio.get('/v1/nft/my?status=$status');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      if (status == 'umum') {
        dataAllStatusNFT = ModelNFTStatusMy.fromJson(res.data);
        print(res);
        lengthNftumum = dataAllStatusNFT?.data?.length;
        statusNFTstatus = false;
        print(lengthNftumum);
        notifyListeners();
      } else if (status == 'usaha') {
        dataAllStatusNFTUsaha = ModelNFTStatusMyUsaha.fromJson(res.data);
        lengthNftusaha = dataAllStatusNFTUsaha?.data?.length;
        statusNFTstatusUsaha = false;
        print(lengthNftusaha);
        notifyListeners();
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

  getMyNFTProdusen(context, String status) async {
    print(status);
    try {
      final res = await _dio.get('/v1/nft/byme?status=$status');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      if (status == 'umum') {
        dataNFTProdusenUmum = ModelNFTKonsumenUmum.fromJson(res.data);
        lengthNftprodusenUmum = dataNFTProdusenUmum?.data?.length;
        statusNFTProdusenUmum = false;
        print(lengthNftprodusenUmum);
      } else if (status == 'usaha') {
        dataNFTProdusenUsaha = ModelNFTKonsumenUsaha.fromJson(res.data);
        lengthNftprodusenUsaha = dataNFTProdusenUsaha?.data?.length;
        statusNFTProdusenUsaha = false;
        print(lengthNftprodusenUsaha);
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

  getNftItemProduct(context, int? id) async {
    try {
      print(id);
      final res = await _dio.get('/v1/product?storeId=$id');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataNFTItemProdusen = ModelNFTItemProdusen.fromJson(res.data);
      statusNFTItemProdusen = false;
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

  getMyNFTCategories(
    context,
  ) async {
    try {
      final res = await _dio.get('/v1/nft/category');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      dataMCategoriesMyNFT = ModelCategoryMyNFT.fromJson(res.data);
      loadinggetNFTMy = false;
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

  submitItemMyNFT(context, int? storeId, String? name, String? description,
      int? categoryId, int? price, File? images) async {
    try {
      // final body = {
      //   "storeId": storeId,
      //   "name": name,
      //   "description": description,
      //   "categoryId": categoryId,
      //   "sku": sku = {},
      // };
      // List<ModelSku>? skuNft = [];
      // skuNft.add(ModelSku(price: price, weight: 0));
      String fileName = images!.path.split('/').last;

      Map<String, dynamic> skuA = {"price": price, "weight": 0};

      print(storeId);
      print(name);
      print(description);
      print(categoryId);
      print(storeId);
      print(skuA);
      print(images);

      FormData fromData = FormData.fromMap({
        "storeId": storeId,
        "name": name,
        "description": description,
        "categoryId": categoryId,
        "productSelling": 'offline',
        "sku": jsonEncode([
          {"price": price, "weight": 0},
        ]),
        'image': await MultipartFile.fromFile(images.path, filename: fileName),
      });

      // print('body: $body');
      final res = await _dio.post('/v1/product', data: fromData);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), fromData.toString());

      print(res.statusCode);
      if (res.statusCode == 200) {
        // int count = 0;
        // Navigator.popUntil(context, (route) {
        //   return count++ == 2;
        // });
        await customSnackbar(
            title: 'Selamat',
            text: 'Berhasil menambah item nft',
            type: 'success');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        loadinggetaddnft = false;
        notifyListeners();
      } else {
        loadinggetaddnft = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      try {
        loadinggetaddnft = false;
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

  submitHakAkses(
    context,
    int? storeId,
    String? username,
    String? password,
  ) async {
    try {
      final body = {
        "email": username,
        "password": password,
        "storeId": storeId
      };

      print(storeId);
      print(username);
      print(password);

      // print('body: $body');
      final res = await _dio.post('/v1/pos/auth/register', data: body);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), body.toString());

      if (res.data['data'] == 'success') {
        await customSnackbar(
            title: 'Selamat',
            text: 'Berhasil menambah item nft',
            type: 'success');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        loadinggethakasesnft = false;
        notifyListeners();
      } else {
        loadinggethakasesnft = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      try {
        loadinggethakasesnft = false;
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

  deleteItemNFT(
    context,
    int? id,
  ) async {
    try {
      // final body = {
      //   "email": username,
      //   "password": password,
      //   "storeId": storeId
      // };

      print(id);
      // print(username);
      // print(password);

      // print('body: $body');
      final res = await _dio.delete('/v1/product/$id');

      await saveResponseDelete(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      if (res.data['data'] == 'success') {
        await customSnackbar(
            title: 'Succes',
            text: 'Berhasil menghapus item nft',
            type: 'success');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        loadinggetdeletenft = false;
        notifyListeners();
      } else {
        loadinggetdeletenft = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      try {
        loadinggetdeletenft = false;
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

  submitUpdateItemMyNFT(context, int? kategori, int? storeId, String? name,
      String? description, int? categoryId, int? price, File? images) async {
    try {
      // final body = {
      //   "storeId": storeId,
      //   "name": name,
      //   "description": description,
      //   "categoryId": categoryId,
      //   "sku": sku = {},
      // };
      // List<ModelSku>? skuNft = [];
      // skuNft.add(ModelSku(price: price, weight: 0));
      String fileName = images!.path.split('/').last;

      Map<String, dynamic> skuA = {"price": price, "weight": 0};

      print(storeId);
      print(name);
      print(description);
      print(kategori);
      print(skuA);
      print(images);

      FormData fromData = FormData.fromMap({
        // "storeId": storeId,
        "name": name,
        "description": description,
        "categoryId": categoryId,
        "productSelling": 'offline',
        "sku": jsonEncode([
          {"id": kategori, "price": price, "weight": 0},
        ]),
        'image': await MultipartFile.fromFile(images.path, filename: fileName),
      });

      // print('body: $body');
      final res = await _dio.patch('/v1/product/$storeId', data: fromData);

      await saveResponsePatch(res.requestOptions.path, res.statusMessage,
          res.data.toString(), fromData.toString());

      if (res.data['data'] == 'success') {
        // int count = 0;
        // Navigator.popUntil(context, (route) {
        //   return count++ == 2;
        // });
        await customSnackbar(
            title: 'Selamat',
            text: 'Berhasil menambah item nft',
            type: 'success');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        loadinggetupdatenft = false;
        notifyListeners();
      } else {
        loadinggetupdatenft = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      try {
        loadinggetupdatenft = false;
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

  submitTanpaUpdateItemMyNFT(context, int? kategori, int? storeId, String? name,
      String? description, int? categoryId, int? price, File? images) async {
    try {
      // final body = {
      //   "storeId": storeId,
      //   "name": name,
      //   "description": description,
      //   "categoryId": categoryId,
      //   "sku": sku = {},
      // };
      // List<ModelSku>? skuNft = [];
      // skuNft.add(ModelSku(price: price, weight: 0));
      // String fileName = images!.path.split('/').last;

      Map<String, dynamic> skuA = {"price": price, "weight": 0};

      print(kategori);
      print(name);
      print(description);
      print(storeId);
      print(skuA);
      print(images);

      FormData fromData = FormData.fromMap({
        // "storeId": storeId,
        "name": name,
        "description": description,
        "categoryId": categoryId,
        "productSelling": 'offline',
        "sku": jsonEncode([
          {"id": kategori, "price": price, "weight": 0},
        ]),
        'image': images,
      });

      // print('body: $body');
      final res = await _dio.patch('/v1/product/$storeId', data: fromData);

      await saveResponsePatch(res.requestOptions.path, res.statusMessage,
          res.data.toString(), fromData.toString());

      if (res.data['data'] == 'success') {
        // int count = 0;
        // Navigator.popUntil(context, (route) {
        //   return count++ == 2;
        // });
        await customSnackbar(
            title: 'Selamat',
            text: 'Berhasil menambah item nft',
            type: 'success');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        loadinggetupdatenft = false;
        notifyListeners();
      } else {
        loadinggetupdatenft = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      try {
        loadinggetupdatenft = false;
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
