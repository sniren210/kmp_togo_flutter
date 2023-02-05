import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/providers/apitext/providerapitext.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../helpers/shared_pref_manager.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with WidgetsBindingObserver {
  PageController controller = PageController();
  bool? lastpage = false;

  // @override
  // void dispose() {
  //   controller.dispose();
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  String? routeLogin;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final getApiTextLogin =
          Provider.of<ProviderApiText>(context, listen: false);
      await getApiTextLogin.getTextOnboarding1(context);
      await getApiTextLogin.getTextOnboarding2(context);
      await getApiTextLogin.getTextOnboarding3(context);
      await getApiTextLogin.getTextOnboarding4(context);
      cektanggal();
      // await _getkategoriProvider.getMyNFT(context);
    });
    WidgetsBinding.instance.addObserver(this);

    controller = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

  AppLifecycleState? _notification;
  String? tanggalAA;

  cektanggal() async {
    String? tanggalShare = sharedPreferencesManager
        .getString(SharedPreferencesManager.tanggalogout);
    // print('halo pak : $tanggalShare');
    var now = DateTime.now();

    String? cekAda;
    for (var i = 0; i < 25; i++) {
      DateTime pastMonth = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour - i,
      );
      String? passday = pastMonth.toString().substring(0, 13);
      // print('passday  = ${passday}');
      // print('tanngal share : $tanggalShare');
      if (tanggalShare == passday) {
        // print('masih login');
        setState(() {
          cekAda = 'ada';
        });
      } else {
        // print('masih cari');
      }
    }
    if (cekAda == 'ada') {
      print('login');
    } else {
      sharedPreferencesManager.setBool("isLoggedIn", false);
      print('logout');
    }
    // if (tanggalShare == passday) {
    //   print('masih di tanggal yang sama');
    // } else {
    //   print('logout');
    // }
  }

  gettanggaNow() async {
    var now = DateTime.now();
    String nowSplit = now.toString();
    // String nowSplit = now.toString().substring(0, 10);

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
    // if (mounted) {
    //   setState(() {
    //     tanggalAA = passday;
    //   });
    // }
    print('asasas $tanggalAA');
    await sharedPreferencesManager.setString(
        SharedPreferencesManager.tanggalogout, tanggalAA!);
    await sharedPreferencesManager.setString(
        SharedPreferencesManager.tanggalbanner, tanggalAA!);
    // tanggalAA = sharedPreferencesManager.getString("tanggalogout");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    _notification = state;
    print('qwerty : $_notification');
    // setState(() {
    // AppLifecycleState.inactive;

    if (_notification == AppLifecycleState.detached) {
      gettanggaNow();
    } else if (_notification == AppLifecycleState.inactive) {
      gettanggaNow();
    }
    //  else if (_notification == AppLifecycleState.paused) {
    //   gettanggaNow();
    // }
    // });
  }

  Color? warna = const Color(0xFF85014e);
  bool _visible = true;

  void _onScroll() {
    setState(() {
      _visible = false;
    });
    if (controller.page!.toInt() == controller.page) {
      print('GOTO: ${controller.page!.toInt()}');
      _visible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderApiText>(builder: (context, v, child) {
      print("hello ${v.dataApiTextObaroding1}");
      return Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                lastpage = index == 3;

                if (index == 0) {
                  setState(() {
                    // _visible = true;
                    warna = const Color(0xFF85014e);
                  });
                } else if (index == 1) {
                  setState(() {
                    // _visible = true;
                    warna = const Color(0xFFE8BD0C);
                  });
                } else if (index == 2) {
                  setState(() {
                    // _visible = true;
                    warna = Colors.black;
                  });
                } else if (index == 3) {
                  setState(() {
                    // _visible = true;
                    warna = const Color(0xFFA0E2C1);
                  });
                }
              });
            },
            children: [
              Container(
                color: const Color(0xFF85014e),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 30.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                  v.dataApiTextObaroding1?.data?.imagePath ??
                                      ""))),
                    ),
                    buildContent(
                        '', v.dataApiTextObaroding1?.data?.value ?? ""),
                    buildButton(false),
                  ],
                ),
              ),
              Container(
                color: const Color(0xFFE8BD0C),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 30.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                  v.dataApiTextObaroding2?.data?.imagePath ??
                                      ""))),
                    ),
                    buildContent('COIN To-Go',
                        v.dataApiTextObaroding2?.data?.value ?? ""),
                    buildButton(false),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 30.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                  v.dataApiTextObaroding3?.data?.imagePath ??
                                      ""))),
                    ),
                    buildContent('NFT MARKETPLACE',
                        v.dataApiTextObaroding3?.data?.value ?? ""),
                    buildButton(false),
                  ],
                ),
              ),
              Container(
                color: const Color(0xFFA0E2C1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 30.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                v.dataApiTextObaroding4?.data?.imagePath ?? "",
                              ))),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "UMKM MARKETPLACE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Text(
                        v.dataApiTextObaroding4?.data?.value ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // color: const Color(0xFF85014e),
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 13.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SmoothPageIndicator(
                        controller: controller, // PageController
                        count: 4,
                        effect: ExpandingDotsEffect(
                          dotHeight: 12,
                          dotWidth: 12,
                          dotColor: Colors.grey.shade500,
                          // activeDotColor: Color(0xFF85014e),
                          activeDotColor: const Color(0xFF0ACBE3),
                        ), // your preferred effect
                        onDotClicked: (index) {
                          controller.animateToPage(index,
                              duration: const Duration(microseconds: 500),
                              curve: Curves.easeInOut);
                        }),
                    Container(
                      height: 200,
                      // width: MediaQuery.of(context).size.width,
                      // color: const Color(0xFFFFFF),
                      // padding: EdgeInsets.only(bottom: 50),
                      // color: Colors.white,
                      color: Colors.transparent,
                      child: Stack(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Positioned(
                            top: 50,
                            // alignment: Alignment.bottomLeft,
                            child: InkWell(
                              onTap: () {
                                bool login = true, loginKeyExists = false;

                                loginKeyExists = sharedPreferencesManager
                                    .isKeyExists("isLoggedIn");

                                if (loginKeyExists) {
                                  login = sharedPreferencesManager
                                      .getBool("isLoggedIn")!;

                                  if (login) {
                                    routeLogin = '/home';
                                    debugPrint(routeLogin);
                                  }

                                  if (!login) {
                                    routeLogin = '/login';
                                    debugPrint(routeLogin);
                                  }
                                  Get.offAllNamed(routeLogin!);
                                } else {
                                  routeLogin = '/';
                                  debugPrint(routeLogin);
                                  Get.offAllNamed('/login');
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 50.0, bottom: 50, top: 120),
                                child: Text(
                                  'Skip',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: const Color(0xFF717171),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.sp),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                bool login = true, loginKeyExists = false;

                                loginKeyExists = sharedPreferencesManager
                                    .isKeyExists("isLoggedIn");

                                if (loginKeyExists) {
                                  login = sharedPreferencesManager
                                      .getBool("isLoggedIn")!;

                                  if (login) {
                                    routeLogin = '/home';
                                    debugPrint(routeLogin);
                                  }

                                  if (!login) {
                                    routeLogin = '/login';
                                    debugPrint(routeLogin);
                                  }
                                  Get.offAllNamed(routeLogin!);
                                } else {
                                  routeLogin = '/';
                                  debugPrint(routeLogin);
                                  Get.offAllNamed('/login');
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 100),
                                padding: const EdgeInsets.all(5),
                                height: 85,
                                width: 85,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 85,
                                  width: 85,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: warna),
                                  child: Container(
                                    height: 85,
                                    width: 85,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // bottomSheet:
        // Container(
        //   height: 200,
        //   width: MediaQuery.of(context).size.width,
        //   // color: const Color(0xFFFFFF),
        //   // padding: EdgeInsets.only(bottom: 50),
        //   // color: Colors.white,
        //   color: warna,
        //   child: Stack(
        //     // mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       Align(
        //         alignment: Alignment.bottomLeft,
        //         child: InkWell(
        //           onTap: () {
        //             controller.jumpToPage(3);
        //           },
        //           child: Container(
        //             margin: const EdgeInsets.only(left: 50.0, bottom: 50),
        //             child: Text(
        //               'Skip',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                   color: Color(0xFF717171),
        //                   fontWeight: FontWeight.normal,
        //                   fontSize: 12.sp),
        //             ),
        //           ),
        //         ),
        //       ),
        //       Center(
        //         child: InkWell(
        //           onTap: () {
        //             controller.nextPage(
        //                 duration: const Duration(milliseconds: 500),
        //                 curve: Curves.easeInOut);
        //           },
        //           child: Container(
        //             padding: EdgeInsets.all(5),
        //             height: 85,
        //             width: 85,
        //             decoration: BoxDecoration(
        //                 shape: BoxShape.circle, color: Colors.white),
        //             child: Container(
        //               padding: EdgeInsets.all(10),
        //               height: 85,
        //               width: 85,
        //               decoration:
        //                   BoxDecoration(shape: BoxShape.circle, color: warna),
        //               child: Container(
        //                 height: 85,
        //                 width: 85,
        //                 decoration: BoxDecoration(
        //                     shape: BoxShape.circle, color: Colors.green),
        //                 child: Icon(
        //                   Icons.arrow_forward,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        // lastpage == false
        //     ? InkWell(
        //         onTap: () {
        //           controller.nextPage(
        //               duration: const Duration(milliseconds: 500),
        //               curve: Curves.easeInOut);
        //         },
        //         child: Container(
        //             margin: const EdgeInsets.only(right: 20.0),
        //             padding: const EdgeInsets.symmetric(
        //                 vertical: 15, horizontal: 70),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(5),
        //               color: const Color(0xFF85014e),
        //             ),
        //             child: Text(
        //               'Mulai',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.normal,
        //                   fontSize: 12.sp),
        //             )),
        //       )
        //     : InkWell(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const LoginPages()),
        //           );
        //         },
        //         child: Container(
        //             margin: const EdgeInsets.only(right: 20.0),
        //             padding: const EdgeInsets.symmetric(
        //                 vertical: 15, horizontal: 70),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(5),
        //               color: const Color(0xFF85014e),
        //             ),
        //             child: Text(
        //               'Login',
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.normal,
        //                   fontSize: 12.sp),
        //             )),
        //       ),
        // ],
        // ),
        // ),
      );
    });
  }

  buildButton(bool isLast) {
    return Column(
      children: [
        SmoothPageIndicator(
            controller: controller, // PageController
            count: 4,
            effect: ExpandingDotsEffect(
              dotHeight: 12,
              dotWidth: 12,
              dotColor: _visible ? Colors.grey.shade500 : Colors.transparent,
              // activeDotColor: Color(0xFF85014e),
              activeDotColor:
                  _visible ? const Color(0xFF0ACBE3) : Colors.transparent,
            ), // your preferred effect
            onDotClicked: (index) {
              controller.animateToPage(index,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.easeInOut);
            }),
        Container(
          height: 200,
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned(
                top: 50,
                child: InkWell(
                  onTap: () {
                    checkStatusLogin();
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 50.0, bottom: 50, top: 120),
                    child: Text(
                      'Skip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: _visible
                              ? const Color(0xFF717171)
                              : Colors.transparent,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp),
                    ),
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    _visible = !_visible;

                    if (isLast) {
                      checkStatusLogin();
                    } else {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 100),
                    padding: const EdgeInsets.all(5),
                    height: 85,
                    width: 85,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _visible ? Colors.white : Colors.transparent),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _visible ? warna : Colors.transparent),
                      child: Container(
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _visible ? Colors.green : Colors.transparent),
                        child: Icon(
                          Icons.arrow_forward,
                          color: _visible ? Colors.white : Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildContent(String title, String content) {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          margin: const EdgeInsets.all(20.0),
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 13.sp),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  void checkStatusLogin() {
    bool login = true, loginKeyExists = false;

    loginKeyExists = sharedPreferencesManager.isKeyExists("isLoggedIn");

    if (loginKeyExists) {
      login = sharedPreferencesManager.getBool("isLoggedIn")!;

      if (login) {
        routeLogin = '/home';
        debugPrint(routeLogin);
      }

      if (!login) {
        routeLogin = '/login';
        debugPrint(routeLogin);
      }
      Get.offAllNamed(routeLogin!);
    } else {
      routeLogin = '/';
      debugPrint(routeLogin);
      Get.offAllNamed('/login');
    }
  }
}
