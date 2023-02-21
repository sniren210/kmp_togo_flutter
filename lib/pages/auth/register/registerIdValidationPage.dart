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

  TextEditingController? idNumberC,
      nameC,
      birthdateC,
      cityC,
      provinceC,
      kecamatanC,
      birthPlaceC,
      addressC,
      religionC,
      statusC,
      workC,
      genderC,
      nationnalityC,
      villageC,
      rtC,
      rwC;

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
    String? birthPlace =
        sharedPreferencesManager.getString(SharedPreferencesManager.birthPlace);
    String? religion =
        sharedPreferencesManager.getString(SharedPreferencesManager.religion);
    String? status =
        sharedPreferencesManager.getString(SharedPreferencesManager.status);
    String? work =
        sharedPreferencesManager.getString(SharedPreferencesManager.work);
    String? gender =
        sharedPreferencesManager.getString(SharedPreferencesManager.gender);
    String? nationnality = sharedPreferencesManager
        .getString(SharedPreferencesManager.nationnality);
    String? village =
        sharedPreferencesManager.getString(SharedPreferencesManager.village);
    String? rt =
        sharedPreferencesManager.getString(SharedPreferencesManager.rt);
    String? rw =
        sharedPreferencesManager.getString(SharedPreferencesManager.rw);

    idNumberC = TextEditingController(text: nik);
    nameC = TextEditingController(text: name);
    birthdateC = TextEditingController(text: birthdate);
    cityC = TextEditingController(text: city);
    provinceC = TextEditingController(text: province);
    kecamatanC = TextEditingController(text: kecamatan);
    addressC = TextEditingController(text: address);
    birthPlaceC = TextEditingController(text: birthPlace);
    religionC = TextEditingController(text: religion);
    statusC = TextEditingController(text: status);
    workC = TextEditingController(text: work);
    genderC = TextEditingController(text: gender);
    nationnalityC = TextEditingController(text: nationnality);
    villageC = TextEditingController(text: village);
    rtC = TextEditingController(text: rt);
    rwC = TextEditingController(text: rw);
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
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
                    isReadOnly: true,
                    controller: birthPlaceC!,
                    inputType: TextInputType.text,
                    hintText: "Tempat Lahir",
                    icon: Icons.date_range),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    enable: false,
                    isReadOnly: true,
                    controller: religionC!,
                    inputType: TextInputType.text,
                    hintText: "Agama",
                    icon: Icons.date_range),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    enable: false,
                    isReadOnly: true,
                    controller: statusC!,
                    inputType: TextInputType.text,
                    hintText: "Status perkawinan",
                    icon: Icons.date_range),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    enable: false,
                    isReadOnly: true,
                    controller: workC!,
                    inputType: TextInputType.text,
                    hintText: "Pekerjaan",
                    icon: Icons.date_range),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    enable: false,
                    isReadOnly: true,
                    controller: genderC!,
                    inputType: TextInputType.text,
                    hintText: "Jenis kelamin",
                    icon: Icons.date_range),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    enable: false,
                    controller: nationnalityC!,
                    inputType: TextInputType.text,
                    hintText: 'Kewarganegaraan',
                    icon: Icons.house),
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
                    hintText: 'Kecamatan',
                    icon: Icons.house),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                    enable: false,
                    isReadOnly: true,
                    controller: villageC!,
                    inputType: TextInputType.text,
                    hintText: 'Desa',
                    icon: Icons.house),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                  enable: false,
                  isReadOnly: true,
                  controller: rtC!,
                  inputType: TextInputType.text,
                  hintText: 'RT',
                  icon: Icons.house,
                ),
                const SizedBox(
                  height: 8,
                ),
                FormInput(
                  enable: false,
                  isReadOnly: true,
                  controller: rwC!,
                  inputType: TextInputType.text,
                  hintText: 'RW',
                  icon: Icons.house,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 8,
                ),
                FormInputLongText(
                    // enable: false,
                    // readOnly: true,
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
