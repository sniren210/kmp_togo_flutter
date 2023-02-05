import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/common/cardnft.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';

class NftPagesAll extends StatefulWidget {
  NftPagesAll({Key? key}) : super(key: key);

  @override
  State<NftPagesAll> createState() => _NftPagesAllState();
}

class _NftPagesAllState extends State<NftPagesAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                Text('Cari Disini', style: TextStyling.normal14black),
              ],
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 4.w, top: 3.h, bottom: 2.h),
                        child: Text(
                          'NFT Teratas',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 4.w, top: 1.h, bottom: 2.h),
                        child: GridView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, mainAxisSpacing: 10),
                            children: [
                              Cardnft(
                                jmlpembeli: '1',
                                darijumlah: '1',
                                nama: 'Sapi Betina',
                                tahun: 'Tahun 2022',
                                coin: 100,
                                images: 'assets/images/kotak.jpg',
                              ),
                              Cardnft(
                                jmlpembeli: '1',
                                darijumlah: '1',
                                nama: 'Nama Produk',
                                tahun: 'Tahun 2022',
                                coin: 100,
                                images: 'assets/images/kotak2.jpg',
                              ),
                              Cardnft(
                                jmlpembeli: '1',
                                darijumlah: '1',
                                nama: 'Nama Produk',
                                tahun: 'Tahun 2022',
                                coin: 100,
                                images: 'assets/images/kotak.jpg',
                              ),
                              Cardnft(
                                jmlpembeli: '1',
                                darijumlah: '1',
                                nama: 'Sapi Betina',
                                tahun: 'Tahun 2022',
                                coin: 100,
                                images: 'assets/images/kotak.jpg',
                              ),
                              Cardnft(
                                jmlpembeli: '1',
                                darijumlah: '1',
                                nama: 'Nama Produk',
                                tahun: 'Tahun 2022',
                                coin: 100,
                                images: 'assets/images/kotak2.jpg',
                              ),
                              Cardnft(
                                jmlpembeli: '1',
                                darijumlah: '1',
                                nama: 'Nama Produk',
                                tahun: 'Tahun 2022',
                                coin: 100,
                                images: 'assets/images/kotak.jpg',
                              ),
                              Cardnft(
                                jmlpembeli: '1',
                                darijumlah: '1',
                                nama: 'Nama Produk',
                                tahun: 'Tahun 2022',
                                coin: 100,
                                images: 'assets/images/kotak2.jpg',
                              ),
                              Cardnft(
                                jmlpembeli: '1',
                                darijumlah: '1',
                                nama: 'Nama Produk',
                                tahun: 'Tahun 2022',
                                coin: 100,
                                images: 'assets/images/kotak.jpg',
                              ),
                            ]),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
