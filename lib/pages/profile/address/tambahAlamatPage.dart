import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/formInputField.dart';
import 'package:kmp_togo_mobile/models/modelkecamatan.dart';
import 'package:kmp_togo_mobile/models/modelkota.dart';
import 'package:kmp_togo_mobile/models/modelprovinsi.dart';
import 'package:kmp_togo_mobile/pages/common/splashPage.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_register.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../helpers/injector.dart';
import '../../../../helpers/shared_pref_manager.dart';
import '../../../../helpers/ui_helper/custom_snackbar.dart';

class TambahAlamatPage extends StatefulWidget {
  const TambahAlamatPage({Key? key}) : super(key: key);

  @override
  State<TambahAlamatPage> createState() => _TambahAlamatPageState();
}

class _TambahAlamatPageState extends State<TambahAlamatPage> {
  GlobalKey? _formKey;
  var currentSelectedValueProvinsi;
  var currentSelectedValueKota;
  var currentSelectedValueKecamatan;

  TextEditingController? placeNameC,
      contactNameC,
      phoneNumberC,
      postalCodeNumberC,
      cityC,
      provinceC,
      subdisticC,
      addressC;

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  @override
  void initState() {
    placeNameC = TextEditingController();
    contactNameC = TextEditingController();
    phoneNumberC = TextEditingController();
    postalCodeNumberC = TextEditingController();
    cityC = TextEditingController();
    provinceC = TextEditingController();
    subdisticC = TextEditingController();
    addressC = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final _getkategoriProvider =
          Provider.of<ProviderRegister>(context, listen: false);
      await _getkategoriProvider.getProvinsi(context);
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Tambah Alamat'),
      ),
      body: Consumer<ProviderRegister>(
          builder: (BuildContext context, v, Widget? child) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  FormInput(
                      controller: placeNameC!,
                      inputType: TextInputType.text,
                      hintText: 'Nama Tempat',
                      icon: Icons.home),
                  const SizedBox(
                    height: 8,
                  ),
                  FormInput(
                      controller: contactNameC!,
                      inputType: TextInputType.text,
                      hintText: 'Nama Kontak',
                      icon: Icons.person),
                  const SizedBox(
                    height: 8,
                  ),
                  FormInput(
                      controller: phoneNumberC!,
                      inputType: TextInputType.number,
                      hintText: 'Nomer Telepon / HP',
                      icon: Icons.contact_phone),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8),
                            child:
                                Icon(Icons.location_city, color: Colors.grey),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text(
                                  "  Pilih Provinsi",
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                items: v.dataProvinsi?.data
                                    ?.map<DropdownMenuItem<String>>(
                                        (DataProvinsi valuee) {
                                  return DropdownMenuItem<String>(
                                    value: valuee.provinceId ?? "",
                                    child: Text(
                                      '   ${valuee.province}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    currentSelectedValueProvinsi = newValue;
                                  });
                                  cekKota(newValue);
                                },
                                value: currentSelectedValueProvinsi,
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8),
                            child:
                                Icon(Icons.location_city, color: Colors.grey),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text(
                                  "  Pilih Kota / Kabupaten",
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                items: v.dataKota?.data
                                    ?.map<DropdownMenuItem<String>>(
                                        (DataKota valuee) {
                                  return DropdownMenuItem<String>(
                                    value: valuee.cityId ?? "",
                                    child: Text(
                                      '   ${valuee.cityName}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    currentSelectedValueKota = newValue;
                                    // getCekData();
                                  });
                                  cekKecamatan(newValue);
                                },
                                value: currentSelectedValueKota,
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8),
                            child:
                                Icon(Icons.location_city, color: Colors.grey),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Text(
                                  "  Pilih Kecamatan / Desa",
                                  style: TextStyle(fontSize: 10.sp),
                                ),
                                items: v.dataKecamatan?.data
                                    ?.map<DropdownMenuItem<String>>(
                                        (DataKecamatan valuee) {
                                  return DropdownMenuItem<String>(
                                    value: valuee.subdistrictId ?? "",
                                    child: Text(
                                      '   ${valuee.subdistrictName}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    currentSelectedValueKecamatan = newValue;
                                    // getCekData();
                                  });
                                },
                                value: currentSelectedValueKecamatan,
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FormInputLongText(
                      controller: addressC!,
                      hintText: 'Alamat',
                      icon: Icons.email_outlined),
                  const SizedBox(
                    height: 8,
                  ),
                  FormInput(
                      controller: postalCodeNumberC!,
                      inputType: TextInputType.number,
                      hintText: 'Kode Pos',
                      maxInputLength: 6,
                      icon: Icons.location_city),
                  const SizedBox(
                    height: 70,
                  ),
                  loading == false
                      ? InkWell(
                          onTap: () async {
                            if (currentSelectedValueProvinsi == null) {
                              customSnackbar(
                                  type: 'error',
                                  title: 'Data Provinsi',
                                  text: 'Provinsi tidak boleh kosong');
                            } else if (currentSelectedValueKota == null) {
                              customSnackbar(
                                  type: 'error',
                                  title: 'Data Kota',
                                  text: 'Kota tidak boleh kosong');
                            } else if (currentSelectedValueKecamatan == null) {
                              customSnackbar(
                                  type: 'error',
                                  title: 'Data Kecamatan',
                                  text: 'Kecamatan tidak boleh kosong');
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SplashPage(
                                          pinValue: sharedPreferencesManager
                                                  .getString(
                                                      SharedPreferencesManager
                                                          .pin) ??
                                              '',
                                          title: 'Berhasil Menambahkan',
                                          subtitle: '',
                                          provRepo: 'addressNew',
                                          nextPage: Home(selectedIndex: 3),
                                          isReplace: true,
                                          isUpdate: false,
                                          name: placeNameC!.text,
                                          contactName: contactNameC!.text,
                                          phoneNumber: phoneNumberC!.text,
                                          detailAddress: addressC!.text,
                                          provinceId: int.parse(
                                              currentSelectedValueProvinsi),
                                          cityId: int.parse(
                                              currentSelectedValueKota),
                                          subdistrictId: int.parse(
                                              currentSelectedValueKecamatan),
                                          postalCode: postalCodeNumberC!.text,
                                        )),
                              );
                            }
                          },
                          child: Container(
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
                                'Simpan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              )),
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
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                  height: 2.h,
                                  width: 4.w,
                                ),
                              )),
                        ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  bool? loading = false;
}
