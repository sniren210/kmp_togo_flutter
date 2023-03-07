import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/carapembayaran_widget.dart';
import 'package:kmp_togo_mobile/pages/common/customAppBar.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/pages/wallet/dashboard_wallet.dart';
import 'package:kmp_togo_mobile/providers/wallet/topup/provider_topup.dart';
import 'package:provider/provider.dart';
import '../../../../helpers/shared_pref_manager.dart';

class ProsesPembayaranTopUp extends StatefulWidget {
  int? popContext;
  bool isTopup;
  final int nominal;

  // String? nik;
  // String? name;
  // String? cityId;
  // String? provinceId;
  // String? subdistrictId;
  // String? address;
  // String? email;
  // String? phoneNumber;
  // String? birthdate;
  // String? password;
  // String? pin;
  String? tipeAnggota;
  String? tipeAnggotaId;
  // String? otp;

  ProsesPembayaranTopUp({
    Key? key,
    this.popContext,
    required this.isTopup,
    // this.nik,
    // this.name,
    // this.cityId,
    // this.provinceId,
    // this.subdistrictId,
    // this.address,
    // this.email,
    // this.phoneNumber,
    // this.birthdate,
    // this.password,
    // this.pin,
    this.tipeAnggota,
    this.tipeAnggotaId,
    required this.nominal,
    // this.otp,
  }) : super(key: key);

  @override
  State<ProsesPembayaranTopUp> createState() => _PaymentProcessState();
}

