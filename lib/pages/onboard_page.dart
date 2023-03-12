import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/providers/apitext/providerapitext.dart';
import 'package:onboarding/onboarding.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageNewState();
}

class _OnBoardingPageNewState extends State<OnBoardingPage> {
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final getApiTextLogin =
          Provider.of<ProviderApiText>(context, listen: false);
      await getApiTextLogin.getOnboarding();
    });
  }

  Material _skipButton({void Function(int)? setIndex}) {
    bool login = sharedPreferencesManager.getBool("isLoggedIn") ?? false;

    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      color: defaultSkipButtonColor,
      child: InkWell(
        onTap: () {
          String routeLogin = '';

          if (login) {
            routeLogin = '/home';
            debugPrint(routeLogin);
          }

          if (!login) {
            routeLogin = '/login';
            debugPrint(routeLogin);
          }
          Get.offAllNamed(routeLogin);
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
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      color: const Color(0xFF85014e),
      child: InkWell(
        onTap: () {
          String routeLogin = '';
          if (login) {
            routeLogin = '/home';
            debugPrint(routeLogin);
          }

          if (!login) {
            routeLogin = '/login';
            debugPrint(routeLogin);
          }
          Get.offAllNamed(routeLogin);
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
    return Scaffold(
      body: BaseWidget<ProviderApiText>(
        model: ProviderApiText(Repository()),
        onModelReady: (model) => model.getOnboarding(),
        child: Container(),
        builder: (context, model, child) {
          if (model.loadinOnBoarding ?? true) {
            return Container(
              color: const Color(0xFF85014e),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
            // return Center(
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width,
            //     height: MediaQuery.of(context).size.height,
            //     child: Shimmer.fromColors(
            //       baseColor: Colors.grey.shade300,
            //       highlightColor: Colors.grey.shade100,
            //       child: Container(
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // );
          }
          return PageView(
            controller: controller,
            children: [
              for (int i = 0; i < model.listImageOnboarding.length; i++)
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF85014e),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        model.listImageOnboarding[i].imageUrl,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                              value: ((i + 1) *
                                  1.0 /
                                  model.listImageOnboarding.length),
                            ),
                          ),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (i != model.listImageOnboarding.length - 1) {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                } else {
                                  bool login = sharedPreferencesManager
                                          .getBool("isLoggedIn") ??
                                      false;

                                  String routeLogin = '';
                                  if (login) {
                                    routeLogin = '/home';
                                    debugPrint(routeLogin);
                                  }

                                  if (!login) {
                                    routeLogin = '/login';
                                    debugPrint(routeLogin);
                                  }
                                  Get.offAllNamed(routeLogin);
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              iconSize: 25,
                            ),
                          )
                        ],
                      ),
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

                                  String routeLogin = '';
                                  if (login) {
                                    routeLogin = '/home';
                                    debugPrint(routeLogin);
                                  }

                                  if (!login) {
                                    routeLogin = '/login';
                                    debugPrint(routeLogin);
                                  }
                                  Get.offAllNamed(routeLogin);
                                },
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
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
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
