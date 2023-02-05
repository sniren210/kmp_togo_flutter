import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerNewAccountPage.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerUserTypePage.dart';
import 'package:kmp_togo_mobile/pages/common/takePictures.dart';
import 'package:kmp_togo_mobile/pages/wallet/withdraw/withdrawsuccess.dart';
import 'package:kmp_togo_mobile/providers/wallet/withdraw/providerwallet.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class OtpWithDraw extends StatefulWidget {
  int? amount, nomor;
  OtpWithDraw({Key? key, this.amount, this.nomor});

  @override
  State<OtpWithDraw> createState() => _OtpWithDrawState();
}

class _OtpWithDrawState extends State<OtpWithDraw> {
  String? otpValue = '';

  @override
  void initState() {
    super.initState();
  }

  bool? loading = false;

  submitKirim(String? pinAA) async {
    if (pinAA == '') {
      setState(() {
        pinKosong = true;
      });
    } else {
      setState(() {
        loading = true;
      });
      print(widget.amount);
      print(widget.nomor);
      await Provider.of<ProviderWithDraw>(context, listen: false)
          .sendwithdraw(context, widget.amount, widget.nomor, pinAA);
      setState(() {
        loading = Provider.of<ProviderWithDraw>(context, listen: false).loading;
      });
    }
  }

  bool? pinKosong = false;

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40, top: 70),
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/logon.jpg'))),
            ),
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Masukkan PIN Kamu',
              textAlign: TextAlign.center,
              style: TextStyling.titleStyle,
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  Text(
                      'Pin ini digunakan untuk, Lörem ipsum mar hälsolitteracitet i nirat. Gijånade homosm.',
                      textAlign: TextAlign.center,
                      style: TextStyling.normal15grey),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Pinput(
                length: 6,
                obscureText: true,
                onChanged: (pin) async {
                  setState(() {
                    otpValue = pin;
                  });

                  await sharedPreferencesManager.setString(
                      SharedPreferencesManager.pin, otpValue.toString());
                },
              ),
            ),
            pinKosong == false
                ? Container()
                : Container(
                    margin: EdgeInsets.only(
                      left: 3.w,
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 3.w),
                            child: Text(
                              "Saldo tidak boleh kosong!",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 138, 111, 111),
                                  fontSize: 9.sp),
                            )),
                      ],
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            loading == false
                ? InkWell(
                    onTap: () {
                      submitKirim(otpValue);
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 70),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFF85014e)),
                        child: const Text(
                          'Konfirmasi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        )),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade500),
                    child: const Text(
                      'Waiting...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    )),
          ],
        ),
      ),
    );
  }

  _textFieldOTP({bool? first, last, required TextEditingController cc}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
      height: 60.0,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          autofocus: true,
          controller: cc,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }

            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyling.bold24grey,
          maxLength: 1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.black12),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.brown),
                  borderRadius: BorderRadius.circular(12))),
        ),
      ),
    );
  }
}
