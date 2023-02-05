import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/models/product/category.dart';
import 'package:kmp_togo_mobile/models/product/sub_category.dart';

class ProductCategorySubApi with ApiMachine {
  final _dio = Helper().dio;

  Future<ItemModelProductCategory> fetchAllCategory() async {
    try {
      final res = await _dio.get('/v1/product/category');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());

      return ItemModelProductCategory.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ItemModelProductSubCategory> fetchSubCategoryByCatId(id) async {
    try {
      final res = await _dio.get('/v1/product/category/$id');

      await saveResponseGet(
          res.requestOptions.path, res.statusMessage, res.data.toString());
      return ItemModelProductSubCategory.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}

final productCatSubApi = ProductCategorySubApi();