import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/ppob/ppobsucces.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class PinPpob extends StatefulWidget {
  bool isScan;

  PinPpob({Key? key, required this.isScan}) : super(key: key);

  @override
  State<PinPpob> createState() => _PinPpobState();
}

class _PinPpobState extends State<PinPpob> {
  String _pinValue = '';

  @override
  void initState() {
    super.initState();
  }

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (builder) {
              return Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(27.0),
                          topRight: Radius.circular(27.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Center(
                          child: Container(
                            width: 25.w,
                            height: 1.h,
                            margin: EdgeInsets.only(top: 1.h),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: const Text(
                            'Masukkan PIN Kamu',
                            textAlign: TextAlign.center,
                            style: TextStyling.titleStyle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30.w, right: 30.w, top: 3.h, bottom: 3.h),
                          height: 15.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/logon.jpg'))),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 8.w, right: 8.w, top: 3.h, bottom: 5.h),
                          child: const Text(
                              'Lörem ipsum spemybelt tick, gödeskapet om lavaktig.Lörem ipsum spemybelt tick, gödeskapet om lavaktig.',
                              textAlign: TextAlign.center,
                              style: TextStyling.normal15grey),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(
                                  right: 20.0, left: 20.0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 70),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFF85014e)),
                              child: const Text(
                                'Tetap Disini',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              )),
                        ),
                        SizedBox(height: 1.h),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context, true);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(
                                  right: 20.0, left: 20.0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 70),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey),
                              child: const Text(
                                'Kembali',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              );
            });
        return shouldPop!;
      },
      child: Scaffold(
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
                        fit: BoxFit.contain,
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
                    await sharedPreferencesManager.setString(
                        SharedPreferencesManager.pin, pin);

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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PpobSuccess(isScan: widget.isScan)),
                  );
                  if (_pinValue.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PpobSuccess(isScan: widget.isScan)),
                    );
                  } else {
                    customSnackbar(
                        type: 'error',
                        title: 'error',
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
                    child: const Text(
                      'Konfirmasi Pembelian',
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
