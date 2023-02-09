import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/models/base_model.dart';
import 'package:kmp_togo_mobile/models/product/productBuy_model.dart';
import 'package:kmp_togo_mobile/models/product/productCart_model.dart';
import 'package:kmp_togo_mobile/models/product/productInq_model.dart';
import 'package:kmp_togo_mobile/models/product/productCreate2_model.dart';
import 'package:kmp_togo_mobile/models/product/productCreate_model.dart';
import 'package:kmp_togo_mobile/models/product/productSKU_model.dart';
import 'package:kmp_togo_mobile/models/product/product_model.dart';
import 'package:kmp_togo_mobile/models/response/success/success_models.dart';

final providerProduct = ProviderProduct(Repository());

class ProviderProduct with ChangeNotifier implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelProduct? _items;
  ItemModelProductInquiry? _itemsInquiry;
  ItemModelBuyProduct? _itemsBuy;
  ItemModelSuccess? _items2;

  ProviderProduct(this._repository);

  final _streamController = StreamController<ItemModelProduct>();
  Stream<ItemModelProduct> get allProductStream {
    return _streamController.stream;
  }

  Future<ItemModelProduct> fetchAllProduct(productSelling) async {
    setBusy(true);
    // var success = await _repository.fetchAllProduct(productSelling);
    var success = ItemModelProduct(
      meta: Meta(storeId: ''),
      data: [
        Datum(
          imagePath: 'https://i.imgur.com/NO25iZV.png',
          id: 0,
          storeId: 0,
          categoryId: 0,
          subCategoryId: '',
          name: 'example',
          image: 'https://i.imgur.com/NO25iZV.png',
          description: 'example desc',
          productSelling: '',
          rating: 0,
          ratingCount: 0,
          ratingTotal: 0,
          soldCount: 0,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          deletedAt: '2011-11-02T02:50:12.208Z',
          store: null,
          category: null,
          subCategory: '',
          sku: [],
        ),
      ],
    );
    _items = success;

    setBusy(false);
    return success;
  }

  Future<ItemModelProductInquiry> buyProductInquiry(
      skuId, qty, storeId, addressBookId, code) async {
    setBusy(true);
    var success = await _repository.buyProductInquiry(
        skuId, qty, storeId, addressBookId, code);
    _itemsInquiry = success;

    setBusy(false);
    return success;
  }

  Future<dynamic> buyProductInquiryCart(List<ItemProductCart> items) async {
    setBusy(true);
    var success = await _repository.buyProductInquiryCart(items);
    _itemsInquiry = success;

    setBusy(false);
    return success;
  }

  Future<ItemModelBuyProduct> buyProduct(dataInquiry, pinValue) async {
    setBusy(true);
    var success = await _repository.buyProduct(dataInquiry, pinValue);
    _itemsBuy = success;

    setBusy(false);
    return success;
  }

  Future<ItemModelSuccess> deleteProduct(id) async {
    setBusy(true);

    var success;

    try {
      success = await _repository.deleteProduct(id);

      _items2 = success;

      await Future.delayed(const Duration(milliseconds: 700));

      Get.back(result: 'delete');
      Get.back(result: 'delete');

      await customSnackbar(
          type: 'success', title: 'Berhasil Dihapus', text: '');
    } catch (e) {
      await customSnackbar(type: 'error', title: 'error', text: e.toString());
    }

    setBusy(false);
    return success;
  }

  @override
  bool get busy => _busy;
  ItemModelProduct? get items => _items;
  ItemModelProductInquiry? get itemsInquiry => _itemsInquiry;
  ItemModelBuyProduct? get itemsBuy => _itemsBuy;
  ItemModelSuccess? get items2 => _items2;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

class ProviderCreateProductWithVariant
    with ChangeNotifier
    implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelCreateProduct? _items;

  ProviderCreateProductWithVariant(this._repository);

  final _streamController = StreamController<ItemModelCreateProduct>();
  Stream<ItemModelCreateProduct> get allProductStream {
    return _streamController.stream;
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
    setBusy(true);

    var success;

    try {
      success = await _repository.createProductWithVariant(
          isUpdate,
          id,
          storeId,
          name,
          categoryId,
          subCategoryId,
          description,
          price,
          sku,
          productSelling,
          file);
      _items = success;

      await Future.delayed(const Duration(milliseconds: 700));

      Get.back(result: 'create');
      Get.back(result: 'create');
      Get.back(result: 'create');
      Get.back(result: 'create');
      Get.back(result: 'create');

      await customSnackbar(
          type: 'success', title: 'Produk Berhasil Ditambahkan', text: '');
    } catch (e) {
      Get.back(result: 'add update');
      Get.back(result: 'add update');

      await customSnackbar(type: 'error', title: 'error', text: e.toString());
    }

    setBusy(false);
    return success;
  }

  @override
  bool get busy => _busy;
  ItemModelCreateProduct? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

class ProviderCreateProductWithoutVariant
    with ChangeNotifier
    implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelProductWtVarian? _items;

  ProviderCreateProductWithoutVariant(this._repository);

  final _streamController = StreamController<ItemModelProductWtVarian>();
  Stream<ItemModelProductWtVarian> get allProductStream {
    return _streamController.stream;
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
    setBusy(true);

    var success;

    try {
      success = await _repository.createProductWtVariant(
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
          file);
      _items = success;

      await Future.delayed(const Duration(milliseconds: 700));

      Get.back(result: 'add update');
      Get.back(result: 'add update');
      Get.back(result: 'add update');
      Get.back(result: 'add update');
      Get.back(result: 'add update');
      Get.back(result: 'add update');

      await customSnackbar(
          type: 'success', title: 'Produk Berhasil Ditambahkan', text: '');
    } catch (e) {
      Get.back(result: 'add update');
      Get.back(result: 'add update');

      await customSnackbar(type: 'error', title: 'error', text: e.toString());
    }

    setBusy(false);
    return success;
  }

  @override
  bool get busy => _busy;
  ItemModelProductWtVarian? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
