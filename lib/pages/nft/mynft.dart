// import 'package:flutter/material.dart';
// import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
// import 'package:kmp_togo_mobile/pages/nft/nft_components.dart';
// import 'package:kmp_togo_mobile/pages/nft/cardNFt/cardnftterjual.dart';
// import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import 'dart:math';

// class MyNFT extends StatefulWidget {
//   MyNFT({Key? key}) : super(key: key);

//   @override
//   State<MyNFT> createState() => _MyNFTState();
// }

// class _MyNFTState extends State<MyNFT> with TickerProviderStateMixin {
//   late ScrollController _scrollController;
//   bool? loading = true;
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       final _getkategoriProvider =
//           Provider.of<ProviderNft>(context, listen: false);
//       await _getkategoriProvider.getMyNFT(context);
//       setState(() {
//         loading = _getkategoriProvider.loadinggetNFTMy;
//       });
//     });

//     _scrollController = ScrollController()
//       ..addListener(() {
//         setState(() {});
//       });

//     super.initState();
//   }

//   bool get _isSliverAppBarExpanded {
//     return _scrollController.hasClients &&
//         _scrollController.offset > (200 - kToolbarHeight);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My NFT'),
//       ),
//       body: loading == true
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Consumer<ProviderNft>(
//               builder: (BuildContext context, v, Widget? child) {
//               return Container(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Container(
//                         padding: EdgeInsets.only(
//                           top: 2.w,
//                           bottom: 2.w,
//                           left: 2.w,
//                         ),
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey.shade300),
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(5)),
//                         child: Row(
//                           children: [
//                             Icon(
//                               Icons.search,
//                               size: 5.w,
//                               color: Colors.black87,
//                             ),
//                             SizedBox(width: 1.w),
//                             Text('Cari Disini',
//                                 style: TextStyling.normal14black),
//                           ],
//                         )),
//                     Container(
//                       margin: EdgeInsets.only(
//                         bottom: 1.5.w,
//                       ),
//                       padding: EdgeInsets.only(
//                         top: 5.w,
//                         bottom: 1.5.w,
//                         left: 0.w,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 3.w, vertical: 1.h),
//                             decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(
//                               child: Text('NFT Umum'),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.symmetric(
//                               horizontal: 2.w,
//                             ),
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 5.w, vertical: 1.h),
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 border: Border.all(),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(
//                               child: Text('NFT Usaha'),
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 3.w, vertical: 1.h),
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 border: Border.all(),
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(
//                               child: Text('NFT Terjual'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: v.dataAllNFTMy!.data!.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return CardNftTerjual(
//                             images:
//                                 v.dataAllNFTMy!.data![index].nft?.imagePath ??
//                                     "",
//                             //     .where((element) => element.ownerId == null)
//                             //     .isNotEmpty
//                             // ? v.dataAllNFT!.data![index].nftUnit
//                             //     ?.where(
//                             //         (element) => element.ownerId == null)
//                             //     .first
//                             //     .nftSerialId
//                             //     .toString()
//                             // : '',
//                             title: v.dataAllNFTMy?.data?[index].nft?.name ?? "",
//                             expired: v.dataAllNFTMy?.data?[index].nft
//                                     ?.expirationDate
//                                     .toString() ??
//                                 "",
//                             buyer: v.dataAllNFTMy?.data?[index].nft?.avlUnit
//                                     .toString() ??
//                                 "",
//                             buyer_est: v.dataAllNFTMy?.data?[index].nft?.qtyUnit
//                                     .toString() ??
//                                 "",
//                             nftSerialId:
//                                 v.dataAllNFTMy!.data![index].nftSerialId ?? "",
//                             priceCoins:
//                                 v.dataAllNFTMy!.data![index].nft?.priceCoin,
//                             lockNft: v.dataAllNFTMy!.data![index].nft
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
//                             monthlyPercentage: v.dataAllNFTMy!.data![index].nft
//                                     ?.monthlyPercentage
//                                     .toString() ??
//                                 "",
//                             gasfee: v.dataAllNFTMy!.data![index].nft?.gasfee
//                                     .toString() ??
//                                 "",
//                             admfee: v.dataAllNFTMy!.data![index].nft?.admfee
//                                     .toString() ??
//                                 "",
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }),
//     );
//   }
// }
