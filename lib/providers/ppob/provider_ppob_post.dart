import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/models/base_model.dart';
import 'package:kmp_togo_mobile/models/ppob/PPOBCheckOut.dart';
import 'package:kmp_togo_mobile/models/ppob/postpaid/PostPaidInquery2.dart';
import 'package:kmp_togo_mobile/models/ppob/postpaid/PostPaidProduct.dart';
import 'package:kmp_togo_mobile/models/ppob/postpaid/PostPaidType.dart';

class ProviderPostpaidType with ChangeNotifier implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelPostPaidType? _items;

  ProviderPostpaidType(this._repository);

  final _streamController = StreamController<ItemModelPostPaidType>();
  Stream<ItemModelPostPaidType> get postpaidTypeStream {
    return _streamController.stream;
  }

  Future<ItemModelPostPaidType> fetchAllPostPaidType() async {
    setBusy(true);
    var success = await _repository.fetchAllPostPaidType();
    _items = success;

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  ItemModelPostPaidType? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

class ProviderPostpaidProduct with ChangeNotifier implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelPostPaidProduct? _items;

  ProviderPostpaidProduct(this._repository);

  final _streamController = StreamController<ProviderPostpaidProduct>();
  Stream<ProviderPostpaidProduct> get postpaidProduct {
    return _streamController.stream;
  }

  Future<ItemModelPostPaidProduct> fetchPostPaidProduct(
      String product_name) async {
    setBusy(true);
    print('DATA: $product_name');
    var success = await _repository.fetchPostPaidProduct(product_name);
    _items = success;

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  ItemModelPostPaidProduct? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

class ProviderPostpaidInquery with ChangeNotifier implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  dynamic _items;

  ProviderPostpaidInquery(this._repository);

  final _streamController = StreamController<ProviderPostpaidProduct>();
  Stream<ProviderPostpaidProduct> get postpaidProduct {
    return _streamController.stream;
  }

  Future<dynamic> fetchPostPaidInquery(
      String code, String customer_id) async {
    setBusy(true);
    var success = await _repository.postPaidInquiry(code, customer_id);
    _items = success;

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  dynamic get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

class ProviderPostpaidCheckout with ChangeNotifier implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelPPOBCheckOut? _items;

  ProviderPostpaidCheckout(this._repository);

  final _streamController = StreamController<ProviderPostpaidCheckout>();
  Stream<ProviderPostpaidCheckout> get postpaidProduct {
    return _streamController.stream;
  }

  Future<ItemModelPPOBCheckOut> postPaidCheckout(
      String code, String tipe, String customer_id, String pinValue) async {
    setBusy(true);
    var success = await _repository.postPaidCheckout(code, tipe, customer_id, pinValue);
    _items = success;

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  ItemModelPPOBCheckOut? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
