import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/formInputField.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/models/modelkecamatan.dart';
import 'package:kmp_togo_mobile/models/modelkota.dart';
import 'package:kmp_togo_mobile/models/modelprovinsi.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerNewAccountPage.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_register.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../helpers/injector.dart';
import '../../../helpers/shared_pref_manager.dart';
import '../../../helpers/ui_helper/custom_snackbar.dart';

class RegisterIdValidationPage extends StatefulWidget {
  const RegisterIdValidationPage({Key? key}) : super(key: key);

  @override
  State<RegisterIdValidationPage> createState() =>
      _RegisterIdValidationPageState();
}

class _RegisterIdValidationPageState extends State<RegisterIdValidationPage> {
  GlobalKey? _formKey;
  var currentSelectedValue;
  var currentSelectedValueKota;
  var currentSelectedValueKecamatan;

  TextEditingController? idNumberC,
      nameC,
      birthdateC,
      cityC,
      provinceC,
      kecamatanC,
      addressC;

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();
  String? birth;
  @override
  void initState() {
    String? nik =
        sharedPreferencesManager.getString(SharedPreferencesManager.nomorKTP);
    String? name =
        sharedPreferencesManager.getString(SharedPreferencesManager.nama);
    String? birthdate =
        sharedPreferencesManager.getString(SharedPreferencesManager.tgllahir);
    birth =
        sharedPreferencesManager.getString(SharedPreferencesManager.tgllahir);
    String? address =
        sharedPreferencesManager.getString(SharedPreferencesManager.alamat);
    String? city =
        sharedPreferencesManager.getString(SharedPreferencesManager.kotaid);
    String? province =
        sharedPreferencesManager.getString(SharedPreferencesManager.provinsiid);
    String? kecamatan =
        sharedPreferencesManager.getString(SharedPreferencesManager.kecamatan);

    idNumberC = TextEditingController(text: nik);
    nameC = TextEditingController(text: name);
    birthdateC = TextEditingController(text: birthdate);
    cityC = TextEditingController(text: city);
    provinceC = TextEditingController(text: province);
    kecamatanC = TextEditingController(text: kecamatan);
    addressC = TextEditingController(text: address);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // final _getkategoriProvider =
      //     Provider.of<ProviderRegister>(context, listen: false);
      // await _getkategoriProvider.getProvinsi(context);
    });
    super.initState();
  }

  cekKota(String? id) async {
    final _getkategoriProvider =
        Provider.of<ProviderRegister>(context, listen: false);
    await _getkategoriProvider.getKota(context, id);
  }

  cekKecamatan(String? id) async {
    final _getkategoriProvider =
        Provider.of<ProviderRegister>(context, listen: false);
    await _getkategoriProvider.getKecamatan(context, id);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: Consumer<ProviderRegister>(
            builder: (BuildContext context, v, Widget? child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 110,
                ),
                const Text(
                  'Konfirmasi Data Kamu',
                  textAlign: TextAlign.center,
                  style: TextStyling.titleStyle,
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
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
                  height: 20,
                ),
                FormInput(
                    enable: false,
                    isReadOnly: true,
                    controller: idNumberC!,
                    inputType: TextInputType.number,
                    hintText: 'Nomor KTP',
                    icon: Icons.credit_card),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    enable: false,
                    isReadOnly: true,
                    controller: nameC!,
                    inputType: TextInputType.text,
                    hintText: 'Nama Lengkap',
                    icon: Icons.person),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    enable: false,
                    isReadOnly: true,
                    controller: birthdateC!,
                    inputType: TextInputType.text,
                    hintText: "Tanggal Lahir",
                    icon: Icons.date_range),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    enable: false,
                    controller: provinceC!,
                    inputType: TextInputType.text,
                    hintText: 'Province',
                    icon: Icons.house),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    enable: false,
                    controller: cityC!,
                    inputType: TextInputType.text,
                    hintText: 'Kota/Kabupaten',
                    icon: Icons.house),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    enable: false,
                    isReadOnly: true,
                    controller: kecamatanC!,
                    inputType: TextInputType.text,
                    hintText: 'Desa',
                    icon: Icons.house),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 8,
                ),
                // InkWell(
                //   child: Container(
                //     margin: EdgeInsets.symmetric(horizontal: 20),
                //     width: MediaQuery.of(context).size.width,
                //     decoration: BoxDecoration(border: Border.all()),
                //     child: Row(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 8.0, right: 8),
                //           child: Icon(Icons.location_city),
                //         ),
                //         Expanded(
                //           child: DropdownButtonHideUnderline(
                //             child: DropdownButton<String>(
                //               hint: Text(
                //                 "  Pilih Provinsi",
                //                 style: TextStyle(fontSize: 10.sp),
                //               ),
                //               items: v.dataProvinsi?.data
                //                   ?.map<DropdownMenuItem<String>>(
                //                       (DataProvinsi valuee) {
                //                 return DropdownMenuItem<String>(
                //                   value: valuee.provinceId ?? "",
                //                   child: Text(
                //                     '   ${valuee.province}',
                //                     style: TextStyle(color: Colors.black),
                //                   ),
                //                 );
                //               }).toList(),
                //               onChanged: (newValue) {
                //                 setState(() {
                //                   currentSelectedValue = newValue;
                //                 });
                //                 cekKota(newValue);
                //                 print(currentSelectedValue);
                //               },
                //               value: currentSelectedValue,
                //               style:
                //                   TextStyle(fontSize: 10.sp, color: Colors.black),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 8,
                // ),
                // InkWell(
                //   child: Container(
                //     margin: EdgeInsets.symmetric(horizontal: 20),
                //     width: MediaQuery.of(context).size.width,
                //     decoration: BoxDecoration(border: Border.all()),
                //     child: Row(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 8.0, right: 8),
                //           child: Icon(Icons.location_city),
                //         ),
                //         Expanded(
                //           child: DropdownButtonHideUnderline(
                //             child: DropdownButton<String>(
                //               hint: Text(
                //                 "  Pilih Kota / Kabupaten",
                //                 style: TextStyle(fontSize: 10.sp),
                //               ),
                //               items: v.dataKota?.data
                //                   ?.map<DropdownMenuItem<String>>(
                //                       (DataKota valuee) {
                //                 return DropdownMenuItem<String>(
                //                   value: valuee.cityId ?? "",
                //                   child: Text(
                //                     '   ${valuee.cityName}',
                //                     style: TextStyle(color: Colors.black),
                //                   ),
                //                 );
                //               }).toList(),
                //               onChanged: (newValue) {
                //                 setState(() {
                //                   currentSelectedValueKota = newValue;
                //                   // getCekData();
                //                 });
                //                 print(newValue);
                //                 cekKecamatan(newValue);
                //               },
                //               value: currentSelectedValueKota,
                //               style:
                //                   TextStyle(fontSize: 10.sp, color: Colors.black),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 8,
                // ),
                // InkWell(
                //   child: Container(
                //     margin: EdgeInsets.symmetric(horizontal: 20),
                //     width: MediaQuery.of(context).size.width,
                //     decoration: BoxDecoration(border: Border.all()),
                //     child: Row(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(left: 8.0, right: 8),
                //           child: Icon(Icons.location_city),
                //         ),
                //         Expanded(
                //           child: DropdownButtonHideUnderline(
                //             child: DropdownButton<String>(
                //               hint: Text(
                //                 "  Pilih Kecamatan / Desa",
                //                 style: TextStyle(fontSize: 10.sp),
                //               ),
                //               items: v.dataKecamatan?.data
                //                   ?.map<DropdownMenuItem<String>>(
                //                       (DataKecamatan valuee) {
                //                 return DropdownMenuItem<String>(
                //                   value: valuee.subdistrictId ?? "",
                //                   child: Text(
                //                     '   ${valuee.subdistrictName}',
                //                     style: TextStyle(color: Colors.black),
                //                   ),
                //                 );
                //               }).toList(),
                //               onChanged: (newValue) {
                //                 setState(() {
                //                   currentSelectedValueKecamatan = newValue;
                //                   // getCekData();
                //                 });
                //                 print('haloo ${currentSelectedValueKecamatan}');
                //               },
                //               value: currentSelectedValueKecamatan,
                //               style:
                //                   TextStyle(fontSize: 10.sp, color: Colors.black),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 8,
                ),
                FormInputLongText(
                    enable: false,
                    readOnly: true,
                    controller: addressC!,
                    hintText: 'Alamat',
                    icon: Icons.home),
                const SizedBox(
                  height: 50,
                ),
                loading == false
                    ? InkWell(
                        onTap: () async {
                          if (idNumberC!.text.isEmpty) {
                            customSnackbar(
                                type: 'error',
                                title: 'Kesalahan',
                                text: 'Nomor KTP tidak boleh kosong');
                          } else if (nameC!.text.isEmpty) {
                            customSnackbar(
                                type: 'error',
                                title: 'Kesalahan',
                                text: 'Nama tidak boleh kosong');
                          } else if (birthdateC!.text.isEmpty) {
                            customSnackbar(
                                type: 'error',
                                title: 'Kesalahan',
                                text: 'Tanggal Lahir tidak boleh kosong');
                          } else if (provinceC!.text.isEmpty) {
                            customSnackbar(
                                type: 'error',
                                title: 'Kesalahan',
                                text: 'Provinsi tidak boleh kosong');
                          } else if (cityC!.text.isEmpty) {
                            customSnackbar(
                                type: 'error',
                                title: 'Kesalahan',
                                text: 'Kota tidak boleh kosong');
                          } else if (kecamatanC!.text.isEmpty) {
                            customSnackbar(
                                type: 'error',
                                title: 'Kesalahan',
                                text: 'Kecamatan tidak boleh kosong');
                          } else if (addressC!.text.isEmpty) {
                            customSnackbar(
                                type: 'error',
                                title: 'Kesalahan',
                                text: 'Alamat tidak boleh kosong');
                          } else {
                            await sharedPreferencesManager.setString(
                                SharedPreferencesManager.nomorKTP,
                                idNumberC!.text);
                            await sharedPreferencesManager.setString(
                                SharedPreferencesManager.nama, nameC!.text);
                            await sharedPreferencesManager.setString(
                                SharedPreferencesManager.tgllahir,
                                birthdateC!.text);
                            await sharedPreferencesManager.setString(
                                SharedPreferencesManager.provinsiid,
                                provinceC!.text);
                            await sharedPreferencesManager.setString(
                                SharedPreferencesManager.kotaid, cityC!.text);
                            await sharedPreferencesManager.setString(
                                SharedPreferencesManager.kecamatan,
                                kecamatanC!.text);
                            await sharedPreferencesManager.setString(
                                SharedPreferencesManager.alamat,
                                addressC!.text);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterMakeAccountPage()),
                            );
                          }
                        },
                        child: Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(
                                    right: 20.0, left: 20.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 70),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFF85014e),
                                ),
                                child: const Text(
                                  'Lanjutkan',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    : InkWell(
                        onTap: () {},
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                              right: 20.0,
                              left: 20.0,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 70),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey),
                            child: Center(
                              child: SizedBox(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                                height: 2.h,
                                width: 4.w,
                              ),
                            )),
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }

  bool? loading = false;
}
