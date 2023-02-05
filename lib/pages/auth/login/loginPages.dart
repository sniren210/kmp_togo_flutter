import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/pages/auth/login/lupapassword.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerPage.dart';
import 'package:kmp_togo_mobile/providers/apitext/providerapitext.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_auth.dart';
import 'package:kmp_togo_mobile/providers/database/database.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final _formKey = GlobalKey<FormState>();
  bool passhide = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  CountdownTimerController? Coundowncontroller;
  String? endTime;
  bool pinaltytime = false;
  bool bannedtime = false;
  // int wrongLogin = 0;
  bool? loading = false;

  // startcoundown() {
  //   endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 65;
  //   setState(() {
  //     Coundowncontroller =
  //         CountdownTimerController(endTime: endTime!, onEnd: onEnd);
  //   });
  // }

  // validatePassword() {
  //   setState(() {
  //     wrongLogin++;

  //     if (wrongLogin == 3) {
  //       pinaltytime = true;
  //       startcoundown();
  //     }
  //     if (wrongLogin == 5) {
  //       setState(() {
  //         bannedtime = true;
  //         pinaltytime = false;
  //       });
  //     }
  //     debugPrint(wrongLogin.toString());
  //   });
  // }
  String? tanggalAA;
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      await Provider.of<ProviderAuthLogin>(context, listen: false)
          .login(context, nameController.text, passcontroller.text);
      var now = DateTime.now();
      String nowSplit = now.toString();
      DateTime pastMonth = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour,
      );
      String? passday = pastMonth.toString().substring(0, 13);
      // String? passday = pastMonth.toString().substring(0, 16);
      print('asasas $passday');
      tanggalAA = passday;

      print('asasas $tanggalAA');
      await sharedPreferencesManager.setString(
          SharedPreferencesManager.tanggalogout, tanggalAA!);
      // await sharedPreferencesManager.setString(
      //     SharedPreferencesManager.tanggalbanner, tanggalAA!);
      setState(() {
        loading =
            Provider.of<ProviderAuthLogin>(context, listen: false).loading;
        bannedtime =
            Provider.of<ProviderAuthLogin>(context, listen: false).statusbanned;
        pinaltytime =
            Provider.of<ProviderAuthLogin>(context, listen: false).statususpen;
        endTime = Provider.of<ProviderAuthLogin>(context, listen: false).time;
      });
      if (bannedtime == true) {
        final _getApiTextLogin =
            Provider.of<ProviderApiText>(context, listen: false);
        await _getApiTextLogin.getTextHubungiCS(context);
      }
      // if (wrongLogin == 3) {
      //   setState(() {
      //     showWronglogin = true;
      //   });
      // }
    }
  }

  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  void onEnd() {
    debugPrint('onEnd');
    setState(() {
      pinaltytime = false;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('cart_items');
      prefs.remove('item_quantity');
      prefs.remove('total_price');

      AppDb().emptyCart();

      _focusNodes.forEach((node) {
        node.addListener(() {
          setState(() {});
        });
      });

      final _getApiTextLogin =
          Provider.of<ProviderApiText>(context, listen: false);
      await _getApiTextLogin.getTextLogin(context);
      await _getApiTextLogin.getTextHubungiCS(context);
      // await _getkategoriProvider.getMyNFT(context);
    });
    super.initState();
  }

  // void whatsAppOpen(String? nomor) async {
  //   await FlutterLaunch.launchWhatsapp(phone: nomor!, message: "Hello");
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderApiText>(builder: (context, v, child) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  bannedtime == false
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    top: 7.h, left: 5.w, right: 5.w),
                                child: Text(
                                  'Selamat Datang',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.sp),
                                )),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 1.7.h,
                                  left: 5.w,
                                  right: 5.w,
                                  bottom: 2.h),
                              child: Center(
                                child: Text(
                                  v.dataApiText?.data?.value ?? "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11.5.sp),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        )
                      : Container(
                          padding: const EdgeInsets.only(top: 70),
                        ),
                  bannedtime == true
                      ? Container()
                      : Container(
                          margin: const EdgeInsets.only(right: 20.0, left: 20),
                          child: TextFormField(
                            focusNode: _focusNodes[0],
                            controller: nameController,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20),
                              prefixIcon: Icon(
                                Icons.person,
                                color: _focusNodes[0].hasFocus
                                    ? Color(0xFF85014e)
                                    : Colors.grey.shade400,
                                size: 7.w,
                              ),
                              hintText: "Please Enter Username",
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF85014e),
                                ),
                              ),
                            ),
                            validator: (username) {
                              if (username!.isEmpty) {
                                return "You must enter username";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                  bannedtime == true
                      ? Container()
                      : Container(
                          padding: const EdgeInsets.only(top: 20),
                          margin: const EdgeInsets.only(right: 20.0, left: 20),
                          child: TextFormField(
                            obscureText: passhide,
                            focusNode: _focusNodes[1],
                            controller: passcontroller,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: _focusNodes[1].hasFocus
                                      ? Color(0xFF85014e)
                                      : Colors.grey.shade400,
                                  size: 7.w,
                                ),
                                labelText: "Please Enter Password",
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      passhide
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: _focusNodes[1].hasFocus
                                          ? Color(0xFF85014e)
                                          : Colors.grey.shade400,
                                      size: 7.w,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        passhide = !passhide;
                                      });
                                    })),
                            validator: (password) {
                              if (password!.isEmpty) {
                                return "You must enter password";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20, top: 15, bottom: 10),
                    child: bannedtime == true
                        ? Container()
                        : InkWell(
                            onTap: () {
                              Get.to(LupaPassword());
                            },
                            child: const Text(
                              'Lupa Password?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            ),
                          ),
                  ),
                  bannedtime == true
                      ? Container()
                      : loading == false
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, top: 40),
                              child: InkWell(
                                onTap: () {
                                  _submit();
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 70),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: const Color(0xFF85014e)),
                                  child: const Text(
                                    'Login',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {},
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(
                                      right: 20.0, left: 20.0, top: 40),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 70),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
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
                  pinaltytime == true
                      ? Column(
                          children: [
                            SizedBox(
                              height: 4.h,
                            ),
                            Center(
                              child: Container(
                                child: Text(
                                  'Login terkunci coba lagi dalam 1 jam',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11.sp),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            // Center(
                            //   child: Container(
                            //       child: endTime == 'null'
                            //           ? Container()
                            //           : Text(endTime ?? "")
                            //       //  CountdownTimer(
                            //       //   controller: Coundowncontroller,
                            //       //   onEnd: onEnd,
                            //       //   endTime: endTime,
                            //       // ),
                            //       ),
                            // ),
                          ],
                        )
                      : Container(),
                  bannedtime == true
                      ? Column(
                          children: [
                            Center(
                              child: Container(
                                child: const Text(
                                  'Akun Anda Terblokir',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Container(
                                child: const Text(
                                  'Silahkan menghubungi CS untuk mengkonfirmasi pengembalian akun anda.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  bannedtime == true
                      ? InkWell(
                          onTap: () {
                            // var url =
                            //     "https://wa.me/${v.dataApiHubungiCS?.data?.value}?text=YourTextHere";
                            // var url =
                            //     "https://wa.me/15551234567?text=Haloo%20saya%20in%20mau%20tanya";
                            // final Uri _url = Uri.parse(
                            //     'https://wa.me/${v.dataApiHubungiCS?.data?.value}?text=Haloo%20saya%20in%20mau%20tanya');
                            // final Uri _url = Uri.parse(
                            //     'https://wa.me/${v.dataApiHubungiCS?.data?.value}/?text=Haloo%20saya%20in%20mau%20tanya');
                            // final Uri _url = Uri.parse(
                            //     'https://api.whatsapp.com/send/?phone=${v.dataApiHubungiCS?.data?.value}');

                            whatsApp(v.dataApiHubungiCS?.data?.value ?? "");

                            // whatsAppOpen(v.dataApiHubungiCS?.data?.value);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, top: 30),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 70),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFF85014e)),
                              child: const Text(
                                'Hubungi CS',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              )),
                        )
                      : Container(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun? ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 11.5.sp),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()),
                            );
                          },
                          child: Text(
                            ' Daftar disini',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF85014e),
                                fontWeight: FontWeight.bold,
                                fontSize: 11.5.sp),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  whatsApp(String a) {
    return launchUrl(
      Uri.parse(
        // 'whatsapp://send?phone=1234567890', //put your number here
        // 'whatsapp://send?phone=$a' //put your number here
        'whatsapp://send?phone=$a', //put your number here
      ),
    );
  }
}
