import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/history/history.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_register.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RegisterLoadingPage extends StatefulWidget {
  // Widget nextPage;
  // String title, subtitle;

  RegisterLoadingPage({
    Key? key,
    // required this.nextPage,
    // required this.title,
    // required this.subtitle
  }) : super(key: key);

  @override
  State<RegisterLoadingPage> createState() => _RegisterLoadingPageState();
}

class _RegisterLoadingPageState extends State<RegisterLoadingPage> {
  Timer? timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      submitRegister();
    });
    super.initState();
  }

  bool? loading = false;

  submitRegister() async {
    await Provider.of<ProviderRegister>(context, listen: false)
        .getmyinfoRegister(context);
    setState(() {
      loading = Provider.of<ProviderRegister>(context, listen: false)
          .loadinggetMyInfo;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed('/login');
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40, top: 70),
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //     fit: BoxFit.cover,
                    //     image: AssetImage('assets/images/logon.jpg'))
                    ),
                child: Lottie.asset('assets/images/loading.json'),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                "Menunggu Pembayaran",
                textAlign: TextAlign.center,
                style: TextStyling.titleStyle,
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: const Text(
                  'Lörem ipsum putinas eurobävning, pohöpas trev. Odade global hektar rere i biohögån ultras. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Row(
              //     children: [
              //       Flexible(
              //         child: SizedBox(
              //           width: double.infinity,
              //           child: ElevatedButton(
              //             style: ButtonStyle(
              //               padding: MaterialStateProperty.all(
              //                   const EdgeInsets.symmetric(
              //                       vertical: 15, horizontal: 70)),
              //               backgroundColor:
              //                   MaterialStateProperty.resolveWith((states) {
              //                 // If the button is pressed, return green, otherwise blue
              //                 if (states.contains(MaterialState.pressed)) {
              //                   return Colors.green;
              //                 }
              //                 return Colors.white;
              //               }),
              //               textStyle:
              //                   MaterialStateProperty.resolveWith((states) {
              //                 // If the button is pressed, return size 40, otherwise 20
              //                 if (states.contains(MaterialState.pressed)) {
              //                   return const TextStyle(fontSize: 40);
              //                 }
              //                 return const TextStyle(fontSize: 20);
              //               }),
              //             ),
              //             child: const Text("Lihat Riwayat Transaksi",
              //                 style: TextStyling.normal15grey),
              //             onPressed: () {
              //               // TODO:
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(builder: (context) {
              //                   return History();
              //                 }),
              //               );
              //             },
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const VerticalSpacer(height: 12),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: Row(
              //     children: [
              //       Flexible(
              //         child: SizedBox(
              //           width: double.infinity,
              //           child: ElevatedButton(
              //             style: ButtonStyle(
              //               backgroundColor: MaterialStateProperty.all(
              //                   const Color(0xFF85014e)),
              //               padding: MaterialStateProperty.all(
              //                   const EdgeInsets.symmetric(
              //                       vertical: 15, horizontal: 70)),
              //             ),
              //             child: const Text("Kembali Ke Beranda",
              //                 style:
              //                     TextStyle(fontSize: 15, color: Colors.white)),
              //             onPressed: () {
              //               Navigator.pushAndRemoveUntil(
              //                 context,
              //                 MaterialPageRoute(builder: (context) {
              //                   return Home();
              //                 }),
              //                 (route) => false,
              //               );
              //             },
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
