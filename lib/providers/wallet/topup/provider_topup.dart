import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/models/base_model.dart';
import 'package:kmp_togo_mobile/models/ppob/PPOBCheckOut.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidProduct.dart';
import 'package:kmp_togo_mobile/models/register/payment_create.dart';
import 'package:kmp_togo_mobile/models/wallet/topup/coin_model.dart';
import 'package:kmp_togo_mobile/models/wallet/topup/topup_model.dart';

class ProviderTopup with ChangeNotifier implements BaseModel {
  final Repository _repository;
  bool _busy = false;

  ItemModelTopup? _items;
  ItemModelCoinPriceInq? _items2;
  ItemModelBuyCoin? _items3;
  ItemModelSellCoin? _items4;
  PaymentCreateModel? _poinBeli;

  ProviderTopup(this._repository);

  final _streamController = StreamController<ProviderTopup>();
  Stream<ProviderTopup> get prepaidProduct {
    return _streamController.stream;
  }

  Future<ItemModelTopup> fetchTopUp() async {
    setBusy(true);
    var success = await _repository.fetchTopUp();
    _items = success;

    setBusy(false);
    return success;
  }

  Future<ItemModelCoinPriceInq> fetchCoinPriceInq() async {
    setBusy(true);
    var success = await _repository.fetchCoinPriceInq();
    _items2 = success;

    setBusy(false);
    return success;
  }

  Future<ItemModelBuyCoin> buyCoin(double coin, pinValue) async {
    setBusy(true);
    var success = await _repository.buyCoin(coin, pinValue);
    _items3 = success;

    setBusy(false);
    return success;
  }

  Future<ItemModelSellCoin> sellCoin(double coin, pinValue) async {
    setBusy(true);
    var success = await _repository.sellCoin(coin, pinValue);
    _items4 = success;

    setBusy(false);
    return success;
  }

  Future<PaymentCreateModel> depositsPoin(int poin) async {
    setBusy(true);
    var success = await _repository.beliPoin(
      poin,
    );
    _poinBeli = success;

    setBusy(false);
    return success;
  }

  Future<bool> checkPoin(String uuid) async {
    setBusy(true);
    var success = await _repository.cekPoin(
      uuid,
    );
    // _poinBeli = success;

    setBusy(false);
    return success;
  }

  @override
  // TODO: implement busy
  bool get busy => _busy;
  ItemModelTopup? get items => _items;
  ItemModelCoinPriceInq? get items2 => _items2;
  ItemModelBuyCoin? get items3 => _items3;
  PaymentCreateModel? get poinBeli => _poinBeli;

  @override
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
