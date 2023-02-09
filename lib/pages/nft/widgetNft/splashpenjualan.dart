import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/history/history.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/ppob/provider_ppob_post.dart';
import 'package:kmp_togo_mobile/providers/ppob/provider_ppob_pre.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../main.dart';
import '../../../providers/nft/provider_nft.dart';
import '../../history/jenis_transaksi.dart';

class SplashNftPenjualan extends StatefulWidget {
  Widget nextPage;
  bool isReplace;
  dynamic model;

  String title, subtitle, nftSerialId, priceCoin;

  SplashNftPenjualan({
    Key? key,
    required this.nextPage,
    required this.isReplace,
    required this.title,
    required this.subtitle,
    required this.nftSerialId,
    required this.priceCoin,
  }) : super(key: key);

  @override
  State<SplashNftPenjualan> createState() => _SplashNftPenjualanState();
}

class _SplashNftPenjualanState extends State<SplashNftPenjualan> {
  bool? statusPayment = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final _getkategoriProvider =
          Provider.of<ProviderNft>(context, listen: false);
      // String? pinSave =
      //     sharedPreferencesManager.getString(SharedPreferencesManager.pin);
      // await _getkategoriProvider.sendPaymentNft(
      //     context, widget.nftSerialId, widget.priceCoin, pinSave);
      setState(() {
        statusPayment = _getkategoriProvider.statusPayment;
        print(statusPayment);
        if (statusPayment = true) {
          //   var duration = const Duration(seconds: 2);
          //   return Timer(duration, navigationPage);
          startTime();
        }
      });
    });
    super.initState();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    if (widget.isReplace) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => widget.nextPage),
          (Route<dynamic> route) => false);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget.nextPage),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildLoadingBody();
  }

  Scaffold buildLoadingBody() {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
              'Tunggu Sebentar Ya...',
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
            const SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF85014e),
      title: Container(
          padding: EdgeInsets.only(
            top: 1.5.w,
            bottom: 1.5.w,
            left: 2.w,
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 5.w,
                color: Colors.black87,
              ),
              SizedBox(width: 1.w),
              const Text('Cari Aplikasi Disini'),
            ],
          )),
      actions: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 3.w),
          child: Icon(
            Icons.notifications,
            size: 5.w,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildOptionBack() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
          Text(
            widget.title,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 70)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          // If the button is pressed, return green, otherwise blue
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.green;
                          }
                          return Colors.white;
                        }),
                        textStyle: MaterialStateProperty.resolveWith((states) {
                          // If the button is pressed, return size 40, otherwise 20
                          if (states.contains(MaterialState.pressed)) {
                            return const TextStyle(fontSize: 40);
                          }
                          return const TextStyle(fontSize: 20);
                        }),
                      ),
                      child: const Text("Lihat Riwayat Transaksi",
                          style: TextStyling.normal15grey),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return jenisTransaksi();
                          }),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacer(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF85014e)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 70)),
                      ),
                      child: const Text("Kembali Ke Beranda",
                          style: TextStyle(fontSize: 15, color: Colors.white)),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Home();
                          }),
                          (route) => false,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