class _PaymentProcessState extends State<ProsesPembayaranTopUp>
    with NumberFormatMachine {
  @override
  void initState() {
    super.initState();
  }

  // dateConvert(date) {
  //   DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
  //   var inputDate = DateTime.parse(parseDate.toString());
  //   var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
  //   // var outputDate = outputFormat.format(inputDate);
  //   var outputFormat3 =
  //       DateFormat.yMMMMd(Localizations.localeOf(context).toString());
  //   var outputDate = outputFormat3.format(inputDate);

  //   return outputDate;
  // }

  // dateConvert2(date) {
  //   DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
  //   var inputDate = DateTime.parse(parseDate.toString());
  //   var outputFormat = DateFormat('HH:mm:ss');
  //   var outputDate = outputFormat.format(inputDate);
  //   return outputDate;
  // }

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProviderTopup>(
        model: ProviderTopup(Repository()),
        onModelReady: (model) => model.depositsPoin(widget.nominal),
        child: Container(),
        builder: (context, model, child) {
          return Scaffold(
            body: LayoutBuilder(
              builder: (context, constraints) {
                return model.busy
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomAppBar(
                              title: 'Topup',
                              popContext: widget.popContext,
                              height: 105,
                              padding: 15,
                            ),
                            const VerticalSpacer(height: 8),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  widget.isTopup
                                      ? Container()
                                      : Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 11.0,
                                                      horizontal: 2.0),
                                                  child: Text(
                                                    "Detail Transaksi",
                                                    style:
                                                        TextStyling.w40014grey,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 11.0,
                                                      horizontal: 2.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            'Harga 1 Coin',
                                                            style: TextStyling
                                                                .w30013black,
                                                          ),
                                                          Text(
                                                            '${getNumberFormatSeparator(model.items2!.data.coinPrice.toDouble())} Poin',
                                                            style: TextStyling
                                                                .bold13black,
                                                          ),
                                                        ],
                                                      ),
                                                      const VerticalSpacer(
                                                          height: 8),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            'Coin Gas Fee',
                                                            style: TextStyling
                                                                .w30013black,
                                                          ),
                                                          Text(
                                                            '${model.items2!.data.coinGasFee.toString()} Poin',
                                                            style: TextStyling
                                                                .bold13black,
                                                          ),
                                                        ],
                                                      ),
                                                      const VerticalSpacer(
                                                          height: 8),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            'Poin Gas Fee',
                                                            style: TextStyling
                                                                .w30013black,
                                                          ),
                                                          Text(
                                                            '${model.items2!.data.coinGasFee.toString()} Poin',
                                                            style: TextStyling
                                                                .bold13black,
                                                          ),
                                                        ],
                                                      ),
                                                      const VerticalSpacer(
                                                          height: 14),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            'Total Biaya Topup',
                                                            style: TextStyling
                                                                .w30015black,
                                                          ),
                                                          Text(
                                                            '${getNumberFormatSeparator(calcTotal(model.items2!.data.coinPrice, model.items2!.data.tokenGasFee, model.items2!.data.coinGasFee))} Poin',
                                                            style: TextStyling
                                                                .bold15black,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  widget.isTopup
                                      ? Container()
                                      : const VerticalSpacer(height: 10),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const VerticalSpacer(height: 8),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7.0, horizontal: 2.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Pembayaran",
                                                  style: TextStyling.w40014grey,
                                                ),
                                                const VerticalSpacer(
                                                    height: 10),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 24.w,
                                                      height: 24.h,
                                                      child: FittedBox(
                                                        fit: BoxFit.cover,
                                                        child: Image.asset(
                                                          'assets/images/logo-bagi-resize.png',
                                                        ),
                                                      ),
                                                    ),
                                                    const HorizontalSpacer(
                                                        width: 6),
                                                    const Text(
                                                      "Bank Artha Graha Internasional",
                                                      style: TextStyling
                                                          .w600bold16black,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const VerticalSpacer(height: 8),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7.0, horizontal: 2.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Nama",
                                                      style: TextStyling
                                                          .w40014grey,
                                                    ),
                                                    Text(
                                                      model.poinBeli?.data
                                                              .name ??
                                                          '',
                                                      style: TextStyling
                                                          .w600bold16black,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7.0, horizontal: 2.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Nominal Topup",
                                                      style: TextStyling
                                                          .w40014grey,
                                                    ),
                                                    Text(
                                                      getNumberFormatSeparator(
                                                          widget.nominal
                                                              .toDouble()),
                                                      style: TextStyling
                                                          .w600bold16black,
                                                    ),
                                                  ],
                                                ),
                                                IconButton(
                                                  onPressed: () async {
                                                    await Clipboard.setData(
                                                        ClipboardData(
                                                            text: widget.nominal
                                                                .toString()));

                                                    await customSnackbar(
                                                        type: 'success',
                                                        title: 'Berhasil',
                                                        text:
                                                            'Nominal berhasil disalin');
                                                  },
                                                  icon: const Icon(Icons.copy,
                                                      size: 20),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7.0, horizontal: 2.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "No Virtual Account",
                                                      style: TextStyling
                                                          .w40014grey,
                                                    ),
                                                    Text(
                                                      model.poinBeli?.data
                                                              .accountNumber ??
                                                          "",
                                                      style: TextStyling
                                                          .w600bold16black,
                                                    ),
                                                  ],
                                                ),
                                                IconButton(
                                                  onPressed: () async {
                                                    await Clipboard.setData(
                                                        ClipboardData(
                                                            text: model
                                                                    .poinBeli
                                                                    ?.data
                                                                    .accountNumber ??
                                                                ""));

                                                    await customSnackbar(
                                                        type: 'success',
                                                        title: 'Berhasil',
                                                        text:
                                                            'Nomer VA berhasil disalin');
                                                  },
                                                  icon: const Icon(Icons.copy,
                                                      size: 20),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const VerticalSpacer(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Wrap(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          27.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          27.0),
                                                                )),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            const SizedBox(
                                                                height: 10),
                                                            Center(
                                                              child: Container(
                                                                width: 25.w,
                                                                height: 1.h,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 1
                                                                            .h),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .grey,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                              ),
                                                            ),
                                                            const CaraPembayaranWidget(),
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  margin: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          20.0,
                                                                      left:
                                                                          20.0),
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          15,
                                                                      horizontal:
                                                                          70),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                      color: const Color(
                                                                          0xFF85014e)),
                                                                  child:
                                                                      const Text(
                                                                    'Tutup',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        fontSize:
                                                                            15),
                                                                  )),
                                                            ),
                                                            const SizedBox(
                                                                height: 30),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Container(
                                            height: 49.h,
                                            width: 148.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.transparent),
                                            child: const Center(
                                              child: Text("Cara Pembayaran"),
                                            ),
                                          ),
                                        ),
                                        model.busy
                                            ? Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                margin: const EdgeInsets.only(
                                                  right: 20.0,
                                                  left: 20.0,
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15,
                                                        horizontal: 70),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.grey),
                                                child: Center(
                                                  child: SizedBox(
                                                    height: 2.h,
                                                    width: 4.w,
                                                    child:
                                                        const CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ))
                                            : InkWell(
                                                onTap: () async {
                                                  await Provider.of<
                                                              ProviderTopup>(
                                                          context,
                                                          listen: false)
                                                      .checkPoin(model.poinBeli
                                                              ?.data.uuid ??
                                                          '');
                                                },
                                                child: Container(
                                                  height: 49.h,
                                                  width: 148.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: const Color(
                                                          0xFF85014e)),
                                                  child: const Center(
                                                    child: Text(
                                                        "Cek Pembayaran",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                  const VerticalSpacer(height: 20),
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
    // return BaseWidget<ProviderTopup>(
    //   model: ProviderTopup(Repository()),
    //   onModelReady: (model) => model.fetchCoinPriceInq(),
    //   child: Container(),
    //   builder: (context, model, child) => BaseWidget<ProviderTopup>(
    //       model: ProviderTopup(Repository()),
    //       onModelReady: (model) => model.fetchTopUp(),
    //       child: Container(),
    //       builder: (context, modelTopUp, child) => ),
    // );
  }

  calcTotal(int coinPrice, double tokenGasFee, double coinGasFee) {
    return coinPrice.toDouble() + tokenGasFee + coinGasFee;
  }
}
