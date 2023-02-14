import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/pages/common/takePictures.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_register.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RegisterOtpPage extends StatefulWidget {
  const RegisterOtpPage({Key? key}) : super(key: key);

  @override
  State<RegisterOtpPage> createState() => _RegisterOtpPageState();
}

class _RegisterOtpPageState extends State<RegisterOtpPage> {
  final _formKey = GlobalKey<FormState>();
  bool? loading = false;
  String? nomorhp;

  // @override
  // void initState() {
  //   nomorhp = sharedPreferencesManager.getString("nomer_hp");
  //   _submit(context, init: 'init');
  //   Provider.of<ProviderRegister>(context, listen: false).setCountOtp(0);
  //   super.initState();
  // }

  String otpValue = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderRegister>(builder: (context, vRegister, child) {
      return WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
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
                  const Text(
                    'Masukkan Kode OTP',
                    textAlign: TextAlign.center,
                    style: TextStyling.titleStyle,
                  ),
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                            'Kami mengirimkan kode melalui WhatsApp ke nomor',
                            textAlign: TextAlign.center,
                            style: TextStyling.normal15grey),
                        Text(nomorhp ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyling.bold15grey),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Pinput(
                      length: 6,
                      onChanged: (pin) {
                        setState(() {
                          otpValue = pin;
                        });
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Tidak dapat kode? ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        ),
                        InkWell(
                          onTap: () async {
                          },
                          child: const Text(
                            ' Minta lagi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF85014e),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      if (otpValue.length >= 6) {
                        debugPrint(vRegister.countOtp.toString());
                        int count = vRegister.countOtp;
                        await vRegister.setCountOtp(count + 1);

                        final SharedPreferencesManager
                            sharedPreferencesManager =
                            locator<SharedPreferencesManager>();

                        setState(() {
                          loading = true;
                        });
                        await vRegister.validate_otp(
                            context,
                            sharedPreferencesManager.getString('nomer_hp'),
                            otpValue.toString());

                        setState(() {
                          loading = Provider.of<ProviderRegister>(context,
                                  listen: false)
                              .loadingOtp;
                        });
                        // }
                      }
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 70),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: const Color(0xFF85014e)),
                        child: const Text(
                          'Verifikasi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  bool? loadingMintaLagi = true;

  Timer? timer;
  int _start = 60;

  _submit(BuildContext context, {String? init}) async {
    if (init == null) {
      await Provider.of<ProviderRegister>(context, listen: false).request_otp(
          context,
          sharedPreferencesManager.getString('nomer_hp')!.replaceAll('+62', ''),
          false);
    }
  }
}
