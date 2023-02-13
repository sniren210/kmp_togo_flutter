// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/models/member_model.dart';
import 'package:kmp_togo_mobile/pages/auth/register/payments/registerPayments.dart';
import 'package:kmp_togo_mobile/pages/auth/register/payments/registerPaymentsProcess.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_membertype.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_register.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RegisterMemberTypePage extends StatefulWidget {
  const RegisterMemberTypePage({Key? key}) : super(key: key);

  @override
  State<RegisterMemberTypePage> createState() => _RegisterMemberTypePageState();
}

class _RegisterMemberTypePageState extends State<RegisterMemberTypePage> {
  GlobalKey? _formKey;
  bool? loading = false;

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

  @override
  void initState() {
    loadSharedPref();

    super.initState();
  }

  int selectedIndex = -1;

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  submitRegister(
    String? nik,
    String? name,
    String? cityId,
    String? provinceId,
    String? subdistrictId,
    String? address,
    String? email,
    String? phoneNumber,
    String? birthdate,
    String? password,
    String? pin,
    String? tipeAnngota,
    String? anggotatipe,
    String? otp,
  ) async {
    await Provider.of<ProviderRegister>(context, listen: false).registerPost(
        context,
        nik,
        name,
        cityId,
        provinceId,
        subdistrictId,
        address,
        email,
        phoneNumber,
        birthdate,
        password,
        pin,
        tipeAnngota,
        anggotatipe,
        otp);
    setState(() {
      loading =
          Provider.of<ProviderRegister>(context, listen: false).loadingRegister;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProviderMemberType>(
      model: ProviderMemberType(Repository()),
      onModelReady: (model) => model.fetchAllMemberType(),
      child: Container(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'Pilih Tipe Anggota',
                  textAlign: TextAlign.center,
                  style: TextStyling.titleStyle,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 20.0),
                  child: const Text(
                    'Lörem ipsum putinas eurobävning, pohöpas trev. Odade global hektar rere i biohögån ultras. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                model.busy
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: model.items?.data.length ?? 0,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                            onTap: () => setState(() {
                              selectedIndex = index;

                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (
                                    BuildContext context,
                                  ) {
                                    return StatefulBuilder(
                                        builder: (context, setsate1) {
                                      return Wrap(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(27.0),
                                                  topRight:
                                                      Radius.circular(27.0),
                                                )),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                const SizedBox(height: 10),
                                                Center(
                                                  child: Container(
                                                    width: 25.w,
                                                    height: 1.h,
                                                    margin: EdgeInsets.only(
                                                        top: 1.h),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                  ),
                                                ),
                                                MemberDetailWidget(
                                                    name: model.items
                                                        ?.data[index].name,
                                                    desc: model
                                                        .items
                                                        ?.data[index]
                                                        .description,
                                                    harga: model.items
                                                        ?.data[index].price),
                                                loading == false
                                                    ? InkWell(
                                                        onTap: () {
                                                          setsate1(() {
                                                            loading = true;
                                                          });
                                                          sharedPreferencesManager.setString(
                                                              SharedPreferencesManager
                                                                  .produsenId,
                                                              model
                                                                      .items
                                                                      ?.data[
                                                                          index]
                                                                      .id
                                                                      .toString() ??
                                                                  "");

                                                          submitRegister(
                                                              nik,
                                                              name,
                                                              cityId,
                                                              provinceId,
                                                              subdistrictId,
                                                              address,
                                                              email,
                                                              phoneNumber,
                                                              birthdate,
                                                              password,
                                                              pin,
                                                              model
                                                                  .items
                                                                  ?.data[index]
                                                                  .id
                                                                  .toString(),
                                                              model
                                                                  .items
                                                                  ?.data[index]
                                                                  .name
                                                                  .toString(),
                                                              otp);

                                                          // Navigator.push(
                                                          //   context,
                                                          //   MaterialPageRoute(
                                                          //       builder: (context) =>
                                                          //           PaymentProcess(
                                                          //             popContext:
                                                          //                 1,
                                                          //             isRegister:
                                                          //                 true,
                                                          //             nik: nik,
                                                          //             name: name,
                                                          //             cityId:
                                                          //                 cityId,
                                                          //             provinceId:
                                                          //                 provinceId,
                                                          //             subdistrictId:
                                                          //                 subdistrictId,
                                                          //             address:
                                                          //                 address,
                                                          //             email:
                                                          //                 email,
                                                          //             phoneNumber:
                                                          //                 phoneNumber,
                                                          //             birthdate:
                                                          //                 birthdate,
                                                          //             password:
                                                          //                 password,
                                                          //             pin: pin,
                                                          //             tipeAnggotaId: v
                                                          //                 .dataTipeAnggota
                                                          //                 ?.data?[
                                                          //                     index]
                                                          //                 .id
                                                          //                 .toString(),
                                                          //             otp: otp,
                                                          //           )),
                                                          // );
                                                        },
                                                        child: Container(
                                                            width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 20.0,
                                                                    left: 20.0),
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        15,
                                                                    horizontal:
                                                                        70),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: const Color(
                                                                    0xFF85014e)),
                                                            child: const Text(
                                                              'Bergabung',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize: 15),
                                                            )),
                                                      )
                                                    : Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        margin: const EdgeInsets
                                                            .only(
                                                          right: 20.0,
                                                          left: 20.0,
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 15,
                                                                horizontal: 70),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: Colors.grey),
                                                        child: Center(
                                                          child: SizedBox(
                                                            height: 2.h,
                                                            width: 4.w,
                                                            child:
                                                                const CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )),
                                                const SizedBox(height: 30),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    });
                                  });
                            }),
                            child: BuildMemberCard(
                              name: model.items?.data[index].name,
                              description: model.items?.data[index].description,
                              imageAsset: 'assets/images/logobanner.png',
                              isSelected: (selectedIndex == index),
                            ),
                          );
                        }),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
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
    otp = sharedPreferencesManager.getString(SharedPreferencesManager.otp);
  }
}

