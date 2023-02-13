import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/pages/history/history.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';

import '../../../helpers/ui_helper/textStyling.dart';
import '../history/jenis_transaksi.dart';

class PpobSuccess extends StatefulWidget {
  bool isScan;

  PpobSuccess({super.key, required this.isScan});

  @override
  State<PpobSuccess> createState() => _PpobSuccessState();
}

class _PpobSuccessState extends State<PpobSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40, top: 70),
                height: 200,
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
                'Berhasil Membayar',
                textAlign: TextAlign.center,
                style: TextStyling.titleStyle,
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: const Text(
                  'Pembayaran PLN - Layanan 1 berhasil, Lörem ipsum mar hälsolitteracitet i nirat. Gijånade homosm.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ),
              const VerticalSpacer(height: 8),
              widget.isScan
                  ? Padding(
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7.0, horizontal: 2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Kode Pembayaran",
                                      style: TextStyling.w30013black,
                                    ),
                                    VerticalSpacer(height: 8),
                                    Text(
                                      "8812 2829 9291 2829",
                                      style: TextStyling.bold13black,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7.0, horizontal: 2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Tujuan Pembayaran",
                                      style: TextStyling.w30013black,
                                    ),
                                    VerticalSpacer(height: 8),
                                    Text(
                                      "Sofana Furniture (A91JIJA291)",
                                      style: TextStyling.bold13black,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: Colors.transparent,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7.0, horizontal: 2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Jumlah Pembayaran",
                                      style: TextStyling.w30013black,
                                    ),
                                    VerticalSpacer(height: 8),
                                    Text(
                                      "500.000 Poin",
                                      style: TextStyling.bold13black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                height: 7.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Home(
                        selectedIndex: 2,
                      );
                    }),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF85014e)),
                    child: const Text(
                      'Lihat Riwayat Transaksi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    )),
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Home();
                    }),
                    (route) => false,
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey),
                    child: const Text(
                      'Kembali Ke Beranda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    )),
              ),
              const VerticalSpacer(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
