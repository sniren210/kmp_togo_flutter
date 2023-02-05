import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/nft/nft_components.dart';
import 'package:kmp_togo_mobile/pages/nft/cardNFt/cardnftterjual.dart';
import 'package:kmp_togo_mobile/pages/produsennft/widgetnftprodusen/cardnftprodusen.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';

class DashboardMyNFTKonsumen extends StatefulWidget {
  DashboardMyNFTKonsumen({Key? key}) : super(key: key);

  @override
  State<DashboardMyNFTKonsumen> createState() => _DashboardMyNFTKonsumenState();
}

class _DashboardMyNFTKonsumenState extends State<DashboardMyNFTKonsumen>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool? loading = true;
  int? jmlahData;
  int? jmlahDatausaha;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final _getkategoriProvider =
          Provider.of<ProviderNft>(context, listen: false);
      await _getkategoriProvider.getMyNFTProdusen(context, 'umum');
      // await _getkategoriProvider.getMyNFT(context);
      setState(() {
        loading = _getkategoriProvider.statusNFTProdusenUmum;
        jmlahData = _getkategoriProvider.lengthNftprodusenUmum;
      });
    });

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  List KetegoriNFT = ['NFT Umum', 'NFT Usaha'];

  int pilihnft = 0;
  String? statusNFTTamplian = 'umum';

  getMyNFTstatus(int aa) async {
    if (aa == 0) {
      final _getkategoriProvider =
          Provider.of<ProviderNft>(context, listen: false);
      await _getkategoriProvider.getMyNFTProdusen(context, 'umum');
      setState(() {
        loading = _getkategoriProvider.statusNFTProdusenUmum;
        jmlahData = _getkategoriProvider.lengthNftprodusenUmum;
        statusNFTTamplian = 'umum';
      });
    } else if (aa == 1) {
      print('a');
      final _getkategoriProvider =
          Provider.of<ProviderNft>(context, listen: false);
      await _getkategoriProvider.getMyNFTProdusen(context, 'usaha');
      setState(() {
        loading = _getkategoriProvider.statusNFTProdusenUsaha;
        jmlahDatausaha = _getkategoriProvider.lengthNftprodusenUsaha;
        statusNFTTamplian = 'usaha';
      });
    }
  }

  final TextEditingController _cariC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toko Saya'),
      ),
      body: loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<ProviderNft>(
              builder: (BuildContext context, v, Widget? child) {
              // int jmlahData = v.dataAllStatusNFT!.data!.length;
              // int jmlahDatausaha = v.dataAllStatusNFTUsaha!.data!.length;
              return Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        controller: _cariC,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 4.w,
                          ),
                          hintText: 'Cari NFT',
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 1.5.w,
                      ),
                      padding: EdgeInsets.only(
                        top: 5.w,
                        bottom: 1.5.w,
                        left: 0.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (var i = 0; i < KetegoriNFT.length; i++)
                            InkWell(
                              onTap: () {
                                pilihnft = i;
                                getMyNFTstatus(pilihnft);
                                setState(() {});
                              },
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.only(right: 2.w),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 1.h),
                                  decoration: BoxDecoration(
                                      color: pilihnft == i
                                          ? Color(0xFF85014e)
                                          : Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      '${KetegoriNFT[i]}',
                                      style: TextStyle(
                                        color: pilihnft == i
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    statusNFTTamplian == 'umum'
                        ? Expanded(
                            child: jmlahData! > 0
                                ? ListView.builder(
                                    itemCount:
                                        v.dataNFTProdusenUmum?.data?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (_cariC.text.isNotEmpty) {
                                        if (v.dataNFTProdusenUmum!.data![index]
                                            .nft!.name!
                                            .toLowerCase()
                                            .contains(
                                                _cariC.text.toLowerCase())) {
                                          return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: CardNftProdusen(
                                                images: v
                                                        .dataNFTProdusenUmum!
                                                        .data![index]
                                                        .nft!
                                                        .imagePath ??
                                                    "",
                                                title: v
                                                        .dataNFTProdusenUmum
                                                        ?.data?[index]
                                                        .nft!
                                                        .name ??
                                                    "",
                                                expired: v
                                                        .dataNFTProdusenUmum
                                                        ?.data?[index]
                                                        .nft!
                                                        .expirationDate
                                                        .toString() ??
                                                    "",
                                                buyer: v
                                                        .dataNFTProdusenUmum
                                                        ?.data?[index]
                                                        .nft!
                                                        .avlUnit
                                                        .toString() ??
                                                    "",
                                                buyer_est: v
                                                        .dataNFTProdusenUmum
                                                        ?.data?[index]
                                                        .nft!
                                                        .qtyUnit
                                                        .toString() ??
                                                    "",
                                                storeId: v.dataNFTProdusenUmum
                                                    ?.data?[index].nft!.storeId,
                                                priceCoins: v
                                                    .dataNFTProdusenUmum
                                                    ?.data?[index]
                                                    .nft!
                                                    .priceCoin,
                                              ));
                                        } else {
                                          return Container();
                                        }
                                      }
                                      return CardNftProdusen(
                                        images: v.dataNFTProdusenUmum!
                                                .data![index].nft!.imagePath ??
                                            "",
                                        title: v.dataNFTProdusenUmum
                                                ?.data?[index].nft!.name ??
                                            "",
                                        expired: v
                                                .dataNFTProdusenUmum
                                                ?.data?[index]
                                                .nft!
                                                .expirationDate
                                                .toString() ??
                                            "",
                                        buyer: v.dataNFTProdusenUmum
                                                ?.data?[index].nft!.avlUnit
                                                .toString() ??
                                            "",
                                        buyer_est: v.dataNFTProdusenUmum
                                                ?.data?[index].nft!.qtyUnit
                                                .toString() ??
                                            "",
                                        storeId: v.dataNFTProdusenUmum
                                            ?.data?[index].nft!.storeId,
                                        priceCoins: v.dataNFTProdusenUmum
                                            ?.data?[index].nft!.priceCoin,
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text('Tidak Ada Data'),
                                  ))
                        : Expanded(
                            child: jmlahDatausaha! > 0
                                ? ListView.builder(
                                    itemCount:
                                        v.dataNFTProdusenUsaha?.data?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (_cariC.text.isNotEmpty) {
                                        if (v.dataNFTProdusenUsaha!.data![index]
                                            .name!
                                            .toLowerCase()
                                            .contains(
                                                _cariC.text.toLowerCase())) {
                                          return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: CardNftProdusen(
                                                images: v
                                                        .dataNFTProdusenUsaha!
                                                        .data![index]
                                                        .imagePath ??
                                                    "",

                                                //     .where((element) => element.ownerId == null)
                                                //     .isNotEmpty
                                                // ? v.dataAllNFT!.data![index].nftUnit
                                                //     ?.where(
                                                //         (element) => element.ownerId == null)
                                                //     .first
                                                //     .nftSerialId
                                                //     .toString()
                                                // : '',
                                                title: v.dataNFTProdusenUsaha
                                                        ?.data?[index].name ??
                                                    "",
                                                expired: v
                                                        .dataNFTProdusenUsaha
                                                        ?.data?[index]
                                                        .expirationDate
                                                        .toString() ??
                                                    "",
                                                buyer: v.dataNFTProdusenUsaha
                                                        ?.data?[index].avlUnit
                                                        .toString() ??
                                                    "",
                                                buyer_est: v
                                                        .dataNFTProdusenUsaha
                                                        ?.data?[index]
                                                        .qtyUnit
                                                        .toString() ??
                                                    "",
                                                storeId: v.dataNFTProdusenUsaha
                                                    ?.data?[index].storeId,
                                                priceCoins: v
                                                    .dataNFTProdusenUsaha
                                                    ?.data?[index]
                                                    .nftUnit
                                                    ?.first
                                                    .priceCoin,
                                              ));
                                        } else {
                                          return Container();
                                        }
                                      }
                                      return CardNftProdusen(
                                        images: v.dataNFTProdusenUsaha!
                                                .data![index].imagePath ??
                                            "",
                                        title: v.dataNFTProdusenUsaha
                                                ?.data?[index].name ??
                                            "",
                                        expired: v.dataNFTProdusenUsaha
                                                ?.data?[index].expirationDate
                                                .toString() ??
                                            "",
                                        buyer: v.dataNFTProdusenUsaha
                                                ?.data?[index].avlUnit
                                                .toString() ??
                                            "",
                                        buyer_est: v.dataNFTProdusenUsaha
                                                ?.data?[index].qtyUnit
                                                .toString() ??
                                            "",
                                        storeId: v.dataNFTProdusenUsaha
                                            ?.data?[index].storeId,
                                        priceCoins: v.dataNFTProdusenUsaha
                                            ?.data?[index].priceCoin,
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text('Tidak Ada Data'),
                                  ))
                  ],
                ),
              );
            }),
    );
  }
}
