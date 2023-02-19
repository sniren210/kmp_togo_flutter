import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kmp_togo_mobile/models/member_model.dart';
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
  final String? tipeAnggota;
  final String? tipeAnggotaId;
  final int adminFee;
  final int monthlyPrincipalFee;
  final int monthlyMandatoryFee;

  PaymentProcess({
    Key? key,
    this.tipeAnggota,
    this.tipeAnggotaId,
    this.adminFee = 0,
    this.monthlyPrincipalFee = 0,
    this.monthlyMandatoryFee = 0,
    // this.userType,
    // this.otp,
  }) : super(key: key);

  @override
  State<PaymentProcess> createState() => _PaymentProcessState();
}

class _PaymentProcessState extends State<PaymentProcess> {
  bool? loading = true;

  String? nik;
  String? name;
  String? cityId;
  String? provinceId;
  String? subdistrictId;
  String? address;
  String? email;
  String? phoneNumber;
  String? birthdate;
  String? password;
  String? pin;
  String? otp;
  String? pob;
  String? religion;
  String? status;
  String? work;
  String? gender;
  String? nationnality;
  String? village;
  String? rt;
  String? rw;

  @override
  void initState() {
    super.initState();

    loadSharedPref();

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

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  final currencyFormatter = NumberFormat.currency(
    locale: 'ID',
    symbol: ' ',
  );
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
                          title: 'Tagihan iuran keanggotaan',
                          popContext: 1,
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
                                              DateFormat('dd-MM-yyyy')
                                                  .format(DateTime.now()),
                                              // dateConvert(v.dataMemberID?.data
                                              //         ?.va?.expireAt) ??
                                              //     "",
                                              style: TextStyling.bold13black,
                                            ),
                                            Text(
                                              DateFormat('dd-MM-yyyy')
                                                  .format(DateTime.now()),
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
                                              name ?? '',
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
                                              widget.tipeAnggota ?? "",
                                              style:
                                                  TextStyling.w600bold16black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const VerticalSpacer(height: 8),
                                      const VerticalSpacer(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 7.0, horizontal: 2.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Kode Voucher",
                                              style: TextStyling.w40014grey,
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText: 'masukan voucher',
                                                hintStyle:
                                                    TextStyling.w30013black,
                                                border: InputBorder.none,
                                              ),
                                              onChanged: (value) {},
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7.0, horizontal: 2.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Total Biaya",
                                                  style: TextStyling.w40014grey,
                                                ),
                                                const VerticalSpacer(
                                                    height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: const Text(
                                                          'Iuran Pokok',
                                                          style: TextStyling
                                                              .w30013black),
                                                    ),
                                                    Expanded(
                                                        child: Text('Rp.',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyling
                                                                .w30013black)),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        currencyFormatter
                                                            .format(widget
                                                                .monthlyPrincipalFee),
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: TextStyling
                                                            .w30013black,
                                                        // style: TextStyling
                                                        //     .w600bold16black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: const Text(
                                                          'Iuran Wajib (12 bulan)',
                                                          style: TextStyling
                                                              .w30013black),
                                                    ),
                                                    Expanded(
                                                        child: Text('Rp.',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyling
                                                                .w30013black)),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                          currencyFormatter
                                                              .format((widget
                                                                      .monthlyMandatoryFee) *
                                                                  12),
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyling
                                                              .w30013black),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: const Text(
                                                          'Biaya Admin ',
                                                          style: TextStyling
                                                              .w30013black),
                                                    ),
                                                    Expanded(
                                                        child: Text('Rp.',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyling
                                                                .w30013black)),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                          currencyFormatter
                                                              .format(widget
                                                                  .adminFee),
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyling
                                                              .w30013black),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  thickness: 1,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: const Text(
                                                          'Jumlah ',
                                                          style: TextStyling
                                                              .w600bold16black),
                                                    ),
                                                    Expanded(
                                                        child: Text('Rp.',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyling
                                                                .w30013black)),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Builder(
                                                          builder: (context) {
                                                        int jumlah = widget
                                                                .adminFee +
                                                            widget
                                                                .monthlyPrincipalFee +
                                                            (widget.monthlyMandatoryFee *
                                                                12);
                                                        return Text(
                                                            currencyFormatter
                                                                .format(jumlah),
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyling
                                                                .w600bold16black);
                                                      }),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
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
                                        onTap: () {},
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

  loadSharedPref() async {
    nik = sharedPreferencesManager.getString(SharedPreferencesManager.nomorKTP);
    name = sharedPreferencesManager.getString(SharedPreferencesManager.nama);
    cityId =
        sharedPreferencesManager.getString(SharedPreferencesManager.kotaid);
    provinceId =
        sharedPreferencesManager.getString(SharedPreferencesManager.provinsiid);
    subdistrictId =
        sharedPreferencesManager.getString(SharedPreferencesManager.kecamatan);
    address =
        sharedPreferencesManager.getString(SharedPreferencesManager.alamat);
    email = sharedPreferencesManager.getString(SharedPreferencesManager.email);
    phoneNumber =
        sharedPreferencesManager.getString(SharedPreferencesManager.nomerHP);
    birthdate =
        sharedPreferencesManager.getString(SharedPreferencesManager.tgllahir);
    password =
        sharedPreferencesManager.getString(SharedPreferencesManager.password);
    pin = sharedPreferencesManager.getString(SharedPreferencesManager.pin);
    // otp = sharedPreferencesManager.getString(SharedPreferencesManager.otp);
    pob =
        sharedPreferencesManager.getString(SharedPreferencesManager.birthPlace);
    religion =
        sharedPreferencesManager.getString(SharedPreferencesManager.religion);
    status =
        sharedPreferencesManager.getString(SharedPreferencesManager.status);
    work = sharedPreferencesManager.getString(SharedPreferencesManager.work);
    gender =
        sharedPreferencesManager.getString(SharedPreferencesManager.gender);
    nationnality = sharedPreferencesManager
        .getString(SharedPreferencesManager.nationnality);
    village =
        sharedPreferencesManager.getString(SharedPreferencesManager.village);
    rt = sharedPreferencesManager.getString(SharedPreferencesManager.rt);
    rw = sharedPreferencesManager.getString(SharedPreferencesManager.rw);
  }
}
