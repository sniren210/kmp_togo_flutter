import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/providers/apitext/providerapitext.dart';
import 'package:onboarding/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late Material materialButton;
  late int index;
  Color warna = const Color(0xFF85014e);
  String? image;
  bool? lastpage = false;
  String? routeLogin;

  List<PageModel> onboardingPagesList(ProviderApiText v) {
    return [
      PageModel(
        widget: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: v.listImageOnboarding != null &&
                  v.listImageOnboarding!.data.asMap().containsKey(0)
              ? SizedBox.shrink()
              : SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/onboard/onboard1.jpg',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                        // buildContent(
                        //     '', v.dataApiTextObaroding1?.data?.value ?? ""),
                      ],
                    ),
                  ),
                ),
        ),
      ),
      PageModel(
        widget: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: v.listImageOnboarding != null &&
                  v.listImageOnboarding!.data.asMap().containsKey(1)
              ? SizedBox.shrink()
              : SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/onboard/onboard2.jpg',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
      PageModel(
        widget: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: v.listImageOnboarding != null &&
                  v.listImageOnboarding!.data.asMap().containsKey(2)
              ? SizedBox.shrink()
              : SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/onboard/onboard3.jpg',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
      PageModel(
        widget: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: v.listImageOnboarding != null &&
                  v.listImageOnboarding!.data.asMap().containsKey(3)
              ? SizedBox.shrink()
              : SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/onboard/onboard4.jpg',
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    ];
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final getApiTextLogin =
          Provider.of<ProviderApiText>(context, listen: false);
      await getApiTextLogin.getOnboarding(context);

      setState(() {
        image = getApiTextLogin.listImageOnboarding!.data[0].imageUrl;
      });
    });

    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    bool login = sharedPreferencesManager.getBool("isLoggedIn") ?? false;

    return Material(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      color: defaultSkipButtonColor,
      child: InkWell(
        onTap: () {
          if (login) {
            routeLogin = '/home';
            debugPrint(routeLogin);
          }

          if (!login) {
            routeLogin = '/login';
            debugPrint(routeLogin);
          }
          Get.offAllNamed(routeLogin!);
        },
        child: Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle.copyWith(
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }

  Material _signupButton() {
    bool login = sharedPreferencesManager.getBool("isLoggedIn") ?? false;

    return Material(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      color: const Color(0xFF85014e),
      child: InkWell(
        onTap: () {
          if (login) {
            routeLogin = '/home';
            debugPrint(routeLogin);
          }

          if (!login) {
            routeLogin = '/login';
            debugPrint(routeLogin);
          }
          Get.offAllNamed(routeLogin!);
        },
        child: Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            login ? 'Home' : 'Login',
            style: defaultProceedButtonTextStyle.copyWith(
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderApiText>(
      builder: (context, v, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: warna,
              image: image != null
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image!),
                    )
                  : null,
            ),
            child: Onboarding(
              pages: onboardingPagesList(v),
              startPageIndex: 0,
              onPageChange: (int pageIndex) {
                index = pageIndex;

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
                      warna = const Color(0xFFA1E2C2);
                    });
                  }
                });

                if (v.listImageOnboarding != null) {
                  int indexOnboard = index + 1;

                  if (v.listImageOnboarding!.data.asMap().containsKey(0) &&
                      indexOnboard == 0) {
                    setState(() {
                      image = v.listImageOnboarding!.data[0].imageUrl;
                    });
                  } else if (v.listImageOnboarding!.data
                          .asMap()
                          .containsKey(1) &&
                      indexOnboard == 1) {
                    setState(() {
                      image = v.listImageOnboarding!.data[1].imageUrl;
                    });
                  } else if (v.listImageOnboarding!.data
                          .asMap()
                          .containsKey(2) &&
                      indexOnboard == 2) {
                    setState(() {
                      image = v.listImageOnboarding!.data[2].imageUrl;
                    });
                  } else if (v.listImageOnboarding!.data
                          .asMap()
                          .containsKey(3) &&
                      indexOnboard == 3) {
                    setState(() {
                      image = v.listImageOnboarding!.data[3].imageUrl;
                    });
                  } else {
                    setState(() {
                      image = null;
                    });
                  }
                }
              },
              footerBuilder: (context, dragDistance, pagesLength, setIndex) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          child: CircleProgressBar(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey,
                            value: ((index + 1) * 1.0 / pagesLength),
                          ),
                        ),
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: warna.withOpacity(0.5),
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (v.listImageOnboarding != null) {
                                int indexOnboard = index + 1;

                                if (v.listImageOnboarding!.data
                                        .asMap()
                                        .containsKey(0) &&
                                    indexOnboard == 0) {
                                  setState(() {
                                    image =
                                        v.listImageOnboarding!.data[0].imageUrl;
                                  });
                                } else if (v.listImageOnboarding!.data
                                        .asMap()
                                        .containsKey(1) &&
                                    indexOnboard == 1) {
                                  setState(() {
                                    image =
                                        v.listImageOnboarding!.data[1].imageUrl;
                                  });
                                } else if (v.listImageOnboarding!.data
                                        .asMap()
                                        .containsKey(2) &&
                                    indexOnboard == 2) {
                                  setState(() {
                                    image =
                                        v.listImageOnboarding!.data[2].imageUrl;
                                  });
                                } else if (v.listImageOnboarding!.data
                                        .asMap()
                                        .containsKey(3) &&
                                    indexOnboard == 3) {
                                  setState(() {
                                    image =
                                        v.listImageOnboarding!.data[3].imageUrl;
                                  });
                                } else {
                                  setState(() {
                                    image = null;
                                  });
                                }
                              }

                              if (index != pagesLength - 1) {
                                setState(() {
                                  setIndex(++index);
                                });

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
                                    warna = const Color(0xFFA1E2C2);
                                  });
                                }
                              } else {
                                bool login = sharedPreferencesManager
                                        .getBool("isLoggedIn") ??
                                    false;

                                if (login) {
                                  routeLogin = '/home';
                                  debugPrint(routeLogin);
                                }

                                if (!login) {
                                  routeLogin = '/login';
                                  debugPrint(routeLogin);
                                }
                                Get.offAllNamed(routeLogin!);
                              }
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            iconSize: 25,
                          ),
                        )
                      ],
                    ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                bool login = sharedPreferencesManager
                                        .getBool("isLoggedIn") ??
                                    false;

                                if (login) {
                                  routeLogin = '/home';
                                  debugPrint(routeLogin);
                                }

                                if (!login) {
                                  routeLogin = '/login';
                                  debugPrint(routeLogin);
                                }
                                Get.offAllNamed(routeLogin!);
                              },
                              child: Text(
                                'Skip',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
