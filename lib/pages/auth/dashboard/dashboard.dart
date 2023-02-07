// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:kmp_togo_mobile/apis/repository.dart';
// import 'package:kmp_togo_mobile/helpers/machines.dart';
// import 'package:kmp_togo_mobile/pages/auth/dashboard/marketplacePage.dart';
// import 'package:kmp_togo_mobile/pages/base.dart';
// import 'package:kmp_togo_mobile/pages/cart/cart_screen.dart';
// import 'package:kmp_togo_mobile/pages/ppob/inputpobwithnumber.dart';
// import 'package:kmp_togo_mobile/pages/ppob/wtNumber/inputPpobWTNumber.dart';
// import 'package:kmp_togo_mobile/pages/common/cardmitraketgori.dart';
// import 'package:kmp_togo_mobile/pages/common/cardnftmitra.dart';
// import 'package:kmp_togo_mobile/pages/common/cardpromo.dart';
// import 'package:kmp_togo_mobile/pages/nft/dashboard_nft.dart';
// import 'package:kmp_togo_mobile/pages/nft/homenft.dart';
// import 'package:kmp_togo_mobile/pages/produsennft/hakaksesproduk.dart';
// import 'package:kmp_togo_mobile/pages/produsennft/produsenmyproduk.dart';
// import 'package:kmp_togo_mobile/pages/umkm/umkmMyProduk.dart';
// import 'package:kmp_togo_mobile/pages/wallet/dashboardwallet.dart';
// import 'package:kmp_togo_mobile/providers/account/provider_account.dart';
// import 'package:kmp_togo_mobile/providers/cart/cart_provider.dart';
// import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
// import 'package:kmp_togo_mobile/utils/layarmax.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Dashboard extends StatefulWidget {
//   Dashboard({Key? key}) : super(key: key);

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> with NumberFormatMachine {
//   final controller = PageController(
//     initialPage: 0,
//   );

//   bool? loading = true;
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       _showOpenDialog(context);
//       final _getkategoriProvider =
//           Provider.of<ProviderNft>(context, listen: false);
//       await _getkategoriProvider.getAllNFT(context);
//       setState(() {
//         loading = _getkategoriProvider.loadinggetNFTALL;
//       });
//     });
//     super.initState();
//   }

//   _showOpenDialog(_) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return Center(
//               child: ClipRect(
//             child: Container(
//                 height: MediaQuery.of(context).size.height / 2.2,
//                 width: MediaQuery.of(context).size.width / 1,
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                 child: AlertDialog(
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   content: Stack(
//                     children: [
//                       Align(
//                         alignment: Alignment.center,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: <Widget>[
//                             InkWell(
//                               child: ClipRRect(
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       image: const DecorationImage(
//                                         image: AssetImage(
//                                           'assets/images/kotak.jpg',
//                                         ),
//                                         fit:  BoxFit.cover,
//                                       )),
//                                   height:
//                                       MediaQuery.of(context).size.height / 3.2,
//                                   width: MediaQuery.of(context).size.width / 1,
//                                 ),
//                               ),
//                               onTap: () {},
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height / 70,
//                             ),

//                             // InkWell(
//                             //   child: Text('Close(X)',
//                             //       style: TextStyle(
//                             //         fontSize: MediaQuery.of(context).size.width / 25,
//                             //         color: Colors.red,
//                             //         fontFamily: 'Open Sans',
//                             //       )),
//                             //   onTap: () {
//                             //     Navigator.of(context).pop();
//                             //   },
//                             // ),
//                           ],
//                         ),
//                       ),
//                       Align(
//                           alignment: Alignment.topRight,
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: ClipOval(
//                               child: Container(
//                                 color: Colors.red,
//                                 child: const Icon(
//                                   Icons.close,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           )),
//                     ],
//                   ),
//                 )),
//           ));
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BaseWidget<ProviderAccountInfo>(
//       model: ProviderAccountInfo(Repository()),
//       onModelReady: (model) => model.fetchAccountInfo(),
//       child: Container(),
//       builder: (context, model, child) =>
//           Scaffold(body: Builder(builder: (context) {
//         return Consumer<ProviderNft>(
//             builder: (BuildContext context, v, Widget? child) {
//           return SizedBox(
//               height: context.height,
//               width: context.width,
//               child: Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Flexible(
//                         flex: 4,
//                         child: PageView(
//                           padEnds: false,
//                           pageSnapping: true,
//                           controller: controller,
//                           scrollDirection: Axis.horizontal,
//                           children: <Widget>[
//                             Container(
//                               color: const Color(0xFF85014e),
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(
//                                         left: 4.w, right: 4.w, top: 5.h),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             const CircleAvatar(
//                                               radius: 20,
//                                               child: CircleAvatar(
//                                                   radius: 20,
//                                                   backgroundImage: AssetImage(
//                                                       'assets/images/White-1024.png')),
//                                             ),
//                                             SizedBox(width: 3.w),
//                                             Container(
//                                               child: Text(
//                                                 'KMP-ToGo',
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 20.sp,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           children: [
//                                             const Icon(
//                                               Icons.notifications,
//                                               color: Colors.white,
//                                             ),
//                                             const SizedBox(width: 6),
//                                             Consumer<CartProvider>(builder:
//                                                 (context, value, child) {
//                                               if (value.getCounter() < 1) {
//                                                 return SizedBox(
//                                                     width: 18,
//                                                     child: IconButton(
//                                                         onPressed: () {
//                                                           Navigator.push(
//                                                               context,
//                                                               MaterialPageRoute(
//                                                                   builder:
//                                                                       (context) =>
//                                                                           const CartScreen()));
//                                                         },
//                                                         icon: const Icon(Icons
//                                                             .shopping_cart),
//                                                         color: Colors.white));
//                                               }
//                                               return Badge(
//                                                 badgeContent: Text(
//                                                   value.getCounter().toString(),
//                                                   style: const TextStyle(
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                 ),
//                                                 position: const BadgePosition(
//                                                     start: 30, bottom: 30),
//                                                 child: IconButton(
//                                                   onPressed: () {
//                                                     Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder: (context) =>
//                                                                 const CartScreen()));
//                                                   },
//                                                   icon: const Icon(
//                                                       Icons.shopping_cart,
//                                                       color: Colors.white),
//                                                 ),
//                                               );
//                                             }),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.only(
//                                         left: 4.w,
//                                         right: 4.w,
//                                         top: 1.h,
//                                         bottom: 1.h),
//                                     margin: EdgeInsets.only(
//                                         left: 4.w, right: 4.w, top: 3.h),
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     child: IntrinsicHeight(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Expanded(
//                                             flex: 4,
//                                             child: Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 2.h, bottom: 2.h),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.start,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Icon(
//                                                             Icons.wallet,
//                                                             size: 9.w,
//                                                             color: const Color(
//                                                                 0xFF85014e),
//                                                           ),
//                                                           SizedBox(
//                                                             width: 2.w,
//                                                           ),
//                                                           Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 'Saldo Poin',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontSize:
//                                                                         9.sp),
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 1.w,
//                                                               ),
//                                                               model.busy
//                                                                   ? Text(
//                                                                       '....',
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                                   : Text(
//                                                                       getNumberFormatSeparator(model
//                                                                           .items!
//                                                                           .data
//                                                                           .tokenWallet
//                                                                           .token),
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                             ],
//                                                           )
//                                                         ],
//                                                       )
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           const Expanded(
//                                             flex: 1,
//                                             child: VerticalDivider(
//                                               color: Colors.black,
//                                               thickness: 1,
//                                             ),
//                                           ),
//                                           Expanded(
//                                             flex: 4,
//                                             child: Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 2.h, bottom: 2.h),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.start,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Container(
//                                                             width: 10.w,
//                                                             height: 4.h,
//                                                             decoration: const BoxDecoration(
//                                                                 image: DecorationImage(
//                                                                     fit: BoxFit
//                                                                         .contain,
//                                                                     image: AssetImage(
//                                                                         'assets/images/logon.jpg'))),
//                                                             // child: Icon(
//                                                             //   Icons.monetization_on,
//                                                             //   size: 9.w,
//                                                             //   color:
//                                                             //       Color(0xFF85014e),
//                                                             // ),
//                                                           ),
//                                                           SizedBox(
//                                                             width: 2.w,
//                                                           ),
//                                                           Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Container(
//                                                                 child: Text(
//                                                                   'Saldo Coin',
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black54,
//                                                                       fontSize:
//                                                                           9.sp),
//                                                                 ),
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 1.w,
//                                                               ),
//                                                               model.busy
//                                                                   ? Text(
//                                                                       '....',
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                                   : Text(
//                                                                       getNumberFormatSeparator(model
//                                                                           .items!
//                                                                           .data
//                                                                           .coinWallet
//                                                                           .coin),
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                             ],
//                                                           )
//                                                         ],
//                                                       )
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 2.h,
//                                   ),
//                                   SmoothPageIndicator(
//                                       controller: controller, // PageController
//                                       count: 3,
//                                       effect: WormEffect(
//                                           dotHeight: 8,
//                                           dotWidth: 8,
//                                           dotColor: Colors.grey.shade500,
//                                           activeDotColor: Colors.grey
//                                               .shade700), // your preferred effect
//                                       onDotClicked: (index) {
//                                         controller.animateToPage(index,
//                                             duration: const Duration(
//                                                 microseconds: 500),
//                                             curve: Curves.easeInOut);
//                                       }),
//                                   SizedBox(
//                                     height: 3.h,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         InkWell(
//                                           onTap: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         DashboardWallet(
//                                                             isHome: false)));
//                                           },
//                                           child: Column(
//                                             children: [
//                                               Container(
//                                                 child: Icon(Icons.wallet,
//                                                     size: 8.w,
//                                                     color: Colors.white),
//                                               ),
//                                               Container(
//                                                 child: Text(
//                                                   'Withdraw',
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 8.sp),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       DashboardWallet(
//                                                           isHome: false)),
//                                             );
//                                           },
//                                           child: Column(
//                                             children: [
//                                               Container(
//                                                 child: Icon(Icons.wallet,
//                                                     size: 8.w,
//                                                     color: Colors.white),
//                                               ),
//                                               Container(
//                                                 child: Text(
//                                                   'Topup',
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 8.sp),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               color: Colors.indigo,
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(
//                                         left: 4.w, right: 4.w, top: 5.h),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             const CircleAvatar(
//                                               radius: 20,
//                                               child: CircleAvatar(
//                                                   radius: 20,
//                                                   backgroundImage: AssetImage(
//                                                       'assets/images/White-1024.png')),
//                                             ),
//                                             SizedBox(width: 3.w),
//                                             Container(
//                                               child: Text(
//                                                 'KMP-ToGo',
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 20.sp,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const Icon(
//                                           Icons.notifications,
//                                           color: Colors.white,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.only(
//                                         left: 4.w,
//                                         right: 4.w,
//                                         top: 1.h,
//                                         bottom: 1.h),
//                                     margin: EdgeInsets.only(
//                                         left: 4.w, right: 4.w, top: 3.h),
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     child: IntrinsicHeight(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Expanded(
//                                             flex: 4,
//                                             child: Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 2.h, bottom: 2.h),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.start,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Container(
//                                                             child: Icon(
//                                                               Icons.wallet,
//                                                               size: 9.w,
//                                                               color: const Color(
//                                                                   0xFF85014e),
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             width: 2.w,
//                                                           ),
//                                                           Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Container(
//                                                                 child: Text(
//                                                                   'Saldo Poin',
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black54,
//                                                                       fontSize:
//                                                                           9.sp),
//                                                                 ),
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 1.w,
//                                                               ),
//                                                               model.busy
//                                                                   ? Text(
//                                                                       '....',
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                                   : Text(
//                                                                       getNumberFormatSeparator(model
//                                                                           .items!
//                                                                           .data
//                                                                           .tokenWallet
//                                                                           .token),
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                             ],
//                                                           )
//                                                         ],
//                                                       )
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           const Expanded(
//                                             flex: 1,
//                                             child: VerticalDivider(
//                                               color: Colors.black,
//                                               thickness: 1,
//                                             ),
//                                           ),
//                                           Expanded(
//                                             flex: 4,
//                                             child: Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 2.h, bottom: 2.h),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.start,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Container(
//                                                             width: 10.w,
//                                                             height: 4.h,
//                                                             decoration: const BoxDecoration(
//                                                                 image: DecorationImage(
//                                                                     fit: BoxFit
//                                                                         .contain,
//                                                                     image: AssetImage(
//                                                                         'assets/images/logon.jpg'))),
//                                                             // child: Icon(
//                                                             //   Icons.monetization_on,
//                                                             //   size: 9.w,
//                                                             //   color:
//                                                             //       Color(0xFF85014e),
//                                                             // ),
//                                                           ),
//                                                           SizedBox(
//                                                             width: 2.w,
//                                                           ),
//                                                           Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Container(
//                                                                 child: Text(
//                                                                   'Saldo Coin',
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black54,
//                                                                       fontSize:
//                                                                           9.sp),
//                                                                 ),
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 1.w,
//                                                               ),
//                                                               model.busy
//                                                                   ? Text(
//                                                                       '....',
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                                   : Text(
//                                                                       getNumberFormatSeparator(model
//                                                                           .items!
//                                                                           .data
//                                                                           .coinWallet
//                                                                           .coin),
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                             ],
//                                                           )
//                                                         ],
//                                                       )
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 2.h,
//                                   ),
//                                   SmoothPageIndicator(
//                                       controller: controller, // PageController
//                                       count: 3,
//                                       effect: WormEffect(
//                                           dotHeight: 8,
//                                           dotWidth: 8,
//                                           dotColor: Colors.grey.shade500,
//                                           activeDotColor: Colors.grey
//                                               .shade700), // your preferred effect
//                                       onDotClicked: (index) {
//                                         controller.animateToPage(index,
//                                             duration: const Duration(
//                                                 microseconds: 500),
//                                             curve: Curves.easeInOut);
//                                       }),
//                                   SizedBox(
//                                     height: 3.h,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Container(
//                                               child: Icon(Icons.wallet,
//                                                   size: 8.w,
//                                                   color: Colors.white),
//                                             ),
//                                             Container(
//                                               child: Text(
//                                                 'Withdraw',
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 8.sp),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         Column(
//                                           children: [
//                                             Container(
//                                               child: Icon(Icons.wallet,
//                                                   size: 8.w,
//                                                   color: Colors.white),
//                                             ),
//                                             Container(
//                                               child: Text(
//                                                 'Topup',
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 8.sp),
//                                               ),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               color: Colors.teal,
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(
//                                         left: 4.w, right: 4.w, top: 5.h),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             const CircleAvatar(
//                                               radius: 20,
//                                               child: CircleAvatar(
//                                                   radius: 20,
//                                                   backgroundImage: AssetImage(
//                                                       'assets/images/White-1024.png')),
//                                             ),
//                                             SizedBox(width: 3.w),
//                                             Container(
//                                               child: Text(
//                                                 'KMP-ToGo',
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 20.sp,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         const Icon(
//                                           Icons.notifications,
//                                           color: Colors.white,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.only(
//                                         left: 4.w,
//                                         right: 4.w,
//                                         top: 1.h,
//                                         bottom: 1.h),
//                                     margin: EdgeInsets.only(
//                                         left: 4.w, right: 4.w, top: 3.h),
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     child: IntrinsicHeight(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           Expanded(
//                                             flex: 4,
//                                             child: Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 2.h, bottom: 2.h),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.start,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Container(
//                                                             child: Icon(
//                                                               Icons.wallet,
//                                                               size: 9.w,
//                                                               color: const Color(
//                                                                   0xFF85014e),
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             width: 2.w,
//                                                           ),
//                                                           Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Container(
//                                                                 child: Text(
//                                                                   'Saldo Poin',
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black54,
//                                                                       fontSize:
//                                                                           9.sp),
//                                                                 ),
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 1.w,
//                                                               ),
//                                                               model.busy
//                                                                   ? Text(
//                                                                       '....',
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                                   : Text(
//                                                                       getNumberFormatSeparator(model
//                                                                           .items!
//                                                                           .data
//                                                                           .tokenWallet
//                                                                           .token),
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                             ],
//                                                           )
//                                                         ],
//                                                       )
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           const Expanded(
//                                             flex: 1,
//                                             child: VerticalDivider(
//                                               color: Colors.black,
//                                               thickness: 1,
//                                             ),
//                                           ),
//                                           Expanded(
//                                             flex: 4,
//                                             child: Container(
//                                               margin: EdgeInsets.only(
//                                                   top: 2.h, bottom: 2.h),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.start,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Container(
//                                                             width: 10.w,
//                                                             height: 4.h,
//                                                             decoration: const BoxDecoration(
//                                                                 image: DecorationImage(
//                                                                     fit: BoxFit
//                                                                         .contain,
//                                                                     image: AssetImage(
//                                                                         'assets/images/logon.jpg'))),
//                                                             // child: Icon(
//                                                             //   Icons.monetization_on,
//                                                             //   size: 9.w,
//                                                             //   color:
//                                                             //       Color(0xFF85014e),
//                                                             // ),
//                                                           ),
//                                                           SizedBox(
//                                                             width: 2.w,
//                                                           ),
//                                                           Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Container(
//                                                                 child: Text(
//                                                                   'Saldo Coin',
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black54,
//                                                                       fontSize:
//                                                                           9.sp),
//                                                                 ),
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 1.w,
//                                                               ),
//                                                               model.busy
//                                                                   ? Text(
//                                                                       '....',
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                                   : Text(
//                                                                       getNumberFormatSeparator(model
//                                                                           .items!
//                                                                           .data
//                                                                           .coinWallet
//                                                                           .coin),
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               12.sp),
//                                                                     )
//                                                             ],
//                                                           )
//                                                         ],
//                                                       )
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 2.h,
//                                   ),
//                                   SmoothPageIndicator(
//                                       controller: controller, // PageController
//                                       count: 3,
//                                       effect: WormEffect(
//                                           dotHeight: 8,
//                                           dotWidth: 8,
//                                           dotColor: Colors.grey.shade500,
//                                           activeDotColor: Colors.grey
//                                               .shade700), // your preferred effect
//                                       onDotClicked: (index) {
//                                         controller.animateToPage(index,
//                                             duration: const Duration(
//                                                 microseconds: 500),
//                                             curve: Curves.easeInOut);
//                                       }),
//                                   SizedBox(
//                                     height: 3.h,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Column(
//                                           children: [
//                                             Icon(Icons.wallet,
//                                                 size: 8.w, color: Colors.white),
//                                             Text(
//                                               'Withdraw',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 8.sp),
//                                             ),
//                                           ],
//                                         ),
//                                         Column(
//                                           children: [
//                                             Icon(Icons.wallet,
//                                                 size: 8.w, color: Colors.white),
//                                             Text(
//                                               'Topup',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 8.sp),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       model.busy
//                           ? Container()
//                           : Flexible(
//                               flex: 6,
//                               child: Container(
//                                 color: Colors.white,
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Expanded(
//                                       flex: 7,
//                                       child: SingleChildScrollView(
//                                         child: Column(
//                                           children: [
//                                             SizedBox(
//                                               height: 2.h,
//                                             ),
//                                             GridView(
//                                                 padding: EdgeInsets.zero,
//                                                 shrinkWrap: true,
//                                                 physics:
//                                                     const NeverScrollableScrollPhysics(),
//                                                 gridDelegate:
//                                                     const SliverGridDelegateWithFixedCrossAxisCount(
//                                                         crossAxisCount: 5,
//                                                         mainAxisSpacing: 5),
//                                                 children: [
//                                                   cardmenu(
//                                                       'Pulsa', Icons.smartphone,
//                                                       () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               InputPPOBWithNumber(
//                                                                 title: 'Pulsa',
//                                                                 product_type:
//                                                                     'pulsa',
//                                                               )),
//                                                     );
//                                                   }),
//                                                   cardmenu(
//                                                       'Data', Icons.laptop_mac,
//                                                       () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               InputPPOBWithNumber(
//                                                                 title: 'Data',
//                                                                 product_type:
//                                                                     'data',
//                                                               )),
//                                                     );
//                                                   }),
//                                                   cardmenu('Token',
//                                                       Icons.lightbulb_outline,
//                                                       () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               InputPPOBWithNumber(
//                                                                 title: 'Token',
//                                                                 product_type:
//                                                                     'pln',
//                                                               )),
//                                                     );
//                                                   }),
//                                                   cardmenu('PLN',
//                                                       Icons.electric_bolt, () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               InputPPOBWithoutNumber(
//                                                                   title: 'PLN',
//                                                                   product_type:
//                                                                       'pln')),
//                                                     );
//                                                   }),
//                                                   cardmenu('PDAM', Icons.water,
//                                                       () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               InputPPOBWithoutNumber(
//                                                                   title: 'PDAM',
//                                                                   product_type:
//                                                                       'pdam')),
//                                                     );
//                                                   }),
//                                                   cardmenu('E-Money',
//                                                       Icons.credit_card_rounded,
//                                                       () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               InputPPOBWithoutNumber(
//                                                                 title:
//                                                                     'e-Money',
//                                                                 product_type:
//                                                                     'emoney',
//                                                               )),
//                                                     );
//                                                   }),
//                                                   cardmenu(
//                                                       'Internet', Icons.wifi,
//                                                       () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               InputPPOBWithoutNumber(
//                                                                 title:
//                                                                     'Internet',
//                                                                 product_type:
//                                                                     'internet',
//                                                               )),
//                                                     );
//                                                   }),
//                                                   cardmenu('Finance',
//                                                       Icons.cloud_sync_outlined,
//                                                       () {
//                                                     Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               InputPPOBWithoutNumber(
//                                                                 title:
//                                                                     'Finance',
//                                                                 product_type:
//                                                                     'finance',
//                                                               )),
//                                                     );
//                                                   }),
//                                                   // model
//                                                   //     .items!
//                                                   //     .data.membertype != 'produsen' && model
//                                                   //     .items!
//                                                   //     .data.membertype != 'konsumen2'

//                                                   model.items!.data
//                                                                   .membertype !=
//                                                               'trader' &&
//                                                           model.items!.data
//                                                                   .membertype !=
//                                                               'umkm'
//                                                       ? cardmenu('UMKM',
//                                                           Icons.shopping_cart,
//                                                           () {
//                                                           Navigator.push(
//                                                             context,
//                                                             MaterialPageRoute(
//                                                                 builder:
//                                                                     (context) =>
//                                                                         MarketplacePage()),
//                                                           );
//                                                         })
//                                                       : Container(),
//                                                   model.items!.data
//                                                               .membertype ==
//                                                           'konsumen1'
//                                                       ? cardmenu(
//                                                           'NFT', Icons.layers,
//                                                           () {
//                                                           Navigator.push(
//                                                             context,
//                                                             MaterialPageRoute(
//                                                                 builder:
//                                                                     (context) =>
//                                                                         DashboardNFT()),
//                                                           );
//                                                         })
//                                                       : Container(),
//                                                 ]),
//                                             SizedBox(
//                                               height: 2.h,
//                                             ),
//                                             Container(
//                                               padding: EdgeInsets.only(
//                                                   left: 4.w, right: 4.w),
//                                               height: 9.h,
//                                               child: ListView(
//                                                   shrinkWrap: true,
//                                                   scrollDirection:
//                                                       Axis.horizontal,
//                                                   children: [
//                                                     cardpromo(
//                                                         'assets/images/promo.jpg'),
//                                                     cardpromo(
//                                                         'assets/images/promo2.jpg'),
//                                                     cardpromo(
//                                                         'assets/images/promo.jpg'),
//                                                   ]),
//                                             ),
//                                             model.busy
//                                                 ? Container()
//                                                 : model.items!.data
//                                                             .membertype ==
//                                                         'konsumen1'
//                                                     ? Container(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                                 left: 4.w,
//                                                                 right: 4.w,
//                                                                 top: 2.h,
//                                                                 bottom: 2.h),
//                                                         child: Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .spaceBetween,
//                                                           children: [
//                                                             Text(
//                                                               'NFT Terbaik',
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .black,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold,
//                                                                   fontSize:
//                                                                       10.sp),
//                                                             ),
//                                                             InkWell(
//                                                               onTap: () {
//                                                                 Navigator.push(
//                                                                   context,
//                                                                   MaterialPageRoute(
//                                                                       builder:
//                                                                           (context) =>
//                                                                               DashboardNFT()),
//                                                                 );
//                                                               },
//                                                               child: Text(
//                                                                 'Lihat Semua',
//                                                                 style: TextStyle(
//                                                                     decoration:
//                                                                         TextDecoration
//                                                                             .underline,
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         9.sp),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       )
//                                                     : Container(),
//                                             model.busy
//                                                 ? Container()
//                                                 : model.items!.data
//                                                             .membertype ==
//                                                         'konsumen1'
//                                                     ? Container(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                           left: 4.w,
//                                                           right: 4.w,
//                                                         ),
//                                                         height: 25.h,
//                                                         child: loading == true
//                                                             ? const Center(
//                                                                 child: Center(
//                                                                 child:
//                                                                     CircularProgressIndicator(),
//                                                               ))
//                                                             : ListView(
//                                                                 shrinkWrap:
//                                                                     true,
//                                                                 scrollDirection:
//                                                                     Axis.horizontal,
//                                                                 children: [
//                                                                     if (v
//                                                                             .dataAllNFT!
//                                                                             .data!
//                                                                             .length >
//                                                                         0)
//                                                                       ...v.dataAllNFT!
//                                                                           .data!
//                                                                           .where((e) =>
//                                                                               e.nftId !=
//                                                                               null)
//                                                                           .map(
//                                                                             (e) =>
//                                                                                 cardnftmitra(
//                                                                               ketegori: 'Ketegori',
//                                                                               nama: e.name,
//                                                                               coin: e.priceCoin,
//                                                                               images: e.imagePath,
//                                                                             ),
//                                                                           )
//                                                                     // cardnftmitra(
//                                                                     //   ketegori: 'Ketegori',
//                                                                     //   nama: 'Nama Produk',
//                                                                     //   coin: 100,
//                                                                     //   images:
//                                                                     //       'assets/images/kotak.jpg',
//                                                                     // ),
//                                                                     // cardnftmitra(
//                                                                     //   ketegori: 'Ketegori',
//                                                                     //   nama: 'Nama Produk',
//                                                                     //   coin: 100,
//                                                                     //   images:
//                                                                     //       'assets/images/kotak2.jpg',
//                                                                     // ),
//                                                                     // cardnftmitra(
//                                                                     //   ketegori: 'Ketegori',
//                                                                     //   nama: 'Nama Produk',
//                                                                     //   coin: 100,
//                                                                     //   images:
//                                                                     //       'assets/images/kotak.jpg',
//                                                                     // ),
//                                                                   ]),
//                                                       )
//                                                     : Container(),
//                                             Container(
//                                               padding: EdgeInsets.only(
//                                                   left: 4.w,
//                                                   right: 4.w,
//                                                   top: 2.h,
//                                                   bottom: 2.h),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'Mitra UMKM',
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         fontSize: 10.sp),
//                                                   ),
//                                                   InkWell(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                         context,
//                                                         MaterialPageRoute(
//                                                             builder:
//                                                                 (context) =>
//                                                                     MyProduk()),
//                                                       );
//                                                     },
//                                                     child: Text(
//                                                       'Lihat Semua',
//                                                       style: TextStyle(
//                                                           decoration:
//                                                               TextDecoration
//                                                                   .underline,
//                                                           color: Colors.black,
//                                                           fontSize: 9.sp),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             Container(
//                                               padding: EdgeInsets.only(
//                                                   left: 4.w, right: 4.w),
//                                               height: 6.h,
//                                               child: ListView(
//                                                   shrinkWrap: true,
//                                                   scrollDirection:
//                                                       Axis.horizontal,
//                                                   children: [
//                                                     cardmitraketegori(
//                                                         'Ketegori',
//                                                         Colors.indigo),
//                                                     cardmitraketegori(
//                                                         'Ketegori',
//                                                         Colors.pink),
//                                                     cardmitraketegori(
//                                                         'Ketegori',
//                                                         Colors.teal),
//                                                   ]),
//                                             ),
//                                             Container(
//                                               padding: EdgeInsets.only(
//                                                   left: 4.w,
//                                                   right: 4.w,
//                                                   top: 2.h,
//                                                   bottom: 2.h),
//                                               height: 25.h,
//                                               child: ListView(
//                                                   shrinkWrap: true,
//                                                   scrollDirection:
//                                                       Axis.horizontal,
//                                                   children: [
//                                                     cardnftmitra(
//                                                       ketegori: 'Ketegori',
//                                                       nama: 'Nama Produk',
//                                                       coin: 100,
//                                                       images:
//                                                           'assets/images/kotak.jpg',
//                                                     ),
//                                                     cardnftmitra(
//                                                       ketegori: 'Ketegori',
//                                                       nama: 'Nama Produk',
//                                                       coin: 100,
//                                                       images:
//                                                           'assets/images/kotak2.jpg',
//                                                     ),
//                                                     cardnftmitra(
//                                                       ketegori: 'Ketegori',
//                                                       nama: 'Nama Produk',
//                                                       coin: 100,
//                                                       images:
//                                                           'assets/images/kotak.jpg',
//                                                     ),
//                                                   ]),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                     ],
//                   ),
//                 ],
//               ));
//         });
//       })),
//     );
//   }

//   cardmenu(String? judul, IconData icon, VoidCallback ontap) {
//     return InkWell(
//       onTap: ontap,
//       child: Container(
//         margin: EdgeInsets.only(left: 4.w, right: 4.w),
//         color: Colors.transparent,
//         height: context.height,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               size: 7.w,
//               color: const Color(0xFF85014e),
//             ),
//             SizedBox(
//               height: 0.8.h,
//             ),
//             Text(
//               judul ?? "",
//               style: TextStyle(color: Colors.black87, fontSize: 9.sp),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
