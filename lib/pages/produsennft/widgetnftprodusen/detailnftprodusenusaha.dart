import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/common/buySuccessPage.dart';
import 'package:kmp_togo_mobile/pages/history/history.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/pages/nft/nft_components.dart';
import 'package:kmp_togo_mobile/pages/nft/payments_nft.dart';
import 'package:kmp_togo_mobile/pages/nft/widgetNft/enterpinpenjualan.dart';
import 'package:kmp_togo_mobile/pages/nft/widgetNft/sellsucces.dart';
import 'package:kmp_togo_mobile/pages/nft/widgetNft/splashpenjualan.dart';
import 'package:kmp_togo_mobile/pages/produsennft/hakaksesproduk.dart';
import 'package:kmp_togo_mobile/pages/produsennft/produsenmyproduk.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DetailProduusenUsaha extends StatefulWidget {
  String? title,
      category,
      images,
      lockNft,
      gasfee,
      admfee,
      selling,
      deskripsi,
      namastore;
  int? priceCoins;
  int? long;
  int? lat;
  int? storeId;

  DetailProduusenUsaha(
      {required this.images,
      required this.title,
      this.priceCoins,
      this.lockNft,
      this.gasfee,
      this.selling,
      this.deskripsi,
      this.storeId,
      this.long,
      this.lat,
      this.namastore,
      this.admfee});

  @override
  State<DetailProduusenUsaha> createState() => _DetailProduusenUsahaState();
}

class _DetailProduusenUsahaState extends State<DetailProduusenUsaha>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool? loading = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderNft>(
          builder: (BuildContext context, v, Widget? Child) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              title: Text(widget.namastore ?? ""),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 200,
                  width: double.maxFinite,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.images ?? kEmptyImageLink),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SliverLayoutBuilder(builder: (_, _sliver) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: const Color(0xFF85014e),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Text(widget.selling ?? "",
                                      style: TextStyling.w40014white),
                                ),
                              ),
                              const VerticalSpacer(height: 8),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: CircleAvatar(
                                      radius: 15,
                                      child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage: AssetImage(
                                              'assets/images/bg1024.png')),
                                      // 'assets/images/White-1024.png')),
                                    ),
                                  ),
                                  Text('${widget.priceCoins} Coin',
                                      style: TextStyling.w60020black),
                                ],
                              ),
                              const VerticalSpacer(height: 12),
                              Text(widget.title ?? "",
                                  style: TextStyling.w600bold16black),
                              const VerticalSpacer(height: 18),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //     const Text('Perkiraan keuntungan',
                              //         style: TextStyling.w40014black),
                              //     const HorizontalSpacer(width: 10),
                              //     Icon(Icons.currency_bitcoin),
                              //     // Text('${widget.monthlyPercentage}% / bulan',
                              //     //     style: TextStyling.w40014black),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpacer(height: 8),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const VerticalSpacer(height: 8),
                              const Text('Lokasi',
                                  style: TextStyling.w600bold16black),
                              const VerticalSpacer(height: 18),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text('longitude',
                                          style: TextStyling.w40014black),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Icon(Icons.pin_drop_sharp,
                                            size: 16),
                                      )
                                    ],
                                  ),
                                  Text('${widget.long}',
                                      style: TextStyling.w40014grey),
                                  // widget.lockNft == 'null'
                                  //     ? Text('Tidak Ada')
                                  //     // ignore: dead_code
                                  //     : Text('${widget.lockNft}',
                                  //         style: TextStyling.w40014grey),
                                ],
                              ),
                              const VerticalSpacer(height: 18),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('latitude',
                                          style: TextStyling.w40014black),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Icon(Icons.pin_drop_sharp,
                                            size: 16),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${widget.lat}',
                                  )
                                  // widget.expired == 'null'
                                  //     ? Text('Tidak Ada')
                                  //     : Text('${widget.expired}',
                                  //         style: TextStyling.w40014grey),
                                ],
                              ),
                              const VerticalSpacer(height: 8),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpacer(height: 8),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                VerticalSpacer(height: 8),
                                Text('Deskripsi',
                                    style: TextStyling.w600bold16black),
                                VerticalSpacer(height: 18),
                                Text(widget.deskripsi ?? ""),
                                VerticalSpacer(height: 8),
                              ],
                            ),
                          )),
                    ],
                  );
                },
                childCount: 1,
              ));
            })
          ],
        );
      }),
      bottomSheet: Wrap(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            width: context.width,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: InkWell(
                        onTap: () async {
                          // Get.to(ProdusenMyProduk());
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: context.width,
                            margin: EdgeInsets.only(left: 2.h, right: 2.w),
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context).primaryColor),
                            child: const Text(
                              'Lihat Produk',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: InkWell(
                        onTap: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HakAksesProduk(
                              storeId: widget.storeId,
                              // gasfee: widget.gasfee,
                              // admfee: widget.admfee,
                            );
                          }));
                          // Get.to(HakAksesProduk());
                        },
                        child: Container(
                            width: context.width,
                            margin: EdgeInsets.only(left: 2.h, right: 2.w),
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Theme.of(context).primaryColor),
                            child: const Text(
                              'Kelola Akses',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  dialogWidget(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(27.0),
                      topRight: Radius.circular(27.0),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    const Divider(
                      color: Color.fromRGBO(88, 93, 93, 1),
                      height: 20,
                      thickness: 7,
                      indent: 140,
                      endIndent: 140,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Apakah Akan Menjual NFT',
                                style: TextStyling.w50018black),
                            const SizedBox(height: 18),
                            Image(
                              height: 100,
                              image: AssetImage('assets/images/logon.jpg'),
                            ),
                            const SizedBox(height: 18),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(text: 'Kamu akan mendapatkan'),
                                  TextSpan(
                                      text: ' ${widget.priceCoins} ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const TextSpan(
                                      text:
                                          'Coin dari hasil penjualan ini, pastikan kamu yakin ingin menjualnya.',
                                      style: const TextStyle()),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                          ],
                        )),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              const EdgeInsets.only(right: 20.0, left: 20.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 70),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFF85014e)),
                          child: const Text(
                            'Lanjut',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // int count = 0;
                        // Navigator.popUntil(context, (route) {
                        //   return count++ == 2;
                        // });
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              const EdgeInsets.only(right: 20.0, left: 20.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 70),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: const Text(
                            'Kembali',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          );
        });
  }
}
