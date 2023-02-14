import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerloadingpage.dart';
import 'package:kmp_togo_mobile/pages/common/carapembayaran_widget.dart';
import 'package:kmp_togo_mobile/pages/common/customAppBar.dart';
import 'package:kmp_togo_mobile/pages/common/takePictures.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_register.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/shared_pref_manager.dart';
// import 'package:size_config/size_config.dart';

class PaymentProcess extends StatefulWidget {
  int? popContext;
  bool isRegister;
  bool isTopup;

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

  PaymentProcess({
    Key? key,
    this.popContext,
    required this.isRegister,
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
    // this.otp,
  }) : super(key: key);

  @override
  State<PaymentProcess> createState() => _PaymentProcessState();
}

class _PaymentProcessState extends State<PaymentProcess> {
  bool? loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      submitRegister();
    });
  }

  submitRegister() async {
    await Provider.of<ProviderRegister>(context, listen: false)
        .selectmemberid(widget.tipeAnggotaId);
    setState(() {
      loading =
          Provider.of<ProviderRegister>(context, listen: false).loadingmemberid;
    });
  }

  dateConvert(date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    // var outputDate = outputFormat.format(inputDate);
    var outputFormat3 =
        DateFormat.yMMMMd(Localizations.localeOf(context).toString());
    var outputDate = outputFormat3.format(inputDate);

    return outputDate;
  }

  dateConvert2(date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('HH:mm:ss');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  final currencyFormatter = NumberFormat.currency(locale: 'ID');
  // print(currencyFormatter.format(d));

  @override
  Widget build(BuildContext context) {
    // print(sharedPreferencesManager.getString(SharedPreferencesManager.pin));
    // String? name =
    //     sharedPreferencesManager.getString(SharedPreferencesManager.nama);
    return Scaffold(
      body: Consumer<ProviderRegister>(builder: (context, v, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            // SizeConfig().init(
            //     context: context,
            //     safeAreaBox: constraints,
            //     referenceHeight: 800,
            //     referenceWidth: 360);
            return loading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          title: 'Pilih cara pembayaran',
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
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 11.0, horizontal: 2.0),
                                        child: Text(
                                          "Batas Akhir Pembayaran",
                                          style: TextStyling.w40014grey,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 11.0, horizontal: 2.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              DateTime.now()
                                                  .toLocal()
                                                  .toUtc()
                                                  .toString()
                                                  .substring(0, 10),
                                              // dateConvert(v.dataMemberID?.data
                                              //         ?.va?.expireAt) ??
                                              //     "",
                                              style: TextStyling.bold13black,
                                            ),
                                            Text(
                                              DateTime.now()
                                                  .toLocal()
                                                  .toUtc()
                                                  .toString()
                                                  .substring(0, 10),
                                              // dateConvert2(v.dataMemberID?.data
                                              //     ?.va?.expireAt),
                                              style: TextStyling.bold13black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const VerticalSpacer(height: 10),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 2.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Nama Anggota",
                                              style: TextStyling.w40014grey,
                                            ),
                                            const VerticalSpacer(height: 10),
                                            Text(
                                              v.dataMemberID?.data?.va?.name ??
                                                  "",
                                              style:
                                                  TextStyling.w600bold16black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const VerticalSpacer(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 2.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Tipe Anggota",
                                              style: TextStyling.w40014grey,
                                            ),
                                            const VerticalSpacer(height: 10),
                                            Text(
                                              v.dataMemberID?.data?.name ?? "",
                                              style:
                                                  TextStyling.w600bold16black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const VerticalSpacer(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 2.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Tujuan",
                                              style: TextStyling.w40014grey,
                                            ),
                                            const VerticalSpacer(height: 10),
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
                                            const HorizontalSpacer(width: 6),
                                            const Text(
                                              "Bank Artha Graha International",
                                              style:
                                                  TextStyling.w600bold16black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      widget.isRegister == true
                                          ? Column(
                                              children: [
                                                const VerticalSpacer(height: 8),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 7.0,
                                                      horizontal: 2.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Text(
                                                            "Total Biaya",
                                                            style: TextStyling
                                                                .w40014grey,
                                                          ),
                                                          const VerticalSpacer(
                                                              height: 10),
                                                          Text(
                                                            currencyFormatter
                                                                .format(00),
                                                            style: TextStyling
                                                                .w600bold16black,
                                                          ),
                                                        ],
                                                      ),
                                                      widget.isRegister == false
                                                          ? Container()
                                                          : InkWell(
                                                              splashColor: Color(
                                                                  0xFF85014e),
                                                              onTap: () {
                                                                Clipboard.setData(ClipboardData(
                                                                    text: v
                                                                        .dataMemberID
                                                                        ?.data
                                                                        ?.va
                                                                        ?.amount
                                                                        .toString()));
                                                              },
                                                              child: const Icon(
                                                                  Icons.copy,
                                                                  size: 20))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Container(),
                                      const VerticalSpacer(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 2.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                  style: TextStyling.w40014grey,
                                                ),
                                                const VerticalSpacer(
                                                    height: 10),
                                                Text(
                                                  v.dataMemberID?.data?.va
                                                          ?.vanumber
                                                          .toString() ??
                                                      "",
                                                  style: TextStyling
                                                      .w600bold16black,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                splashColor: Color(0xFF85014e),
                                                onTap: () {
                                                  Clipboard.setData(
                                                      ClipboardData(
                                                          text: v
                                                              .dataMemberID
                                                              ?.data
                                                              ?.va
                                                              ?.vanumber
                                                              .toString()));
                                                },
                                                child: const Icon(Icons.copy,
                                                    size: 20))
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
                                child: loading == true
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.only(
                                          right: 20.0,
                                          left: 20.0,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 70),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.grey),
                                        child: Center(
                                          child: SizedBox(
                                            child:
                                                const CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                            height: 2.h,
                                            width: 4.w,
                                          ),
                                        ))
                                    : InkWell(
                                        onTap: () {
                                          if (widget.isRegister) {
                                            setState(() {
                                              loading = true;
                                            });
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterLoadingPage()),
                                            );
                                          }
                                        },
                                        child: Container(
                                          height: 49.h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color(0xFF85014e)),
                                          child: const Center(
                                            child: Text("Cek pembayaran",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
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
        );
      }),
    );
  }

  // submitRegister(
  //   String? nik,
  //   String? name,
  //   String? cityId,
  //   String? provinceId,
  //   String? subdistrictId,
  //   String? address,
  //   String? email,
  //   String? phoneNumber,
  //   String? birthdate,
  //   String? password,
  //   String? pin,
  //   String? tipeAnngota,
  //   String? otp,
  // ) async {
  //   await Provider.of<ProviderRegister>(context, listen: false).registerPost(
  //       context,
  //       nik,
  //       name,
  //       cityId,
  //       provinceId,
  //       subdistrictId,
  //       address,
  //       email,
  //       phoneNumber,
  //       birthdate,
  //       password,
  //       pin,
  //       tipeAnngota,
  //       otp);
  //   setState(() {
  //     loading =
  //         Provider.of<ProviderRegister>(context, listen: false).loadingRegister;
  //   });
  // }
}
