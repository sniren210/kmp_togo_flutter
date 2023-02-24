import 'package:get/get.dart';
import 'package:kmp_togo_mobile/pages/auth/changePINPage.dart';
import 'package:kmp_togo_mobile/pages/auth/login/loginPages.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerloadingpage.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/pages/nft/dashboard_nft.dart';
import 'package:kmp_togo_mobile/pages/onboard_page.dart';
// import 'package:kmp_togo_mobile/pages/onboardPage.dart';
import 'package:kmp_togo_mobile/pages/settings/about_us_page.dart';
import 'package:kmp_togo_mobile/pages/settings/privacy_policy_page.dart';
import 'package:kmp_togo_mobile/pages/umkm/umkmMyProduk.dart';
import 'package:kmp_togo_mobile/pages/wallet/dashboard_wallet.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: '/', page: () => const OnBoardingPage()),
  GetPage(name: '/home', page: () => Home()),
  GetPage(name: '/login', page: () => const LoginPages()),
  GetPage(name: '/wallet', page: () => DashboardWallet(isHome: false)),
  GetPage(name: '/ubahPIN', page: () => const ChangePINPage()),
  GetPage(name: '/umkmProduct', page: () => UmkmMyProduk()),
  GetPage(name: '/nft', page: () => DashboardNFT()),
  // GetPage(name: '/privacyPolicy', page: () => const PrivacyPolicyPage()),
  GetPage(name: '/aboutUs', page: () => const AboutUsPage()),
  GetPage(name: '/loadingPageResgis', page: () => RegisterLoadingPage()),
  GetPage(name: '/loadingPageResgis', page: () => OnBoardingPage()),
];
