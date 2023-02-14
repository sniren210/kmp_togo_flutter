import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
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
      if (tanggalShare == passday) {
        setState(() {
          cekAda = 'ada';
        });
      } else {
        debugPrint('masih cari');
      }
    }
    if (cekAda == 'ada') {
      debugPrint('login');
    } else {
      sharedPreferencesManager.setBool("isLoggedIn", false);
      debugPrint('logout');
    }
  }

  gettanggaNow() async {
    var now = DateTime.now();
    String nowSplit = now.toString();

    DateTime pastMonth = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour,
    );
    String? passday = pastMonth.toString().substring(0, 13);
    tanggalAA = passday;
    await sharedPreferencesManager.setString(
        SharedPreferencesManager.tanggalogout, tanggalAA!);
    await sharedPreferencesManager.setString(
        SharedPreferencesManager.tanggalbanner, tanggalAA!);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    _notification = state;

    if (_notification == AppLifecycleState.detached) {
      gettanggaNow();
    } else if (_notification == AppLifecycleState.inactive) {
      gettanggaNow();
    }
  }

  Color? warna = const Color(0xFF85014e);
  bool _visible = true;

  void _onScroll() {
    setState(() {
      _visible = false;
    });
    if (controller.page!.toInt() == controller.page) {
      _visible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderApiText>(builder: (context, v, child) {
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
                    warna = const Color(0xFF85014e);
                  });
                } else if (index == 1) {
                  setState(() {
                    warna = const Color(0xFFE8BD0C);
                  });
                } else if (index == 2) {
                  setState(() {
                    warna = Colors.black;
                  });
                } else if (index == 3) {
                  setState(() {
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
                                      kEmptyImageLink))),
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
                                      kEmptyImageLink))),
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
                                      kEmptyImageLink))),
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
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 13.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SmoothPageIndicator(
                        controller: controller, 
                        count: 4,
                        effect: ExpandingDotsEffect(
                          dotHeight: 12,
                          dotWidth: 12,
                          dotColor: Colors.grey.shade500,
                          activeDotColor: const Color(0xFF0ACBE3),
                        ), 
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
