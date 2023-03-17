import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/dialog_alert.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerUserTypePage.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class EnterPinRegister extends StatefulWidget {
  String? title;

  EnterPinRegister({Key? key, this.title}) : super(key: key);

  @override
  State<EnterPinRegister> createState() => _EnterPinRegisterState();
}

class _EnterPinRegisterState extends State<EnterPinRegister> {
  String _pinValue = '';

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return dialogHelper.dialogWidget(context) ?? false;
  }

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 5.h),
                height: 25.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/logon.jpg'))),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                widget.title != null ? widget.title! : 'Buat Pin Akunmu',
                textAlign: TextAlign.center,
                style: TextStyling.titleStyle,
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: const Text(
                    'Pin ini digunakan untuk, setiap transaksi yg terjadi di aplikasi.',
                    textAlign: TextAlign.center,
                    style: TextStyling.normal15grey),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Pinput(
                  length: 6,
                  obscureText: true,
                  onChanged: (pin) {
                    setState(() {
                      _pinValue = pin;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  String tglLahir = sharedPreferencesManager
                      .getString(SharedPreferencesManager.tgllahir)!
                      .trim();

                  String hari = tglLahir.substring(0, 2);
                  String bulan = tglLahir.substring(3, 5);
                  String tahun = tglLahir.substring(8, 10);

                  String tahun2 = tglLahir.substring(6, 8);

                  String expectedSamePass = hari + bulan + tahun;
                  String expectedSamePass2 = hari + bulan + tahun2;

                  if (_pinValue.isNotEmpty) {
                    if (_pinValue == expectedSamePass ||
                        _pinValue == expectedSamePass2) {
                      debugPrint('PIN1: $expectedSamePass');
                      debugPrint('PIN2: $expectedSamePass2');
                      debugPrint('PIN3: $_pinValue');

                      await customSnackbar(
                          type: 'error',
                          title: 'Kesalahan',
                          text: 'PIN tidak boleh sama dengan tanggal lahir');
                    } else {
                      debugPrint('SUKSES');
                      sharedPreferencesManager.setString(
                          SharedPreferencesManager.pin, _pinValue);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const RegisterMemberTypePage()),
                      );
                    }
                  } else {
                    await customSnackbar(
                        type: 'error',
                        title: 'Kesalahan',
                        text: 'PIN tidak boleh kosong');
                  }
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF85014e)),
                    child: Text(
                      widget.title != null
                          ? widget.title!
                          : 'Buat Masukkan Pin',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
