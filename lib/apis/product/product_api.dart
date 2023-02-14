import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/models/product/SKU_model.dart';
import 'package:kmp_togo_mobile/models/product/productBuy_model.dart';
import 'package:kmp_togo_mobile/models/product/productCart_model.dart';
import 'package:kmp_togo_mobile/models/product/productInq_model.dart';
import 'package:kmp_togo_mobile/models/product/productCreate2_model.dart';
import 'package:kmp_togo_mobile/models/product/productCreate_model.dart';
import 'package:kmp_togo_mobile/models/product/productSKU_model.dart';
import 'package:kmp_togo_mobile/models/product/product_model.dart';
import 'package:kmp_togo_mobile/models/response/error/model_error.dart';
import 'package:kmp_togo_mobile/models/response/success/success_models.dart';

class ProductApi with ApiMachine {
  final _dio = Helper().dio;

  Future<ItemModelProduct> fetchAllProduct(productSelling) async {
    Map<String, dynamic>? query = {"productSelling": productSelling};

    try {
    
      return ItemModelProduct.dummy();
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ItemModelCreateProduct> createProductWithVariant(
      isUpdate,
      id,
      storeId,
      name,
      categoryId,
      subCategoryId,
      description,
      price,
      List<ItemModelProductSKU>? sku,
      productSelling,
      file) async {
    try {
      var formData = FormData.fromMap({
        "storeId": 1,
        "name": name ?? '',
        "description": description ?? '',
        "sku": itemModelProductSKUToJson(sku ?? []),
        "categoryId": categoryId,
        "productSelling": productSelling ?? '',
        'image': await MultipartFile.fromFile(file,
            filename: file.toString().split('/').last)
      });

      debugPrint('COIN: ${formData.fields}');

      if (isUpdate) {
        final res = await _dio.patch('/v1/product/$id', data: formData);

        await saveResponsePost(res.requestOptions.path, res.statusMessage,
            res.data.toString(), formData.toString());

        return ItemModelCreateProduct.fromJson(res.data);
      } else {
        final res = await _dio.post('/v1/product',
            options: Options(headers: {
              "Content-Type": "multipart/form-data",
            }, contentType: 'multipart/form-data'),
            data: formData);

        await saveResponsePost(res.requestOptions.path, res.statusMessage,
            res.data.toString(), formData.toString());
        return ItemModelCreateProduct.fromJson(res.data);
      }
    } on DioError catch (e) {
      ErrorModel data = ErrorModel.fromJson(e.response!.data);
      await customSnackbar(
          type: 'error', title: 'error', text: data.error.toString());

      throw Exception(e.toString());
    }
  }

  Future<ItemModelProductWtVarian> createProductWtVariant(
      isUpdate,
      id,
      storeId,
      name,
      description,
      price,
      stock,
      weight,
      categoryId,
      subCategoryId,
      productSelling,
      file) async {
    List<SkuModel>? skuD = [];

    skuD.add(SkuModel(
      price: price,
      weight: weight,
      stock: stock,
    ));

    try {
      var formData = FormData.fromMap({
        "storeId": 1,
        "name": name ?? '',
        "description": description ?? '',
        "sku": skuModelToJson(skuD),
        "categoryId": categoryId,
        "productSelling": productSelling ?? '',
        'image': await MultipartFile.fromFile(file,
            filename: file.toString().split('/').last)
      });

      debugPrint('COIN: ${formData.fields}');

      if (isUpdate) {
        final res = await _dio.patch('/v1/product/$id', data: formData);

        await saveResponsePatch(res.requestOptions.path, res.statusMessage,
            res.data.toString(), formData.toString());

        return ItemModelProductWtVarian.fromJson(res.data);
      } else {
        final res = await _dio.post('/v1/product',
            options: Options(headers: {
              "Content-Type": "multipart/form-data",
            }, contentType: 'multipart/form-data'),
            data: formData);

        await saveResponsePost(res.requestOptions.path, res.statusMessage,
            res.data.toString(), formData.toString());

        return ItemModelProductWtVarian.fromJson(res.data);
      }
    } on DioError catch (e) {
      ErrorModel data = ErrorModel.fromJson(e.response!.data);
      await customSnackbar(
          type: 'error', title: 'error', text: data.error.toString());

      throw Exception(e.toString());
    }
  }

  Future<ItemModelProductInquiry> buyProductInquiry(
      skuId, qty, storeId, addressBookId, code) async {
    try {
      var formData = {
        "orders": [
          {
            "sku": [
              {"skuId": skuId, "qty": qty}
            ],
            "storeId": storeId,
            "shipping": {"addressBookId": addressBookId, "code": code}
          }
        ]
      };

      debugPrint('RES: $formData');

      final res = await _dio.post('/v1/product/order/inquiry', data: formData);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), formData.toString());

      debugPrint('RES: ${res.data}');

      return ItemModelProductInquiry.fromJson(res.data);
    } on DioError catch (e) {
      ErrorModel data = ErrorModel.fromJson(e.response!.data);
      await customSnackbar(
          type: 'error', title: 'error', text: data.error.toString());

      throw Exception(e.toString());
    }
  }

  Future<dynamic> buyProductInquiryCart(List<ItemProductCart> items) async {
    List<dynamic> listOrders = [];

    for (var element in items) {
      listOrders.add(itemProductCartToJson(element));
    }

    var formData = {"orders": jsonDecode(listOrders.toString())};

    try {
      final res = await _dio.post('/v1/product/order/inquiry', data: formData);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), formData.toString());

      return ItemModelProductInquiry.fromJson(res.data);
    } on DioError catch (e) {
      ErrorModel data = ErrorModel.fromJson(e.response!.data);
      await customSnackbar(
          type: 'error', title: 'error', text: data.error.toString());

      throw Exception(e.toString());
    }
  }

  Future<ItemModelBuyProduct> buyProduct(
      ItemModelProductInquiry dataInquiry, pinValue) async {
    try {
      var formData = dataInquiry.data.toJson();

      final res = await _dio.post('/v1/product/order',
          data: formData,
          options: Options(headers: await headersApi(pinValue)));

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), formData.toString());

      return ItemModelBuyProduct.fromJson(res.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.receiveTimeout) {
        await customSnackbar(
            type: 'warning',
            title: 'Pending',
            text: 'Transaksi kamu sedang diproses sistem');

        Get.offAllNamed('/home');
        throw Exception(e.toString());
      }
      ErrorModel data = ErrorModel.fromJson(e.response!.data);
      await customSnackbar(
          type: 'error', title: 'error', text: data.error.toString());

      Get.offAllNamed('/home');

      throw Exception(e.toString());
    } catch (e) {
      Get.offAllNamed('/home');

      await customSnackbar(type: 'error', title: 'error', text: e.toString());

      throw Exception(e.toString());
    }
  }

  Future<ItemModelSuccess> deleteProduct(id) async {
    try {
      final res = await _dio.delete('/v1/product/$id');

      await saveResponseDelete(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      return ItemModelSuccess.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