class BuildMemberCard extends StatefulWidget {
  String? name;
  String? description;
  String? imageAsset;
  bool? isSelected;

  BuildMemberCard({
    Key? key,
    required this.name,
    required this.description,
    required this.imageAsset,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<BuildMemberCard> createState() => _BuildMemberCardState();
}

class _BuildMemberCardState extends State<BuildMemberCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 4.0),
      child: Card(
        shape: widget.isSelected ?? false
            ? RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFF85014e), width: 2.0),
                borderRadius: BorderRadius.circular(4.0))
            : null,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.imageAsset ?? ''))),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.name ?? '',
                          style: TextStyling.bold15black),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.description ?? '',
                          style: TextStyling.w30013black, maxLines: 2),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Lihat selengkapnya',
                          style: TextStyling.w30013black_underlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MemberDetailWidget extends StatelessWidget {
  String? name, desc;
  int? harga;

  MemberDetailWidget(
      {Key? key, required this.name, required this.desc, required this.harga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(locale: 'ID');
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name ?? '', style: TextStyling.w50018black),
            const SizedBox(height: 18),
            Text(desc ?? '', style: TextStyling.w40014grey),
            const SizedBox(height: 18),
            Row(
              children: [
                const Text('Harga : ', style: TextStyling.w30013black),
                Text(currencyFormatter.format(harga),
                    style: TextStyling.w30013black),
              ],
            ),
            const SizedBox(height: 18),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Icon(Icons.check),
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width - 95,
            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 8.0),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             const SizedBox(height: 4),
            //             const Text('Keuntungan',
            //                 style: TextStyling.w50015black),
            //             const SizedBox(height: 15),
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text('\u2022', style: TextStyling.w30013black),
            //                 const HorizontalSpacer(width: 4),
            //                 Flexible(
            //                   child: Text(description ?? '',
            //                       style: TextStyling.w30013black),
            //                 ),
            //               ],
            //             ),
            //             const SizedBox(height: 2),
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text('\u2022', style: TextStyling.w30013black),
            //                 const HorizontalSpacer(width: 4),
            //                 Flexible(
            //                   child: Text(description ?? '',
            //                       style: TextStyling.w30013black),
            //                 ),
            //               ],
            //             ),
            //             const SizedBox(height: 2),
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text('\u2022', style: TextStyling.w30013black),
            //                 const HorizontalSpacer(width: 4),
            //                 Flexible(
            //                   child: Text(description ?? '',
            //                       style: TextStyling.w30013black),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 25),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Icon(Icons.check),
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width - 96,
            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 8.0),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             const SizedBox(height: 4),
            //             const Text('Iuran', style: TextStyling.w50015black),
            //             const SizedBox(height: 15),
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text('\u2022', style: TextStyling.w30013black),
            //                 const HorizontalSpacer(width: 4),
            //                 Flexible(
            //                   child: Text(description ?? '',
            //                       style: TextStyling.w30013black),
            //                 ),
            //               ],
            //             ),
            //             const SizedBox(height: 2),
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text('\u2022', style: TextStyling.w30013black),
            //                 const HorizontalSpacer(width: 4),
            //                 Flexible(
            //                   child: Text(description ?? '',
            //                       style: TextStyling.w30013black),
            //                 ),
            //               ],
            //             ),
            //             const SizedBox(height: 2),
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text('\u2022', style: TextStyling.w30013black),
            //                 const HorizontalSpacer(width: 4),
            //                 Flexible(
            //                   child: Text(description ?? '',
            //                       style: TextStyling.w30013black),
            //                 ),
            //               ],
            //             ),
            //             const SizedBox(height: 2),
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text('\u2022', style: TextStyling.w30013black),
            //                 const HorizontalSpacer(width: 4),
            //                 Flexible(
            //                   child: Text(description ?? '',
            //                       style: TextStyling.w30013black),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 25),
          ],
        ));
  }
}
