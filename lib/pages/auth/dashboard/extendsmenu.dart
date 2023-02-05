import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/pages/auth/dashboard/marketplacePage.dart';
import 'package:kmp_togo_mobile/pages/nft/dashboard_nft.dart';
import 'package:kmp_togo_mobile/pages/ppob/inputpobwithnumber.dart';
import 'package:kmp_togo_mobile/pages/ppob/wtNumber/inputPpobWTNumber.dart';
import 'package:kmp_togo_mobile/pages/stacking/penyertaanmodal.dart';
import 'package:kmp_togo_mobile/pages/wallet/topup/topuppages.dart';
import 'package:kmp_togo_mobile/pages/wallet/withdraw/withdrawpages.dart';

class ExtendsMenu extends StatefulWidget {
  final String membertype;

  const ExtendsMenu({Key? key, required this.membertype}) : super(key: key);

  @override
  State<ExtendsMenu> createState() => _ExtendsMenuState();
}

class _ExtendsMenuState extends State<ExtendsMenu> {
  List<Map<String, dynamic>>? datamenu = [
    // {
    //   'name': 'Topup',
    //   'icons': const Icon(
    //     Icons.monetization_on,
    //     color: const Color(0xFF85014e),
    //   )
    // },
    // {
    //   'name': 'Withdraw',
    //   'icons': const Icon(
    //     Icons.wallet,
    //     color: const Color(0xFF85014e),
    //   ),
    // },
    // {
    //   'name': 'NFT',
    //   'icons': const Icon(
    //     Icons.layers,
    //     color: const Color(0xFF85014e),
    //   )
    // },
    {
      'name': 'UMKM',
      'icons': const Icon(
        Icons.shopping_cart,
        color: Color(0xFF85014e),
      ),
    },
    {
      'name': 'Pulsa',
      'icons': const Icon(
        Icons.smartphone,
        color: Color(0xFF85014e),
      )
    },
    {
      'name': 'Data',
      'icons': const Icon(
        Icons.laptop_mac,
        color: Color(0xFF85014e),
      ),
    },
    {
      'name': 'Token',
      'icons': const Icon(
        Icons.lightbulb_outline,
        color: Color(0xFF85014e),
      ),
    },
    {
      'name': 'PLN',
      'icons': const Icon(
        Icons.electric_bolt,
        color: Color(0xFF85014e),
      )
    },
    {
      'name': 'PDAM',
      'icons': const Icon(
        Icons.water,
        color: Color(0xFF85014e),
      ),
    },
    {
      'name': 'E-Money',
      'icons': const Icon(
        Icons.credit_card_rounded,
        color: Color(0xFF85014e),
      )
    },
    {
      'name': 'Internet',
      'icons': const Icon(
        Icons.wifi,
        color: Color(0xFF85014e),
      ),
    },
    // {
    //   'name': 'Penyertaan Modal',
    //   'icons': const Icon(
    //     Icons.attach_money_rounded,
    //     color: Color(0xFF85014e),
    //   ),
    // },
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //     margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            //     padding: EdgeInsets.only(
            //       top: 8,
            //       bottom: 8,
            //       left: 2.w,
            //     ),
            //     decoration: BoxDecoration(
            //         color: const Color(0xFF85014e),
            //         borderRadius: BorderRadius.circular(5)),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.search,
            //           size: 5.w,
            //           color: Colors.white,
            //         ),
            //         SizedBox(width: 2.w),
            //         Expanded(
            //           child: TextField(
            //             onChanged: (value) {
            //               // searchData(st = value.trim().toLowerCase());
            //               // Method For Searching
            //             },
            //             decoration: InputDecoration(
            //                 hintText: "Pencarian Menu",
            //                 border: InputBorder.none,
            //                 hintStyle:
            //                     TextStyle(color: Colors.white, fontSize: 14)),
            //           ),
            //         )
            //         // const Text(
            //         //   'Cari Aplikasi Disini',
            //         //   style: TextStyle(color: Colors.white),
            //         // ),
            //       ],
            //     )),
            const SizedBox(
              height: 10,
            ),
            for (var i = 0; i < datamenu!.length; i++)
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  child: InkWell(
                    onTap: () {
                      if (datamenu![i]['name'] == 'Topup') {
                        if (widget.membertype == 'konsumen1' ||
                            widget.membertype == 'konsumen2' ||
                            widget.membertype == 'produsen') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TopUpPage()),
                          );
                        } else {
                          snackbarMenu();
                        }
                      } else if (datamenu![i]['name'] == 'Withdraw') {
                        if (widget.membertype == 'konsumen1' ||
                            widget.membertype == 'konsumen2' ||
                            widget.membertype == 'produsen') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WithDraw()),
                          );
                        } else {
                          snackbarMenu();
                        }
                      } else if (datamenu![i]['name'] == 'NFT') {
                        if (widget.membertype == 'konsumen1') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardNFT()),
                          );
                        } else {
                          snackbarMenu();
                        }
                      } else if (datamenu![i]['name'] == 'UMKM') {
                        if (widget.membertype == 'produsen' ||
                            widget.membertype == 'konsumen1' ||
                            widget.membertype == 'konsumen2' ||
                            widget.membertype == 'trader' ||
                            widget.membertype == 'umkm') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MarketplacePage()));
                        } else {
                          snackbarMenu();
                        }
                      } else if (datamenu![i]['name'] == 'Pulsa') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputPPOBWithNumber(
                                    title: 'Pulsa',
                                    product_type: 'pulsa',
                                  )),
                        );
                      } else if (datamenu![i]['name'] == 'Data') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputPPOBWithNumber(
                                    title: 'Data',
                                    product_type: 'data',
                                  )),
                        );
                      } else if (datamenu![i]['name'] == 'Token') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputPPOBWithNumber(
                                    title: 'Token',
                                    product_type: 'pln',
                                  )),
                        );
                      } else if (datamenu![i]['name'] == 'PLN') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputPPOBWithoutNumber(
                                  title: 'PLN', product_type: 'pln')),
                        );
                      } else if (datamenu![i]['name'] == 'PDAM') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputPPOBWithoutNumber(
                                  title: 'PDAM', product_type: 'pdam')),
                        );
                      } else if (datamenu![i]['name'] == 'E-Money') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputPPOBWithoutNumber(
                                    title: 'E-Money',
                                    product_type: 'emoney',
                                  )),
                        );
                      } else if (datamenu![i]['name'] == 'Internet') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputPPOBWithoutNumber(
                                    title: 'Internet',
                                    product_type: 'internet',
                                  )),
                        );
                      } else if (datamenu![i]['name'] == 'Penyertaan Modal') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PenyertaanModal()),
                        );
                      }
                    },
                    child: ListTile(
                      leading: datamenu![i]['icons'],
                      title: Text(datamenu![i]['name']),
                      trailing: const Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Color(0xFF85014e),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      )),
    );
  }
}
