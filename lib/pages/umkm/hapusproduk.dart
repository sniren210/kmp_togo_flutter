import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../helpers/ui_helper/textStyling.dart';

class HapusProduk extends StatefulWidget {
  bool isUmkmProduct;
  int? id;
  String? name;

  HapusProduk(
      {super.key,
      required this.isUmkmProduct,
      required this.id,
      required this.name});

  @override
  State<HapusProduk> createState() => _HapusProdukState();
}

class _HapusProdukState extends State<HapusProduk> {
  bool? loading = false;

  submitDeleteNFT() async {
    await Provider.of<ProviderNft>(context, listen: false).deleteItemNFT(
      context,
      widget.id,
    );
    setState(() {
      loading =
          Provider.of<ProviderNft>(context, listen: false).loadinggethakasesnft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
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
                'Anda Yakin Ingin Menghapus Produk?',
                textAlign: TextAlign.center,
                style: TextStyling.titleStyle,
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: Text(
                  'Produk ${widget.name!.isNotEmpty ? '“${widget.name}” ' : ''}akan terhapus, dan tidak akan muncul di pencarian user. Anda Yakin?',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        int count = 0;
                        Navigator.of(context).popUntil((_) => count++ >= 2);
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFF85014e)),
                          child: const Text(
                            'Batalkan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    flex: 1,
                    child: loading == false
                        ? InkWell(
                            onTap: () async {
                              setState(() {
                                loading = true;
                              });

                              if (widget.isUmkmProduct) {
                                await Provider.of<ProviderProduct>(context,
                                        listen: false)
                                    .deleteProduct(widget.id);
                              } else {
                                submitDeleteNFT();
                              }
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(
                                    right: 10.0, left: 10.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.orange),
                                child: const Text(
                                  'Hapus Produk',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15),
                                )),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            margin:
                                const EdgeInsets.only(right: 10.0, left: 10.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey),
                            child: const Text(
                              'Waiting.....',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
