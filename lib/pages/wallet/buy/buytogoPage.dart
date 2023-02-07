import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/auth/register/payments/registerPayments.dart';
import 'package:kmp_togo_mobile/pages/auth/register/payments/registerPaymentsProcess.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/buySuccessPage.dart';
import 'package:kmp_togo_mobile/pages/common/pinPage.dart';
import 'package:kmp_togo_mobile/pages/common/splashPage.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/pages/wallet/buy/cardKoin.dart';
import 'package:kmp_togo_mobile/pages/wallet/topup/topupPayment.dart';
import 'package:kmp_togo_mobile/pages/wallet/withdraw/otpwithdraw.dart';
import 'package:kmp_togo_mobile/providers/account/provider_account.dart';
import 'package:kmp_togo_mobile/providers/wallet/topup/provider_topup.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';

class BeliToGo extends StatefulWidget {
  BeliToGo({Key? key}) : super(key: key);

  @override
  State<BeliToGo> createState() => _BeliToGoState();
}

class _BeliToGoState extends State<BeliToGo> with NumberFormatMachine {
  List data = ['', '', ''];

  double qtyBuy = 0.0, qtySell = 0.0;
  double biaya = 0.0, gasFee = 0.0, tokenGasFee = 0.0, grandTotal = 0.0;

  bool saldokosong = false, isBuy = true;

