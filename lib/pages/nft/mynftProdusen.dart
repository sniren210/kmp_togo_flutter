import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/nft/nft_components.dart';
import 'package:kmp_togo_mobile/pages/nft/cardNFt/cardnftterjual.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';

class MyNFTProdusen extends StatefulWidget {
  MyNFTProdusen({Key? key}) : super(key: key);

  @override
  State<MyNFTProdusen> createState() => _MyNFTProdusenState();
}

class _MyNFTProdusenState extends State<MyNFTProdusen>
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
      await _getkategoriProvider.getMyStatusNFT(context, 'umum');
      // await _getkategoriProvider.getMyNFT(context);
      setState(() {
        loading = _getkategoriProvider.statusNFTstatus;
        jmlahData = _getkategoriProvider.lengthNftumum;
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
      await _getkategoriProvider.getMyStatusNFT(context, 'umum');
      setState(() {
        loading = _getkategoriProvider.statusNFTstatus;
        jmlahData = _getkategoriProvider.lengthNftumum;
        statusNFTTamplian = 'umum';
      });
    } else if (aa == 1) {
      final _getkategoriProvider =
          Provider.of<ProviderNft>(context, listen: false);
      await _getkategoriProvider.getMyStatusNFT(context, 'usaha');
      setState(() {
        loading = _getkategoriProvider.statusNFTstatus;
        jmlahDatausaha = _getkategoriProvider.lengthNftusaha;
        statusNFTTamplian = 'usaha';
      });
    }
  }

  final TextEditingController _cariC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My NFT'),
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
                          hintText: 'Cari Layanan',
                          border: const OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    // Container(
                    //     padding: EdgeInsets.only(
                    //       top: 2.w,
                    //       bottom: 2.w,
                    //       left: 2.w,
                    //     ),
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.grey.shade300),
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(5)),
                    //     child: Row(
                    //       children: [
                    //         Icon(
                    //           Icons.search,
                    //           size: 5.w,
                    //           color: Colors.black87,
                    //         ),
                    //         SizedBox(width: 1.w),
                    //         Text('Cari Disini',
                    //             style: TextStyling.normal14black),
                    //       ],
                    //     )),
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
                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 3.w, vertical: 1.h),
                          //   decoration: BoxDecoration(
                          //       color: Colors.grey,
                          //       borderRadius: BorderRadius.circular(15)),
                          //   child: Center(
                          //     child: Text('NFT Umum'),
                          //   ),
                          // ),

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
                          // if (KetegoriNFT.length > 0)
                          //   ...KetegoriNFT.where((e) => e.id != null).map(
                          //     (e) => Container(
                          //       padding: EdgeInsets.symmetric(
                          //           horizontal: 3.w, vertical: 1.h),
                          //       decoration: BoxDecoration(
                          //           color: Colors.grey,
                          //           borderRadius: BorderRadius.circular(15)),
                          //       child: Center(
                          //         child: Text('NFT Umum'),
                          //       ),
                          //     ),
                          //   )
                          // Container(
                          //   margin: EdgeInsets.symmetric(
                          //     horizontal: 2.w,
                          //   ),
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 5.w, vertical: 1.h),
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       border: Border.all(),
                          //       borderRadius: BorderRadius.circular(15)),
                          //   child: Center(
                          //     child: Text('NFT Usaha'),
                          //   ),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 3.w, vertical: 1.h),
                          //   decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       border: Border.all(),
                          //       borderRadius: BorderRadius.circular(15)),
                          //   child: Center(
                          //     child: Text('NFT Terjual'),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    statusNFTTamplian == 'umum'
                        ? Expanded(
                            child: jmlahData! > 0
                                ? ListView.builder(
                                    itemCount: v.dataAllStatusNFT?.data?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (_cariC.text.isNotEmpty) {
                                        if (v.dataAllStatusNFT!.data![index]
                                            .nft!.name!
                                            .toLowerCase()
                                            .contains(
                                                _cariC.text.toLowerCase())) {
                                          return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: CardNftTerjual(
                                                images: v
                                                        .dataAllStatusNFT!
                                                        .data![index]
                                                        .nft
                                                        ?.imagePath ??
                                                    "",

                                                title: v
                                                        .dataAllStatusNFT
                                                        ?.data?[index]
                                                        .nft
                                                        ?.name ??
                                                    "",
                                                expired: v
                                                        .dataAllStatusNFT
                                                        ?.data?[index]
                                                        .nft
                                                        ?.expirationDate
                                                        .toString() ??
                                                    "",
                                                buyer: v
                                                        .dataAllStatusNFT
                                                        ?.data?[index]
                                                        .nft
                                                        ?.avlUnit
                                                        .toString() ??
                                                    "",
                                                buyer_est: v
                                                        .dataAllStatusNFT
                                                        ?.data?[index]
                                                        .nft
                                                        ?.qtyUnit
                                                        .toString() ??
                                                    "",
                                                nftSerialId: v
                                                        .dataAllStatusNFT!
                                                        .data![index]
                                                        .nftSerialId ??
                                                    "",
                                                priceCoins: v
                                                    .dataAllStatusNFT!
                                                    .data![index]
                                                    .nft
                                                    ?.priceCoin,
                                                lockNft: v
                                                        .dataAllStatusNFT!
                                                        .data![index]
                                                        .nft
                                                        ?.holdLimitinDay
                                                        .toString() ??
                                                    "",

                                                monthlyPercentage: v
                                                        .dataAllStatusNFT!
                                                        .data![index]
                                                        .nft
                                                        ?.monthlyPercentage
                                                        .toString() ??
                                                    "",
                                                gasfee: v
                                                        .dataAllStatusNFT!
                                                        .data![index]
                                                        .nft
                                                        ?.gasfee
                                                        .toString() ??
                                                    "",
                                                admfee: v
                                                        .dataAllStatusNFT!
                                                        .data![index]
                                                        .nft
                                                        ?.admfee
                                                        .toString() ??
                                                    "",
                                                deskripsi: v
                                                        .dataAllStatusNFT!
                                                        .data![index]
                                                        .nft
                                                        ?.description
                                                        .toString() ??
                                                    "",
                                                // images: v
                                                //         .dataAllStatusNFT!
                                                //         .data![index]
                                                //         .nft!
                                                //         .imagePath ??
                                                //     "",
                                                // title: v
                                                //         .dataAllStatusNFT
                                                //         ?.data?[index]
                                                //         .nft!
                                                //         .name ??
                                                //     "",
                                                // expired: v
                                                //         .dataAllStatusNFT
                                                //         ?.data?[index]
                                                //         .nft!
                                                //         .expirationDate!
                                                //         .toString() ??
                                                //     "",
                                                // buyer: v
                                                //         .dataAllStatusNFT!
                                                //         .data?[index]
                                                //         .nft!
                                                //         .avlUnit
                                                //         .toString() ??
                                                //     "",
                                                // buyer_est: v
                                                //         .dataAllStatusNFT
                                                //         ?.data?[index]
                                                //         .nft!
                                                //         .qtyUnit
                                                //         .toString() ??
                                                //     "",
                                              ));
                                        } else {
                                          return Container();
                                        }
                                      }
                                      return CardNftTerjual(
                                        images: v.dataAllStatusNFT!.data![index]
                                                .nft?.imagePath ??
                                            "",
                                        title: v.dataAllStatusNFT?.data?[index]
                                                .nft?.name ??
                                            "",
                                        expired: v
                                                .dataAllStatusNFT
                                                ?.data?[index]
                                                .nft
                                                ?.expirationDate
                                                .toString() ??
                                            "",
                                        buyer: v.dataAllStatusNFT?.data?[index]
                                                .nft?.avlUnit
                                                .toString() ??
                                            "",
                                        buyer_est: v.dataAllStatusNFT
                                                ?.data?[index].nft?.qtyUnit
                                                .toString() ??
                                            "",
                                        nftSerialId: v.dataAllStatusNFT!
                                                .data![index].nftSerialId ??
                                            "",
                                        priceCoins: v.dataAllStatusNFT!
                                            .data![index].nft?.priceCoin,
                                        lockNft: v
                                                .dataAllStatusNFT!
                                                .data![index]
                                                .nft
                                                ?.holdLimitinDay
                                                .toString() ??
                                            "",
                                        monthlyPercentage: v
                                                .dataAllStatusNFT!
                                                .data![index]
                                                .nft
                                                ?.monthlyPercentage
                                                .toString() ??
                                            "",
                                        gasfee: v.dataAllStatusNFT!.data![index]
                                                .nft?.gasfee
                                                .toString() ??
                                            "",
                                        admfee: v.dataAllStatusNFT!.data![index]
                                                .nft?.admfee
                                                .toString() ??
                                            "",
                                        deskripsi: v.dataAllStatusNFT!
                                                .data![index].nft?.description
                                                .toString() ??
                                            "",
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
                                        v.dataAllStatusNFTUsaha?.data?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (_cariC.text.isNotEmpty) {
                                        if (v.dataAllStatusNFTUsaha!
                                            .data![index].nft!.name!
                                            .toLowerCase()
                                            .contains(
                                                _cariC.text.toLowerCase())) {
                                          return Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                              child: CardNftTerjual(
                                                  images: v
                                                          .dataAllStatusNFTUsaha!
                                                          .data![index]
                                                          .nft
                                                          ?.imagePath ??
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
                                                  title: v
                                                          .dataAllStatusNFTUsaha
                                                          ?.data?[index]
                                                          .nft
                                                          ?.name ??
                                                      "",
                                                  expired: v
                                                          .dataAllStatusNFTUsaha
                                                          ?.data?[index]
                                                          .nft
                                                          ?.expirationDate
                                                          .toString() ??
                                                      "",
                                                  buyer: v
                                                          .dataAllStatusNFTUsaha
                                                          ?.data?[index]
                                                          .nft
                                                          ?.avlUnit
                                                          .toString() ??
                                                      "",
                                                  buyer_est:
                                                      v.dataAllStatusNFTUsaha?.data?[index].nft?.qtyUnit.toString() ?? "",
                                                  nftSerialId: v.dataAllStatusNFTUsaha!.data![index].nftSerialId ?? "",
                                                  priceCoins: v.dataAllStatusNFTUsaha!.data![index].nft?.priceCoin,
                                                  lockNft: v.dataAllStatusNFTUsaha!.data![index].nft?.holdLimitinDay.toString() ?? "",
                                                  // lockNft: v.dataAllNFT!.data![index].nftUnit!
                                                  //         .where((element) => element.ownerId == null)
                                                  //         .isNotEmpty
                                                  //     ? v.dataAllNFT!.data![index].nftUnit
                                                  //         ?.where(
                                                  //             (element) => element.ownerId == null)
                                                  //         .first
                                                  //         .holdLimitTill
                                                  //         .toString()
                                                  //     : '',
                                                  monthlyPercentage: v.dataAllStatusNFTUsaha!.data![index].nft?.monthlyPercentage.toString() ?? "",
                                                  gasfee: v.dataAllStatusNFTUsaha!.data![index].nft?.gasfee.toString() ?? "",
                                                  admfee: v.dataAllStatusNFTUsaha!.data![index].nft?.admfee.toString() ?? "",
                                                  deskripsi: v.dataAllStatusNFTUsaha!.data![index].nft.toString()));
                                        } else {
                                          return Container();
                                        }
                                      }
                                      return CardNftTerjual(
                                        images: v.dataAllStatusNFTUsaha!
                                                .data![index].nft?.imagePath ??
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
                                        title: v.dataAllStatusNFTUsaha
                                                ?.data?[index].nft?.name ??
                                            "",
                                        expired: v
                                                .dataAllStatusNFTUsaha
                                                ?.data?[index]
                                                .nft
                                                ?.expirationDate
                                                .toString() ??
                                            "",
                                        buyer: v.dataAllStatusNFTUsaha
                                                ?.data?[index].nft?.avlUnit
                                                .toString() ??
                                            "",
                                        buyer_est: v.dataAllStatusNFTUsaha
                                                ?.data?[index].nft?.qtyUnit
                                                .toString() ??
                                            "",
                                        nftSerialId: v.dataAllStatusNFTUsaha!
                                                .data![index].nftSerialId ??
                                            "",
                                        priceCoins: v.dataAllStatusNFTUsaha!
                                            .data![index].nft?.priceCoin,
                                        lockNft: v
                                                .dataAllStatusNFTUsaha!
                                                .data![index]
                                                .nft
                                                ?.holdLimitinDay
                                                .toString() ??
                                            "",
                                        // lockNft: v.dataAllNFT!.data![index].nftUnit!
                                        //         .where((element) => element.ownerId == null)
                                        //         .isNotEmpty
                                        //     ? v.dataAllNFT!.data![index].nftUnit
                                        //         ?.where(
                                        //             (element) => element.ownerId == null)
                                        //         .first
                                        //         .holdLimitTill
                                        //         .toString()
                                        //     : '',
                                        monthlyPercentage: v
                                                .dataAllStatusNFTUsaha!
                                                .data![index]
                                                .nft
                                                ?.monthlyPercentage
                                                .toString() ??
                                            "",
                                        gasfee: v.dataAllStatusNFTUsaha!
                                                .data![index].nft?.gasfee
                                                .toString() ??
                                            "",
                                        admfee: v.dataAllStatusNFTUsaha!
                                                .data![index].nft?.admfee
                                                .toString() ??
                                            "",
                                        deskripsi: v.dataAllStatusNFTUsaha!
                                                .data![index].nft?.description
                                                .toString() ??
                                            "",
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text('Tidak Ada Data'),
                                  ))
                    // statusNFTTamplian == 'umum'
                    //     ? Expanded(
                    //         child: jmlahData! > 0
                    //             ? ListView.builder(
                    //                 itemCount: v.dataAllStatusNFT?.data?.length,
                    //                 itemBuilder:
                    //                     (BuildContext context, int index) {
                    //                   if (_cariC.text.isNotEmpty) {
                    //                     if (v.dataAllStatusNFT!.data![index]
                    //                         .nft!.name!
                    //                         .toLowerCase()
                    //                         .contains(
                    //                             _cariC.text.toLowerCase())) {
                    //                       return Padding(
                    //                           padding:
                    //                               const EdgeInsets.symmetric(
                    //                                   vertical: 8.0),
                    //                           child: CardNftTerjual(
                    //                             images: v
                    //                                     .dataAllStatusNFT!
                    //                                     .data![index]
                    //                                     .nft
                    //                                     ?.imagePath ??
                    //                                 "",
                    //                             //     .where((element) => element.ownerId == null)
                    //                             //     .isNotEmpty
                    //                             // ? v.dataAllNFT!.data![index].nftUnit
                    //                             //     ?.where(
                    //                             //         (element) => element.ownerId == null)
                    //                             //     .first
                    //                             //     .nftSerialId
                    //                             //     .toString()
                    //                             // : '',
                    //                             title: v
                    //                                     .dataAllStatusNFT
                    //                                     ?.data?[index]
                    //                                     .nft
                    //                                     ?.name ??
                    //                                 "",
                    //                             expired: v
                    //                                     .dataAllStatusNFT
                    //                                     ?.data?[index]
                    //                                     .nft
                    //                                     ?.expirationDate
                    //                                     .toString() ??
                    //                                 "",
                    //                             buyer: v
                    //                                     .dataAllStatusNFT
                    //                                     ?.data?[index]
                    //                                     .nft
                    //                                     ?.avlUnit
                    //                                     .toString() ??
                    //                                 "",
                    //                             buyer_est: v
                    //                                     .dataAllStatusNFT
                    //                                     ?.data?[index]
                    //                                     .nft
                    //                                     ?.qtyUnit
                    //                                     .toString() ??
                    //                                 "",
                    //                             nftSerialId: v
                    //                                     .dataAllStatusNFT!
                    //                                     .data![index]
                    //                                     .nftSerialId ??
                    //                                 "",
                    //                             priceCoins: v
                    //                                 .dataAllStatusNFT!
                    //                                 .data![index]
                    //                                 .nft
                    //                                 ?.priceCoin,
                    //                             lockNft: v
                    //                                     .dataAllStatusNFT!
                    //                                     .data![index]
                    //                                     .nft
                    //                                     ?.holdLimitinDay
                    //                                     .toString() ??
                    //                                 "",
                    //                             // lockNft: v.dataAllNFT!.data![index].nftUnit!
                    //                             //         .where((element) => element.ownerId == null)
                    //                             //         .isNotEmpty
                    //                             //     ? v.dataAllNFT!.data![index].nftUnit
                    //                             //         ?.where(
                    //                             //             (element) => element.ownerId == null)
                    //                             //         .first
                    //                             //         .holdLimitTill
                    //                             //         .toString()
                    //                             //     : '',
                    //                             monthlyPercentage: v
                    //                                     .dataAllStatusNFT!
                    //                                     .data![index]
                    //                                     .nft
                    //                                     ?.monthlyPercentage
                    //                                     .toString() ??
                    //                                 "",
                    //                             gasfee: v
                    //                                     .dataAllStatusNFT!
                    //                                     .data![index]
                    //                                     .nft
                    //                                     ?.gasfee
                    //                                     .toString() ??
                    //                                 "",
                    //                             admfee: v
                    //                                     .dataAllStatusNFT!
                    //                                     .data![index]
                    //                                     .nft
                    //                                     ?.admfee
                    //                                     .toString() ??
                    //                                 "",
                    //                           ));
                    //                     } else {
                    //                       return Container();
                    //                     }
                    //                   }
                    //                   return CardNftTerjual(
                    //                     images: v.dataAllStatusNFT!.data![index]
                    //                             .nft?.imagePath ??
                    //                         "",
                    //                     //     .where((element) => element.ownerId == null)
                    //                     //     .isNotEmpty
                    //                     // ? v.dataAllNFT!.data![index].nftUnit
                    //                     //     ?.where(
                    //                     //         (element) => element.ownerId == null)
                    //                     //     .first
                    //                     //     .nftSerialId
                    //                     //     .toString()
                    //                     // : '',
                    //                     title: v.dataAllStatusNFT?.data?[index]
                    //                             .nft?.name ??
                    //                         "",
                    //                     expired: v
                    //                             .dataAllStatusNFT
                    //                             ?.data?[index]
                    //                             .nft
                    //                             ?.expirationDate
                    //                             .toString() ??
                    //                         "",
                    //                     buyer: v.dataAllStatusNFT?.data?[index]
                    //                             .nft?.avlUnit
                    //                             .toString() ??
                    //                         "",
                    //                     buyer_est: v.dataAllStatusNFT
                    //                             ?.data?[index].nft?.qtyUnit
                    //                             .toString() ??
                    //                         "",
                    //                     nftSerialId: v.dataAllStatusNFT!
                    //                             .data![index].nftSerialId ??
                    //                         "",
                    //                     priceCoins: v.dataAllStatusNFT!
                    //                         .data![index].nft?.priceCoin,
                    //                     lockNft: v
                    //                             .dataAllStatusNFT!
                    //                             .data![index]
                    //                             .nft
                    //                             ?.holdLimitinDay
                    //                             .toString() ??
                    //                         "",
                    //                     // lockNft: v.dataAllNFT!.data![index].nftUnit!
                    //                     //         .where((element) => element.ownerId == null)
                    //                     //         .isNotEmpty
                    //                     //     ? v.dataAllNFT!.data![index].nftUnit
                    //                     //         ?.where(
                    //                     //             (element) => element.ownerId == null)
                    //                     //         .first
                    //                     //         .holdLimitTill
                    //                     //         .toString()
                    //                     //     : '',
                    //                     monthlyPercentage: v
                    //                             .dataAllStatusNFT!
                    //                             .data![index]
                    //                             .nft
                    //                             ?.monthlyPercentage
                    //                             .toString() ??
                    //                         "",
                    //                     gasfee: v.dataAllStatusNFT!.data![index]
                    //                             .nft?.gasfee
                    //                             .toString() ??
                    //                         "",
                    //                     admfee: v.dataAllStatusNFT!.data![index]
                    //                             .nft?.admfee
                    //                             .toString() ??
                    //                         "",
                    //                   );
                    //                 },
                    //               )
                    //             : Center(
                    //                 child: Text('Tidak Ada Data'),
                    //               ))
                    //     : Expanded(
                    //         child: jmlahDatausaha! > 0
                    //             ? ListView.builder(
                    //                 itemCount:
                    //                     v.dataAllStatusNFTUsaha?.data?.length,
                    //                 itemBuilder:
                    //                     (BuildContext context, int index) {
                    //                   if (_cariC.text.isNotEmpty) {
                    //                     if (v.dataAllStatusNFT!.data![index]
                    //                         .nft!.name!
                    //                         .toLowerCase()
                    //                         .contains(
                    //                             _cariC.text.toLowerCase())) {
                    //                       return Padding(
                    //                           padding:
                    //                               const EdgeInsets.symmetric(
                    //                                   vertical: 8.0),
                    //                           child: CardNftTerjual(
                    //                             images: v
                    //                                     .dataAllStatusNFTUsaha!
                    //                                     .data![index]
                    //                                     .nft
                    //                                     ?.imagePath ??
                    //                                 "",
                    //                             //     .where((element) => element.ownerId == null)
                    //                             //     .isNotEmpty
                    //                             // ? v.dataAllNFT!.data![index].nftUnit
                    //                             //     ?.where(
                    //                             //         (element) => element.ownerId == null)
                    //                             //     .first
                    //                             //     .nftSerialId
                    //                             //     .toString()
                    //                             // : '',
                    //                             title: v
                    //                                     .dataAllStatusNFTUsaha
                    //                                     ?.data?[index]
                    //                                     .nft
                    //                                     ?.name ??
                    //                                 "",
                    //                             expired: v
                    //                                     .dataAllStatusNFTUsaha
                    //                                     ?.data?[index]
                    //                                     .nft
                    //                                     ?.expirationDate
                    //                                     .toString() ??
                    //                                 "",
                    //                             buyer: v
                    //                                     .dataAllStatusNFTUsaha
                    //                                     ?.data?[index]
                    //                                     .nft
                    //                                     ?.avlUnit
                    //                                     .toString() ??
                    //                                 "",
                    //                             buyer_est: v
                    //                                     .dataAllStatusNFTUsaha
                    //                                     ?.data?[index]
                    //                                     .nft
                    //                                     ?.qtyUnit
                    //                                     .toString() ??
                    //                                 "",
                    //                             nftSerialId: v
                    //                                     .dataAllStatusNFTUsaha!
                    //                                     .data![index]
                    //                                     .nftSerialId ??
                    //                                 "",
                    //                             priceCoins: v
                    //                                 .dataAllStatusNFTUsaha!
                    //                                 .data![index]
                    //                                 .nft
                    //                                 ?.priceCoin,
                    //                             lockNft: v
                    //                                     .dataAllStatusNFTUsaha!
                    //                                     .data![index]
                    //                                     .nft
                    //                                     ?.holdLimitinDay
                    //                                     .toString() ??
                    //                                 "",
                    //                             // lockNft: v.dataAllNFT!.data![index].nftUnit!
                    //                             //         .where((element) => element.ownerId == null)
                    //                             //         .isNotEmpty
                    //                             //     ? v.dataAllNFT!.data![index].nftUnit
                    //                             //         ?.where(
                    //                             //             (element) => element.ownerId == null)
                    //                             //         .first
                    //                             //         .holdLimitTill
                    //                             //         .toString()
                    //                             //     : '',
                    //                             monthlyPercentage: v
                    //                                     .dataAllStatusNFTUsaha!
                    //                                     .data![index]
                    //                                     .nft
                    //                                     ?.monthlyPercentage
                    //                                     .toString() ??
                    //                                 "",
                    //                             gasfee: v
                    //                                     .dataAllStatusNFTUsaha!
                    //                                     .data![index]
                    //                                     .nft
                    //                                     ?.gasfee
                    //                                     .toString() ??
                    //                                 "",
                    //                             admfee: v
                    //                                     .dataAllStatusNFTUsaha!
                    //                                     .data![index]
                    //                                     .nft
                    //                                     ?.admfee
                    //                                     .toString() ??
                    //                                 "",
                    //                           ));
                    //                     } else {
                    //                       return Container();
                    //                     }
                    //                   }
                    //                   return CardNftTerjual(
                    //                     images: v.dataAllStatusNFTUsaha!
                    //                             .data![index].nft?.imagePath ??
                    //                         "",
                    //                     //     .where((element) => element.ownerId == null)
                    //                     //     .isNotEmpty
                    //                     // ? v.dataAllNFT!.data![index].nftUnit
                    //                     //     ?.where(
                    //                     //         (element) => element.ownerId == null)
                    //                     //     .first
                    //                     //     .nftSerialId
                    //                     //     .toString()
                    //                     // : '',
                    //                     title: v.dataAllStatusNFTUsaha
                    //                             ?.data?[index].nft?.name ??
                    //                         "",
                    //                     expired: v
                    //                             .dataAllStatusNFTUsaha
                    //                             ?.data?[index]
                    //                             .nft
                    //                             ?.expirationDate
                    //                             .toString() ??
                    //                         "",
                    //                     buyer: v.dataAllStatusNFTUsaha
                    //                             ?.data?[index].nft?.avlUnit
                    //                             .toString() ??
                    //                         "",
                    //                     buyer_est: v.dataAllStatusNFTUsaha
                    //                             ?.data?[index].nft?.qtyUnit
                    //                             .toString() ??
                    //                         "",
                    //                     nftSerialId: v.dataAllStatusNFTUsaha!
                    //                             .data![index].nftSerialId ??
                    //                         "",
                    //                     priceCoins: v.dataAllStatusNFTUsaha!
                    //                         .data![index].nft?.priceCoin,
                    //                     lockNft: v
                    //                             .dataAllStatusNFTUsaha!
                    //                             .data![index]
                    //                             .nft
                    //                             ?.holdLimitinDay
                    //                             .toString() ??
                    //                         "",
                    //                     // lockNft: v.dataAllNFT!.data![index].nftUnit!
                    //                     //         .where((element) => element.ownerId == null)
                    //                     //         .isNotEmpty
                    //                     //     ? v.dataAllNFT!.data![index].nftUnit
                    //                     //         ?.where(
                    //                     //             (element) => element.ownerId == null)
                    //                     //         .first
                    //                     //         .holdLimitTill
                    //                     //         .toString()
                    //                     //     : '',
                    //                     monthlyPercentage: v
                    //                             .dataAllStatusNFTUsaha!
                    //                             .data![index]
                    //                             .nft
                    //                             ?.monthlyPercentage
                    //                             .toString() ??
                    //                         "",
                    //                     gasfee: v.dataAllStatusNFTUsaha!
                    //                             .data![index].nft?.gasfee
                    //                             .toString() ??
                    //                         "",
                    //                     admfee: v.dataAllStatusNFTUsaha!
                    //                             .data![index].nft?.admfee
                    //                             .toString() ??
                    //                         "",
                    //                   );
                    //                 },
                    //               )
                    //             : Center(
                    //                 child: Text('Tidak Ada Data'),
                    //               ))
                  ],
                ),
              );
            }),
    );
  }
}
