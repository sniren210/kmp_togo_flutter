import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kmp_togo_mobile/models/member_model.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerloadingpage.dart';
import 'package:kmp_togo_mobile/pages/common/carapembayaran_widget.dart';
import 'package:kmp_togo_mobile/pages/common/customAppBar.dart';
import 'package:kmp_togo_mobile/pages/common/takePictures.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_auth.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_register.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/shared_pref_manager.dart';
// import 'package:size_config/size_config.dart';

class PaymentProcess extends StatefulWidget {
  final String tipeAnggota;
  final String tipeAnggotaId;
  // final String role;
  final String token;
  final int adminFee;
  final int monthlyPrincipalFee;
  final int monthlyMandatoryFee;

  PaymentProcess({
    Key? key,
    required this.tipeAnggota,
    required this.tipeAnggotaId,
    // required this.role,
    required this.token,
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
  final voucher = TextEditingController();
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

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      loadSharedPref();

      final getApiTextLogin =
          Provider.of<ProviderRegister>(context, listen: false);
      await getApiTextLogin.createPayment(
        context,
        token: widget.token,
        // voucher: '',
      );
      setState(() {
        loading = getApiTextLogin.loadingPayment;
      });
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
                                            if (v.dataPayment?.data.createdAt !=
                                                null)
                                              Text(
                                                DateFormat('dd-MM-yyyy').format(
                                                    v.dataPayment!.data
                                                        .createdAt),
                                                style: TextStyling.bold13black,
                                              ),
                                            if (v.dataPayment?.data.createdAt !=
                                                null)
                                              Text(
                                                DateFormat('dd-MM-yyyy').format(
                                                    v.dataPayment!.data
                                                        .expiresAt),
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
                                              v.dataPayment?.data.name ?? '',
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
                                              widget.tipeAnggota,
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
                                              controller: voucher,
                                              decoration: InputDecoration(
                                                hintText: 'masukan voucher',
                                                hintStyle:
                                                    TextStyling.w30013black,
                                                border: InputBorder.none,
                                              ),
                                              onSubmitted: (value) async {
                                                setState(() {
                                                  loading = true;
                                                });
                                                final getApiTextLogin = Provider
                                                    .of<ProviderRegister>(
                                                        context,
                                                        listen: false);

                                                final res =
                                                    await getApiTextLogin
                                                        .checkVoucher(context,
                                                            token: widget.token,
                                                            code: value
                                                            // voucher: '',
                                                            );

                                                if (res) {
                                                  await getApiTextLogin
                                                      .createPayment(context,
                                                          token: widget.token,
                                                          voucher: value);
                                                }

                                                setState(() {
                                                  loading = false;
                                                  voucher.text = value;
                                                });
                                              },
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
                                                        currencyFormatter.format(v
                                                            .dataPayment
                                                            ?.data
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
                                                          currencyFormatter.format((v
                                                                      .dataPayment
                                                                      ?.data
                                                                      .monthlyMandatoryFee ??
                                                                  0) *
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
                                                              .format(v
                                                                  .dataPayment
                                                                  ?.data
                                                                  .adminFee),
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyling
                                                              .w30013black),
                                                    ),
                                                  ],
                                                ),
                                                if (v.dataPayment?.data
                                                        .discountPercentage !=
                                                    "0")
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: const Text(
                                                          'Diskon ',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      ),
                                                      // Expanded(
                                                      //     child: Text('Rp.',
                                                      //         textAlign:
                                                      //             TextAlign.right,
                                                      //         style: TextStyling
                                                      //             .w30013black)),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "${v.dataPayment?.data.discountPercentage} %",
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontSize: 13,
                                                          ),
                                                        ),
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
                                                        int adminFee = v
                                                                .dataPayment
                                                                ?.data
                                                                .adminFee ??
                                                            0;
                                                        int monthlyPrincipalFee = v
                                                                .dataPayment
                                                                ?.data
                                                                .monthlyPrincipalFee ??
                                                            0;
                                                        int monthlyMandatoryFee = v
                                                                .dataPayment
                                                                ?.data
                                                                .monthlyMandatoryFee ??
                                                            0;

                                                        int jumlah = v
                                                                .dataPayment
                                                                ?.data
                                                                .amount ??
                                                            0;
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
                                                  v.dataPayment?.data
                                                          .accountNumber ??
                                                      "",
                                                  style: TextStyling
                                                      .w600bold16black,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                splashColor: Color(0xFF85014e),
                                                onTap: () async {
                                                  Clipboard.setData(
                                                      ClipboardData(
                                                          text: v
                                                              .dataMemberID
                                                              ?.data
                                                              ?.va
                                                              ?.vanumber
                                                              .toString()));

                                                  await customSnackbar(
                                                      type: 'success',
                                                      title: 'Berhasil',
                                                      text:
                                                          'Nomer VA berhasil disalin');
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
                                        onTap: () async {
                                          final rs = await Provider.of<
                                                      ProviderRegister>(context,
                                                  listen: false)
                                              .checkPayment(context,
                                                  token: widget.token,
                                                  uuid: v.dataPayment?.data
                                                          .uuid ??
                                                      '');

                                          if (rs) {
                                            await sharedPreferencesManager
                                                .clearAll();

                                            await Provider.of<
                                                        ProviderAuthLogin>(
                                                    context,
                                                    listen: false)
                                                .logout(token: widget.token);

                                            await customSnackbar(
                                                type: 'success',
                                                title: 'berhasil',
                                                text:
                                                    'Selamat anda telah membayar iuran pertama');
                                            Get.offAllNamed('/login');
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
