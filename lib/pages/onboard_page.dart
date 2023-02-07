import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  bool? lastpage = false;
  String? routeLogin;

  List<PageModel> onboardingPagesList(ProviderApiText v) {
    return [
      PageModel(
        widget: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: SingleChildScrollView(
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
                buildContent('', v.dataApiTextObaroding1?.data?.value ?? ""),
              ],
            ),
          ),
        ),
      ),
      PageModel(
        widget: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: SingleChildScrollView(
            child: Column(
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
                buildContent(
                    'COIN To-Go', v.dataApiTextObaroding2?.data?.value ?? ""),
              ],
            ),
          ),
        ),
      ),
      PageModel(
        widget: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: SingleChildScrollView(
            child: Column(
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
              ],
            ),
          ),
        ),
      ),
      PageModel(
        widget: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: SingleChildScrollView(
            child: Column(
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
                buildContent('UMKM MARKETPLACE',
                    v.dataApiTextObaroding3?.data?.value ?? ""),
              ],
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
      await getApiTextLogin.getTextOnboarding1(context);
      await getApiTextLogin.getTextOnboarding2(context);
      await getApiTextLogin.getTextOnboarding3(context);
      await getApiTextLogin.getTextOnboarding4(context);
    });

    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      color: defaultSkipButtonColor,
      child: InkWell(
        onTap: () {
          if (setIndex != null) {
            index = 3;
            setIndex(3);
            setState(() {
              // _visible = true;
              warna = Colors.blueAccent;
            });
          }
        },
        child: Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle.copyWith(
              fontSize: 11.5.sp,
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
            login ? 'Home' : 'Sign up',
            style: defaultProceedButtonTextStyle.copyWith(
              fontSize: 11.5.sp,
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
            color: warna,
            child: Onboarding(
              pages: onboardingPagesList(v),
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
                      warna = Colors.amberAccent;
                    });
                  } else if (index == 2) {
                    setState(() {
                      // _visible = true;
                      warna = Colors.black;
                    });
                  } else if (index == 3) {
                    setState(() {
                      // _visible = true;
                      warna = Colors.blueAccent;
                    });
                  }
                });
              },
              startPageIndex: 0,
              footerBuilder: (context, dragDistance, pagesLength, setIndex) {
                return Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                          netDragPercent: dragDistance,
                          pagesLength: pagesLength,
                          indicator: Indicator(
                            indicatorDesign: IndicatorDesign.polygon(
                              polygonDesign: PolygonDesign(
                                polygon: DesignType.polygon_square,
                              ),
                            ),
                          )),
                      index == pagesLength - 1
                          ? _signupButton()
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
