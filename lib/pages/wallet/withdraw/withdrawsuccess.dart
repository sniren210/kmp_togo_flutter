import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';

import '../../../helpers/ui_helper/textStyling.dart';

class WithDraawSuccess extends StatefulWidget {
  const WithDraawSuccess({super.key});

  @override
  State<WithDraawSuccess> createState() => _WithDraawSuccessState();
}

class _WithDraawSuccessState extends State<WithDraawSuccess> {
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
                width: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/logon.jpg'))),
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                'Withdraw Berhasil',
                textAlign: TextAlign.center,
                style: TextStyling.titleStyle,
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: const Text(
                  'Pin ini digunakan untuk, Lörem ipsum mar hälsolitteracitet i nirat. Gijånade homosm.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              // Container(
              //   width: context.width,
              //   margin: EdgeInsets.symmetric(horizontal: 4.w),
              //   padding: EdgeInsets.symmetric(horizontal: 4.w),
              //   decoration: BoxDecoration(
              //       border: Border.all(color: Colors.grey.shade400)),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SizedBox(
              //         height: 2.h,
              //       ),
              //       Container(
              //         child: const Text(
              //           'Rekening Tujuan',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               color: Colors.grey,
              //               fontWeight: FontWeight.normal,
              //               fontSize: 15),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 1.h,
              //       ),
              //       Row(
              //         children: [
              //           SizedBox(
              //             width: 24.w,
              //             height: 24.h,
              //             child: FittedBox(
              //               fit: BoxFit.fill,
              //               child: Image.asset(
              //                 'assets/images/logo-bagi-resize.png',
              //               ),
              //             ),
              //           ),
              //           const HorizontalSpacer(width: 6),
              //           const Text(
              //             'Bank Artha Graha Internasional',
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.normal,
              //                 fontSize: 15),
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         height: 2.h,
              //       ),
              //       Container(
              //         child: const Text(
              //           'No Tujuan',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               color: Colors.grey,
              //               fontWeight: FontWeight.normal,
              //               fontSize: 15),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 1.h,
              //       ),
              //       Container(
              //         child: const Text(
              //           '9928 2212 8292 2123',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               color: Colors.black,
              //               fontWeight: FontWeight.normal,
              //               fontSize: 15),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 2.h,
              //       ),
              //       Container(
              //         child: const Text(
              //           'Total Biaya',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               color: Colors.grey,
              //               fontWeight: FontWeight.normal,
              //               fontSize: 15),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 1.h,
              //       ),
              //       Container(
              //         child: const Text(
              //           'Rp.500.000',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               color: Colors.black,
              //               fontWeight: FontWeight.normal,
              //               fontSize: 15),
              //         ),
              //       ),
              //       SizedBox(
              //         height: 2.h,
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 7.h,
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
                        color: const Color(0xFF85014e)),
                    child: const Text(
                      'Kembali Ke Beranda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    )),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
