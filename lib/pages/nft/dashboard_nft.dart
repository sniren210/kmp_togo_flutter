import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/nft/nft_components.dart';
import 'package:kmp_togo_mobile/pages/nft/widgetNft/searchingnft.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';

class DashboardNFT extends StatefulWidget {
  DashboardNFT({Key? key}) : super(key: key);

  @override
  State<DashboardNFT> createState() => _DashboardNFTState();
}

class _DashboardNFTState extends State<DashboardNFT>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool? loading = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final _getkategoriProvider =
          Provider.of<ProviderNft>(context, listen: false);
      await _getkategoriProvider.getAllNFT(context);
      setState(() {
        loading = _getkategoriProvider.loadinggetNFTALL;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            Get.to(() => SearchinfNFT());
          },
          child: Container(
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
        ),
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
      body: loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<ProviderNft>(
              builder: (BuildContext context, v, Widget? child) {
              print(v.dataAllNFT?.data?.last.name);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverLayoutBuilder(builder: (_, _sliver) {
                      return SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (_, int index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('NFT Terbaru',
                                    style: TextStyling.w600bold16black)
                              ],
                            ),
                          );
                        },
                        childCount: 1,
                      ));
                    }),
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200.0, mainAxisExtent: 250),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return NFTDashCard(
                            images: v.dataAllNFT?.data?[index].imagePath,
                            title: v.dataAllNFT?.data?[index].name ?? "",
                            expired:
                                v.dataAllNFT?.data?[index].expirationDate ?? "",
                            buyer:
                                v.dataAllNFT?.data?[index].avlUnit.toString(),
                            buyer_est:
                                v.dataAllNFT?.data?[index].qtyUnit.toString(),
                            nftSerialId: v.dataAllNFT!.data![index].nftUnit!
                                    .where((element) => element.ownerId == null)
                                    .isNotEmpty
                                ? v.dataAllNFT!.data![index].nftUnit
                                    ?.where(
                                        (element) => element.ownerId == null)
                                    .first
                                    .nftSerialId
                                    .toString()
                                : '',
                            priceCoins: v.dataAllNFT!.data![index].nftUnit!
                                    .where((element) => element.ownerId == null)
                                    .isNotEmpty
                                ? v.dataAllNFT!.data![index].nftUnit
                                    ?.where(
                                        (element) => element.ownerId == null)
                                    .first
                                    .priceCoin
                                    .toString()
                                : v.dataAllNFT!.data![index].nftUnit?.first
                                    .priceCoin
                                    .toString(),
                            lockNft: v.dataAllNFT!.data![index].nftUnit!
                                    .where((element) => element.ownerId == null)
                                    .isNotEmpty
                                ? v.dataAllNFT!.data![index].nftUnit
                                    ?.where(
                                        (element) => element.ownerId == null)
                                    .first
                                    .holdLimitTill
                                    .toString()
                                : '',
                            monthlyPercentage: v.dataAllNFT!.data![index]
                                .nftUnit!.first.monthlyPercentage
                                .toString(),
                            //  v
                            //         .dataAllNFT!.data![index].nftUnit!
                            //         .where((element) => element.ownerId == null)
                            //         .isNotEmpty
                            //     ? v.dataAllNFT!.data![index].nftUnit
                            //         ?.where(
                            //             (element) => element.ownerId == null)
                            //         .first
                            //         .monthlyPercentage
                            //         .toString()
                            //     : '',
                            gasfee:
                                v.dataAllNFT?.data?[index].gasfee.toString(),
                            admfee:
                                v.dataAllNFT?.data?[index].admfee.toString(),
                            deskripsi: v.dataAllNFT?.data?[index].description,
                            owner: v.dataAllNFT!.data![index].nftUnit!
                                    .where((element) => element.ownerId == null)
                                    .isNotEmpty
                                ? v.dataAllNFT!.data![index].nftUnit
                                    ?.where(
                                        (element) => element.ownerId == null)
                                    .first
                                    .ownerId
                                    .toString()
                                : '',
                          );
                        },
                        childCount: v.dataAllNFT?.data?.length,
                      ),
                    ),
                  ],
                ),
              );
            }),
    );
  }
}
