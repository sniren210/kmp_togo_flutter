import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerOtpPage.dart';
import 'package:kmp_togo_mobile/providers/apitext/providerapitext.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_register.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final getApiTextLogin =
          Provider.of<ProviderApiText>(context, listen: false);
      await getApiTextLogin.getTextRegister(context);
      // await _getkategoriProvider.getMyNFT(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderApiText>(builder: (context, v, child) {
      return SafeArea(
        child: WillPopScope(
          onWillPop: () async => true,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                      'Daftar Dengan WhatsAppmu',
                      textAlign: TextAlign.center,
                      style: TextStyling.titleStyle,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Text(
                        v.dataApiRegister?.data?.value ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(right: 20.0, left: 20),
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Row(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.phone_android_outlined),
                              Text('+62', style: TextStyling.normal15grey),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: phoneNumberC,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  fillColor: Colors.grey,
                                  suffixStyle: TextStyling.normal15grey,
                                  border: InputBorder.none,
                                  hintText: 'Masukkan Nomor WhatsApp'
                                  // labelText: 'User Name',
                                  ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(13),
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'),
                                ),
                                FilteringTextInputFormatter.deny(
                                  RegExp(r'^0+'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    loading == false
                        ? InkWell(
                            onTap: () async {
                              try {
                                if (phoneNumberC.text.startsWith('8')) {
                                  await _submit(context);
                                } else {
                                  await customSnackbar(
                                      type: 'error',
                                      title: 'Kesalahan',
                                      text: 'Nomor HP tidak valid');
                                }
                              } catch (e) {
                                debugPrint('ERROR: $e');
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
                                    color: const Color(0xFF85014e)),
                                child: const Text(
                                  'Lanjutkan',
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
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey),
                                child: Center(
                                  child: SizedBox(
                                    height: 2.h,
                                    width: 4.w,
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                    const VerticalSpacer(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Sudah punya akun? ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              ' Masuk disini',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF85014e),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  bool? loading = false;

  _submit(context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      await Provider.of<ProviderRegister>(context, listen: false)
          .request_otp(context, phoneNumberC.text, true);
    }
    setState(() {
      loading =
          Provider.of<ProviderRegister>(context, listen: false).loadingOtp;
    });
  }
}
