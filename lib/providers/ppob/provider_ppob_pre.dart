import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/models/base_model.dart';
import 'package:kmp_togo_mobile/models/ppob/PPOBCheckOut.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidInqGameH.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidInqGameS.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidInqPLN.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidProduct.dart';

class ProviderPrepaidProduct with ChangeNotifier implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelPrePaidProduct? _items;

  ProviderPrepaidProduct(this._repository);

  final _streamController = StreamController<ProviderPrepaidProduct>();
  Stream<ProviderPrepaidProduct> get prepaidProduct {
    return _streamController.stream;
  }

  Future<ItemModelPrePaidProduct> fetchPrePaidProduct() async {
    setBusy(true);
    var success = ItemModelPrePaidProduct(data: [
      PrepaidProduct(
        productCode: 'telkomsel',
        productDescription: 'desc',
        productNominal: 'nominal',
        productDetails: 'example',
        productPrice: 1000,
        productType: 'pulsa',
        activePeriod: '',
        status: '',
        iconUrl: 'assets/images/provider_pulsa/Telkomsel.png',
        maxprice: 1000,
      ),
      PrepaidProduct(
        productCode: 'XL',
        productDescription: 'desc',
        productNominal: 'nominal',
        productDetails: 'example',
        productPrice: 1000,
        productType: 'pulsa',
        activePeriod: '',
        status: '',
        iconUrl: 'assets/images/provider_pulsa/AXis.png',
        maxprice: 1000,
      ),
    ]);
    // var success = await _repository.fetchPrePaidProduct();
    _items = success;

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  ItemModelPrePaidProduct? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

class ProviderPrepaidInqPLN with ChangeNotifier implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelPrepaidPLN? _items;

  ProviderPrepaidInqPLN(this._repository);

  final _streamController = StreamController<ProviderPrepaidInqPLN>();
  Stream<ProviderPrepaidInqPLN> get prepaidProduct {
    return _streamController.stream;
  }

  Future<ItemModelPrepaidPLN> prePaidInquiryPLN(String customer_id) async {
    setBusy(true);
    var success = await _repository.prePaidInquiryPLN(customer_id);
    _items = success;

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  ItemModelPrepaidPLN? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

class ProviderPrepaidInqGameHP with ChangeNotifier implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelPrepaidGameH? _items;

  ProviderPrepaidInqGameHP(this._repository);

  final _streamController = StreamController<ProviderPrepaidInqGameHP>();
  Stream<ProviderPrepaidInqGameHP> get prepaidProduct {
    return _streamController.stream;
  }

  Future<ItemModelPrepaidGameH> prePaidInquiryGameHP(
      String code, String tipe, String customer_id) async {
    setBusy(true);
    var success =
        await _repository.prePaidInquiryGameHP(code, tipe, customer_id);
    _items = success;

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  ItemModelPrepaidGameH? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

class ProviderPrepaidInqGameS with ChangeNotifier implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelPrepaidGameS? _items;

  ProviderPrepaidInqGameS(this._repository);

  final _streamController = StreamController<ProviderPrepaidInqGameS>();
  Stream<ProviderPrepaidInqGameS> get prepaidProduct {
    return _streamController.stream;
  }

  Future<ItemModelPrepaidGameS> prePaidInquiryGameS(String game_code) async {
    setBusy(true);
    var success = await _repository.prePaidInquiryGameServer(game_code);
    _items = success;

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  ItemModelPrepaidGameS? get items => _items;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

class ProviderPrepaidCheckout with ChangeNotifier implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelPPOBCheckOut? _items;

  ProviderPrepaidCheckout(this._repository);

  final _streamController = StreamController<ProviderPrepaidCheckout>();
  Stream<ProviderPrepaidCheckout> get prepaidProduct {
    return _streamController.stream;
  }

  Future<ItemModelPPOBCheckOut> prePaidCheckout(String tipe, String customer_id,
      String operator, PrepaidProduct product, String pinValue) async {
    setBusy(true);
    var success = await _repository.prePaidCheckout(
        tipe, customer_id, operator, product, pinValue);
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
