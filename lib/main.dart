import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/providers/multiprovider.dart';
import 'package:kmp_togo_mobile/routes/routes.dart';
import 'package:kmp_togo_mobile/utils/httpOverrideSertifcate.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

final SharedPreferencesManager sharedPreferencesManager =
    locator<SharedPreferencesManager>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await Helper().init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  String? routeLogin;
  HttpOverrides.global = MyHttpOverrides();
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
  } else {
    routeLogin = '/';
    debugPrint(routeLogin);
  }

  runApp(MyApp(
    loginRoute: '/onboarding',
  ));
}

class MyApp extends StatelessWidget {
  String? loginRoute;

  MyApp({
    this.loginRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, widget) => MultiProvider(
          providers: multiProvider,
          child: GetMaterialApp(
            locale: const Locale('id'),
            initialRoute: loginRoute,
            getPages: routes,
            useInheritedMediaQuery: true,
            debugShowCheckedModeBanner: false,
            title: 'Pay Now',
            theme: ThemeData(
              primaryColor: const Color(0xFF85014e),
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: const Color(0xFF85014e),
                secondary: const Color(0xFFF8BB18),
                onSecondaryContainer: const Color(0xFF1A1A1A),
                onSurface: const Color(0xFF1A1A1A),
              ),
              textTheme: const TextTheme().copyWith(
                  bodyText2: const TextStyle(
                color: Color(0xFF1A1A1A),
              )),
              fontFamily: 'SF-Pro-Rounded',
            ),
          ),
        ),
      );
    });
  }
}