  TextEditingController qtyBuyC = TextEditingController();
  TextEditingController qtySellC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProviderAccountInfo>(
        model: ProviderAccountInfo(Repository()),
        onModelReady: (model) => model.fetchAccountInfo(),
        child: Container(),
        builder: (context, model, child) {
          return BaseWidget<ProviderTopup>(
              model: ProviderTopup(Repository()),
              onModelReady: (model) => model.fetchCoinPriceInq(),
              child: Container(),
              builder: (context, modelCoin, child) {
                return Scaffold(
                  body: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                15.w,
                              ),
                              height: 102.h,
                              width: 375.w,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black.withOpacity(0.1),
                                    width: 1.h,
                                  ),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: SizedBox(
                                      width: 24.w,
                                      height: 24.h,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: SvgPicture.asset(
                                          'assets/images/back_icon.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    isBuy ? "Beli ToGo" : "Jual ToGo",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 24.w,
                                    height: 24.h,
                                  ),
                                ],
                              ),
                            ),
                            const VerticalSpacer(height: 8),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 0),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  isBuy
                                                      ? Colors.amber
                                                      : Colors.white),
                                        ),
                                        child: Text("Beli",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: isBuy
                                                    ? Colors.white
                                                    : Colors.black)),
                                        onPressed: () {
                                          setState(() {
                                            isBuy = true;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Flexible(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  !isBuy
                                                      ? Colors.amber
                                                      : Colors.white),
                                        ),
                                        child: Text("Jual",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: !isBuy
                                                    ? Colors.white
                                                    : Colors.black)),
                                        onPressed: () {
                                          setState(() {
                                            isBuy = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          isBuy
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 11.0,
                                                      horizontal: 2.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          3.w),
                                                              child: Icon(
                                                                Icons
                                                                    .monetization_on,
                                                                size: 36.w,
                                                                color: Colors
                                                                    .amber,
                                                              )),
                                                          SizedBox(
                                                            width: 4.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                'ToGo',
                                                                style: TextStyling
                                                                    .w600bold12black,
                                                              ),
                                                              SizedBox(
                                                                height: 8.h,
                                                              ),
                                                              modelCoin.busy
                                                                  ? Container()
                                                                  : Text(
                                                                      '1 ToGo = Rp.${getNumberFormatSeparator(modelCoin.items2!.data.coinPrice.toDouble())}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10.sp),
                                                                    )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 15.h,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    5.0),
                                                        child: Column(
                                                          children: [
                                                            TextField(
                                                              autofocus: true,
                                                              controller:
                                                                  qtyBuyC,
                                                              onChanged:
                                                                  (value) {
                                                                // if (value.length == 1 && last == false) {
                                                                //   FocusScope.of(context).nextFocus();
                                                                // }
                                                                //
                                                                // if (value.isEmpty && first == false) {
                                                                //   FocusScope.of(context).previousFocus();
                                                                // }

                                                                setState(() {
                                                                  qtyBuy = double
                                                                      .parse(value
                                                                          .toString());

                                                                  biaya = modelCoin
                                                                          .items2!
                                                                          .data
                                                                          .coinPrice *
                                                                      qtyBuy
                                                                          .toDouble();
                                                                  gasFee = modelCoin
                                                                          .items2!
                                                                          .data
                                                                          .coinGasFee *
                                                                      qtyBuy
                                                                          .toDouble();
                                                                  tokenGasFee = modelCoin
                                                                          .items2!
                                                                          .data
                                                                          .tokenGasFee *
                                                                      qtyBuy
                                                                          .toDouble();

                                                                  grandTotal = biaya +
                                                                      gasFee +
                                                                      tokenGasFee;
                                                                });
                                                              },
                                                              showCursor: false,
                                                              readOnly: false,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyling
                                                                  .w600bold16black,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      'Masukkan Jumlah',
                                                                  counter:
                                                                      const Offstage(),
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          width:
                                                                              2,
                                                                          color: Colors
                                                                              .black12),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12)),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          width:
                                                                              2,
                                                                          color: Colors
                                                                              .brown),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12))),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 11.0,
                                                      horizontal: 2.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical:
                                                                      4.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .change_circle,
                                                                  size: 20.sm),
                                                              const HorizontalSpacer(
                                                                  width: 6),
                                                              const Text(
                                                                  'Saldo ToGo kamu',
                                                                  style: TextStyling
                                                                      .w40014black),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          3.w),
                                                              child: Icon(
                                                                Icons
                                                                    .monetization_on,
                                                                size: 36.w,
                                                                color: Colors
                                                                    .amber,
                                                              )),
                                                          SizedBox(
                                                            width: 4.w,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              model.busy
                                                                  ? Container()
                                                                  : Text(
                                                                      '${getNumberFormatSeparator(model.items!.data.coinWallet.coin.toDouble())} ToGo',
                                                                      style: TextStyling
                                                                          .w600bold12black),
                                                              SizedBox(
                                                                height: 8.h,
                                                              ),
                                                              modelCoin.busy
                                                                  ? Container()
                                                                  : Text(
                                                                      '1 ToGo = Rp.${getNumberFormatSeparator(modelCoin.items2!.data.coinPrice.toDouble())}',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10.sp),
                                                                    )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 15.h,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    5.0),
                                                        child: Column(
                                                          children: [
                                                            TextField(
                                                              autofocus: true,
                                                              controller:
                                                                  qtySellC,
                                                              onChanged:
                                                                  (value) {
                                                                // if (value.length == 1 && last == false) {
                                                                //   FocusScope.of(context).nextFocus();
                                                                // }
                                                                //
                                                                // if (value.isEmpty && first == false) {
                                                                //   FocusScope.of(context).previousFocus();
                                                                // }

                                                                setState(() {
                                                                  qtySell = double
                                                                      .parse(value
                                                                          .toString());

                                                                  biaya = modelCoin
                                                                          .items2!
                                                                          .data
                                                                          .coinPrice *
                                                                      qtySell
                                                                          .toDouble();
                                                                  gasFee = modelCoin
                                                                          .items2!
                                                                          .data
                                                                          .coinGasFee *
                                                                      qtySell
                                                                          .toDouble();
                                                                  tokenGasFee = modelCoin
                                                                          .items2!
                                                                          .data
                                                                          .tokenGasFee *
                                                                      qtySell
                                                                          .toDouble();

                                                                  grandTotal = biaya +
                                                                      gasFee +
                                                                      tokenGasFee;
                                                                });
                                                              },
                                                              showCursor: false,
                                                              readOnly: false,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: TextStyling
                                                                  .w600bold16black,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      'Masukkan Jumlah',
                                                                  counter:
                                                                      const Offstage(),
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          width:
                                                                              2,
                                                                          color: Colors
                                                                              .black12),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12)),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          width:
                                                                              2,
                                                                          color: Colors
                                                                              .brown),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12))),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15.h,
                                                      ),
                                                      saldokosong == false
                                                          ? Container()
                                                          : Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                left: 3.w,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons.close,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          left: 3
                                                                              .w),
                                                                      child:
                                                                          Text(
                                                                        "Saldo tidak mencukupi!",
                                                                        style: TextStyle(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                138,
                                                                                111,
                                                                                111),
                                                                            fontSize:
                                                                                9.sp),
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                    ],
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const VerticalSpacer(height: 8),
                                  isBuy
                                      ? Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: modelCoin.busy
                                                ? const Center(
                                                    child:
                                                        CircularProgressIndicator())
                                                : Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 11.0,
                                                                horizontal:
                                                                    2.0),
                                                        child: Text(
                                                          "Ringkasan Biaya",
                                                          style: TextStyling
                                                              .w600bold16black,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 7.0,
                                                                horizontal:
                                                                    2.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Biaya",
                                                              style: TextStyling
                                                                  .w30013black,
                                                            ),
                                                            Text(
                                                              "Rp.${getNumberFormatSeparator(biaya)}",
                                                              style: TextStyling
                                                                  .bold13black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 7.0,
                                                                horizontal:
                                                                    2.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Coin GasFee",
                                                              style: TextStyling
                                                                  .w30013black,
                                                            ),
                                                            Text(
                                                              "${getNumberFormatSeparator3(gasFee)}",
                                                              style: TextStyling
                                                                  .bold13black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 7.0,
                                                                horizontal:
                                                                    2.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Token GasFee",
                                                              style: TextStyling
                                                                  .w30013black,
                                                            ),
                                                            Text(
                                                              "${getNumberFormatSeparator3(tokenGasFee)}",
                                                              style: TextStyling
                                                                  .bold13black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 2.0),
                                                        child: Divider(
                                                          height: 1,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10.0,
                                                                horizontal:
                                                                    2.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Total Biaya",
                                                              style: TextStyling
                                                                  .w30016black,
                                                            ),
                                                            Text(
                                                              "Rp.${getNumberFormatSeparator4(grandTotal)}",
                                                              style: TextStyling
                                                                  .w600bold16black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                          ),
                                        )
                                      : Container(),
                                  const VerticalSpacer(height: 20),
                                  InkWell(
                                    onTap: () async {
                                      final SharedPreferencesManager
                                          sharedPreferencesManager =
                                          locator<SharedPreferencesManager>();

                                      if (isBuy) {
                                        if (qtyBuyC.text.isNotEmpty) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return EnterPinPage(
                                                isAllowBack: true,
                                                nextPage: SplashPage(
                                                  nextPage: BuySuccessPage(
                                                    nextPage: Home(),
                                                    title: 'Berhasil Membeli',
                                                    subtitle: '',
                                                  ),
                                                  title:
                                                      'Berhasil Membeli Coin ToGo',
                                                  subtitle: '',
                                                  provRepo: 'buy_coin',
                                                  model: null,
                                                  totalCoin: qtyBuy,
                                                  itemModelBuyCoin:
                                                      modelCoin.items3,
                                                  isReplace: false,
                                                  pinValue: sharedPreferencesManager
                                                          .getString(
                                                              SharedPreferencesManager
                                                                  .pin) ??
                                                      '',
                                                ),
                                                isContainFunctionBack: true,
                                                title: 'Konfirmasi Pembelian',
                                              );
                                            }),
                                          );
                                        } else {
                                          await customSnackbar(
                                              type: 'error',
                                              title: 'Kesalahan',
                                              text:
                                                  'Jumlah coin ToGo tidak boleh kosong');
                                        }
                                      } else {
                                        if (qtySellC.text.isNotEmpty) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return EnterPinPage(
                                                isAllowBack: true,
                                                nextPage: SplashPage(
                                                  nextPage: BuySuccessPage(
                                                    nextPage: Home(),
                                                    title: 'Berhasil Menjual',
                                                    subtitle: '',
                                                  ),
                                                  title:
                                                      'Berhasil Menjual Coin ToGo',
                                                  subtitle: '',
                                                  provRepo: 'sell_coin',
                                                  model: null,
                                                  totalCoin: qtySell,
                                                  itemModelBuyCoin:
                                                      modelCoin.items3,
                                                  isReplace: false,
                                                  pinValue: sharedPreferencesManager
                                                          .getString(
                                                              SharedPreferencesManager
                                                                  .pin) ??
                                                      '',
                                                ),
                                                isContainFunctionBack: true,
                                                title: 'Konfirmasi Penjualan',
                                              );
                                            }),
                                          );
                                        } else {
                                          await customSnackbar(
                                              type: 'error',
                                              title: 'Kesalahan',
                                              text:
                                                  'Jumlah coin ToGo tidak boleh kosong');
                                        }
                                      }
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 70),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: const Color(0xFF85014e)),
                                        child: Text(
                                          isBuy ? 'Beli Coin' : 'Jual Coin',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15),
                                        )),
                                  ),
                                  // const VerticalSpacer(height: 20),
                                  // const Padding(
                                  //   padding: EdgeInsets.all(8.0),
                                  //   child: Text('Rincian Coin ToGo',
                                  //       style: TextStyling.w600bold14black),
                                  // ),
                                  // Column(
                                  //   children: [
                                  //     Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: CardCoinToGo(
                                  //         status: 'Harga Tertinggi',
                                  //         harga: '120.000',
                                  //       ),
                                  //     ),
                                  //     Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: CardCoinToGo(
                                  //         status: 'Harga Terendah',
                                  //         harga: '90.000',
                                  //       ),
                                  //     ),
                                  //     Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: CardCoinToGo(
                                  //         status: 'Harga Hari Ini',
                                  //         harga: '1.820.012',
                                  //       ),
                                  //     ),
                                  //   ],
                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              });
        });
  }
}
