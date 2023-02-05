// import 'package:flutter/material.dart';
// import 'package:kmp_togo_mobile/pages/common/cardmitraketgori.dart';
// import 'package:kmp_togo_mobile/pages/common/cardnft.dart';
// import 'package:kmp_togo_mobile/pages/common/cardnftmitra.dart';
// import 'package:kmp_togo_mobile/pages/common/cardpromo.dart';
// import 'package:kmp_togo_mobile/pages/nft/dashboard_nft.dart';
// import 'package:kmp_togo_mobile/pages/nft/homenft.dart';
// import 'package:kmp_togo_mobile/pages/nft/nftpagesall.dart';
// import 'package:kmp_togo_mobile/utils/layarmax.dart';
// import 'package:sizer/sizer.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Dashboard_NFT extends StatefulWidget {
//   Dashboard_NFT({Key? key}) : super(key: key);

//   @override
//   State<Dashboard_NFT> createState() => _Dashboard_NFTState();
// }

// class _Dashboard_NFTState extends State<Dashboard_NFT> {
//   final controller = PageController(
//     initialPage: 0,
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             height: context.height,
//             width: context.width,
//             child: Stack(
//               children: [
//                 Column(
//                   children: [
//                     Flexible(
//                       flex: 4,
//                       child: PageView(
//                         padEnds: false,
//                         pageSnapping: true,
//                         controller: controller,
//                         scrollDirection: Axis.horizontal,
//                         children: <Widget>[
//                           Container(
//                             color: Color(0xFF85014e),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.only(
//                                       left: 4.w, right: 4.w, top: 5.h),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Expanded(
//                                         flex: 7,
//                                         child: Container(
//                                             padding: EdgeInsets.only(
//                                               top: 1.5.w,
//                                               bottom: 1.5.w,
//                                               left: 2.w,
//                                             ),
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(5)),
//                                             child: Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.search,
//                                                   size: 5.w,
//                                                   color: Colors.black87,
//                                                 ),
//                                                 SizedBox(width: 1.w),
//                                                 Text('Cari Aplikasi Disini'),
//                                               ],
//                                             )),
//                                       ),
//                                       Expanded(
//                                         flex: 3,
//                                         child: Align(
//                                           alignment: Alignment.centerRight,
//                                           child: Icon(
//                                             Icons.notifications,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.only(
//                                       left: 4.w,
//                                       right: 4.w,
//                                       top: 1.h,
//                                       bottom: 1.h),
//                                   margin: EdgeInsets.only(
//                                       left: 4.w, right: 4.w, top: 3.h),
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(5)),
//                                   child: IntrinsicHeight(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Expanded(
//                                           flex: 4,
//                                           child: Container(
//                                             margin: EdgeInsets.only(
//                                                 top: 2.h, bottom: 2.h),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Container(
//                                                           child: Icon(
//                                                             Icons.wallet,
//                                                             size: 9.w,
//                                                             color: Color(
//                                                                 0xFF85014e),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: 2.w,
//                                                         ),
//                                                         Column(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Container(
//                                                               child: Text(
//                                                                 'Saldo Poin',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontSize:
//                                                                         9.sp),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 1.w,
//                                                             ),
//                                                             Container(
//                                                               child: Text(
//                                                                 'Rp. 1.800.000',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     fontSize:
//                                                                         12.sp),
//                                                               ),
//                                                             )
//                                                           ],
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 1,
//                                           child: VerticalDivider(
//                                             color: Colors.black,
//                                             thickness: 1,
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 4,
//                                           child: Container(
//                                             margin: EdgeInsets.only(
//                                                 top: 2.h, bottom: 2.h),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Container(
//                                                           width: 10.w,
//                                                           height: 4.h,
//                                                           decoration: BoxDecoration(
//                                                               image: DecorationImage(
//                                                                   fit: BoxFit
//                                                                       .contain,
//                                                                   image: AssetImage(
//                                                                       'assets/images/logon.jpg'))),
//                                                           // child: Icon(
//                                                           //   Icons.monetization_on,
//                                                           //   size: 9.w,
//                                                           //   color:
//                                                           //       Color(0xFF85014e),
//                                                           // ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: 2.w,
//                                                         ),
//                                                         Column(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Container(
//                                                               child: Text(
//                                                                 'Saldo ToGomu',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontSize:
//                                                                         9.sp),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 1.w,
//                                                             ),
//                                                             Container(
//                                                               child: Text(
//                                                                 'Rp. 1.800',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     fontSize:
//                                                                         12.sp),
//                                                               ),
//                                                             )
//                                                           ],
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),
//                                 SmoothPageIndicator(
//                                     controller: controller, // PageController
//                                     count: 3,
//                                     effect: WormEffect(
//                                         dotHeight: 8,
//                                         dotWidth: 8,
//                                         dotColor: Colors.grey.shade500,
//                                         activeDotColor: Colors.grey
//                                             .shade700), // your preferred effect
//                                     onDotClicked: (index) {
//                                       controller.animateToPage(index,
//                                           duration:
//                                               const Duration(microseconds: 500),
//                                           curve: Curves.easeInOut);
//                                     }),
//                                 SizedBox(
//                                   height: 3.h,
//                                 ),
//                                 Container(
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Container(
//                                             child: Icon(Icons.wallet,
//                                                 size: 8.w, color: Colors.white),
//                                           ),
//                                           Container(
//                                             child: Text(
//                                               'Withdraw',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 8.sp),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Column(
//                                         children: [
//                                           Container(
//                                             child: Icon(Icons.wallet,
//                                                 size: 8.w, color: Colors.white),
//                                           ),
//                                           Container(
//                                             child: Text(
//                                               'Topup',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 8.sp),
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             color: Colors.indigo,
//                             child: Column(
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.only(
//                                       left: 4.w, right: 4.w, top: 5.h),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Expanded(
//                                         flex: 7,
//                                         child: Container(
//                                             padding: EdgeInsets.only(
//                                               top: 1.5.w,
//                                               bottom: 1.5.w,
//                                               left: 2.w,
//                                             ),
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(5)),
//                                             child: Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.search,
//                                                   size: 5.w,
//                                                   color: Colors.black87,
//                                                 ),
//                                                 SizedBox(width: 1.w),
//                                                 Text('Cari Aplikasi Disini'),
//                                               ],
//                                             )),
//                                       ),
//                                       Expanded(
//                                         flex: 3,
//                                         child: Align(
//                                           alignment: Alignment.centerRight,
//                                           child: Icon(
//                                             Icons.notifications,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.only(
//                                       left: 4.w,
//                                       right: 4.w,
//                                       top: 1.h,
//                                       bottom: 1.h),
//                                   margin: EdgeInsets.only(
//                                       left: 4.w, right: 4.w, top: 3.h),
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(5)),
//                                   child: IntrinsicHeight(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Expanded(
//                                           flex: 4,
//                                           child: Container(
//                                             margin: EdgeInsets.only(
//                                                 top: 2.h, bottom: 2.h),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Container(
//                                                           child: Icon(
//                                                             Icons.wallet,
//                                                             size: 9.w,
//                                                             color: Color(
//                                                                 0xFF85014e),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: 2.w,
//                                                         ),
//                                                         Column(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Container(
//                                                               child: Text(
//                                                                 'Saldo Poin',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontSize:
//                                                                         9.sp),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 1.w,
//                                                             ),
//                                                             Container(
//                                                               child: Text(
//                                                                 'Rp. 1.800.000',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     fontSize:
//                                                                         12.sp),
//                                                               ),
//                                                             )
//                                                           ],
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 1,
//                                           child: VerticalDivider(
//                                             color: Colors.black,
//                                             thickness: 1,
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 4,
//                                           child: Container(
//                                             margin: EdgeInsets.only(
//                                                 top: 2.h, bottom: 2.h),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Container(
//                                                           width: 10.w,
//                                                           height: 4.h,
//                                                           decoration: BoxDecoration(
//                                                               image: DecorationImage(
//                                                                   fit: BoxFit
//                                                                       .contain,
//                                                                   image: AssetImage(
//                                                                       'assets/images/logon.jpg'))),
//                                                           // child: Icon(
//                                                           //   Icons.monetization_on,
//                                                           //   size: 9.w,
//                                                           //   color:
//                                                           //       Color(0xFF85014e),
//                                                           // ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: 2.w,
//                                                         ),
//                                                         Column(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Container(
//                                                               child: Text(
//                                                                 'Saldo ToGomu',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontSize:
//                                                                         9.sp),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 1.w,
//                                                             ),
//                                                             Container(
//                                                               child: Text(
//                                                                 'Rp. 1.800',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     fontSize:
//                                                                         12.sp),
//                                                               ),
//                                                             )
//                                                           ],
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),
//                                 SmoothPageIndicator(
//                                     controller: controller, // PageController
//                                     count: 3,
//                                     effect: WormEffect(
//                                         dotHeight: 8,
//                                         dotWidth: 8,
//                                         dotColor: Colors.grey.shade500,
//                                         activeDotColor: Colors.grey
//                                             .shade700), // your preferred effect
//                                     onDotClicked: (index) {
//                                       controller.animateToPage(index,
//                                           duration:
//                                               const Duration(microseconds: 500),
//                                           curve: Curves.easeInOut);
//                                     }),
//                                 SizedBox(
//                                   height: 3.h,
//                                 ),
//                                 Container(
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Container(
//                                             child: Icon(Icons.wallet,
//                                                 size: 8.w, color: Colors.white),
//                                           ),
//                                           Container(
//                                             child: Text(
//                                               'Withdraw',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 8.sp),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Column(
//                                         children: [
//                                           Container(
//                                             child: Icon(Icons.wallet,
//                                                 size: 8.w, color: Colors.white),
//                                           ),
//                                           Container(
//                                             child: Text(
//                                               'Topup',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 8.sp),
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Container(
//                             color: Colors.teal,
//                             child: Column(
//                               children: [
//                                 Container(
//                                   margin: EdgeInsets.only(
//                                       left: 4.w, right: 4.w, top: 5.h),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Expanded(
//                                         flex: 7,
//                                         child: Container(
//                                             padding: EdgeInsets.only(
//                                               top: 1.5.w,
//                                               bottom: 1.5.w,
//                                               left: 2.w,
//                                             ),
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius:
//                                                     BorderRadius.circular(5)),
//                                             child: Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons.search,
//                                                   size: 5.w,
//                                                   color: Colors.black87,
//                                                 ),
//                                                 SizedBox(width: 1.w),
//                                                 Text('Cari Aplikasi Disini'),
//                                               ],
//                                             )),
//                                       ),
//                                       Expanded(
//                                         flex: 3,
//                                         child: Align(
//                                           alignment: Alignment.centerRight,
//                                           child: Icon(
//                                             Icons.notifications,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.only(
//                                       left: 4.w,
//                                       right: 4.w,
//                                       top: 1.h,
//                                       bottom: 1.h),
//                                   margin: EdgeInsets.only(
//                                       left: 4.w, right: 4.w, top: 3.h),
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(5)),
//                                   child: IntrinsicHeight(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Expanded(
//                                           flex: 4,
//                                           child: Container(
//                                             margin: EdgeInsets.only(
//                                                 top: 2.h, bottom: 2.h),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Container(
//                                                           child: Icon(
//                                                             Icons.wallet,
//                                                             size: 9.w,
//                                                             color: Color(
//                                                                 0xFF85014e),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: 2.w,
//                                                         ),
//                                                         Column(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Container(
//                                                               child: Text(
//                                                                 'Saldo Poin',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontSize:
//                                                                         9.sp),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 1.w,
//                                                             ),
//                                                             Container(
//                                                               child: Text(
//                                                                 'Rp. 1.800.000',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     fontSize:
//                                                                         12.sp),
//                                                               ),
//                                                             )
//                                                           ],
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 1,
//                                           child: VerticalDivider(
//                                             color: Colors.black,
//                                             thickness: 1,
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 4,
//                                           child: Container(
//                                             margin: EdgeInsets.only(
//                                                 top: 2.h, bottom: 2.h),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: [
//                                                         Container(
//                                                           width: 10.w,
//                                                           height: 4.h,
//                                                           decoration: BoxDecoration(
//                                                               image: DecorationImage(
//                                                                   fit: BoxFit
//                                                                       .contain,
//                                                                   image: AssetImage(
//                                                                       'assets/images/logon.jpg'))),
//                                                           // child: Icon(
//                                                           //   Icons.monetization_on,
//                                                           //   size: 9.w,
//                                                           //   color:
//                                                           //       Color(0xFF85014e),
//                                                           // ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: 2.w,
//                                                         ),
//                                                         Column(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Container(
//                                                               child: Text(
//                                                                 'Saldo ToGomu',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontSize:
//                                                                         9.sp),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 1.w,
//                                                             ),
//                                                             Container(
//                                                               child: Text(
//                                                                 'Rp. 1.800',
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     fontSize:
//                                                                         12.sp),
//                                                               ),
//                                                             )
//                                                           ],
//                                                         )
//                                                       ],
//                                                     )
//                                                   ],
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),
//                                 SmoothPageIndicator(
//                                     controller: controller, // PageController
//                                     count: 3,
//                                     effect: WormEffect(
//                                         dotHeight: 8,
//                                         dotWidth: 8,
//                                         dotColor: Colors.grey.shade500,
//                                         activeDotColor: Colors.grey
//                                             .shade700), // your preferred effect
//                                     onDotClicked: (index) {
//                                       controller.animateToPage(index,
//                                           duration:
//                                               const Duration(microseconds: 500),
//                                           curve: Curves.easeInOut);
//                                     }),
//                                 SizedBox(
//                                   height: 3.h,
//                                 ),
//                                 Container(
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Column(
//                                         children: [
//                                           Container(
//                                             child: Icon(Icons.wallet,
//                                                 size: 8.w, color: Colors.white),
//                                           ),
//                                           Container(
//                                             child: Text(
//                                               'Withdraw',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 8.sp),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Column(
//                                         children: [
//                                           Container(
//                                             child: Icon(Icons.wallet,
//                                                 size: 8.w, color: Colors.white),
//                                           ),
//                                           Container(
//                                             child: Text(
//                                               'Topup',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 8.sp),
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Flexible(
//                       flex: 6,
//                       child: Container(
//                         color: Colors.white,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Expanded(
//                               flex: 7,
//                               child: SingleChildScrollView(
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//                                       height: 2.h,
//                                     ),
//                                     GridView(
//                                         padding: EdgeInsets.zero,
//                                         shrinkWrap: true,
//                                         physics: NeverScrollableScrollPhysics(),
//                                         gridDelegate:
//                                             SliverGridDelegateWithFixedCrossAxisCount(
//                                                 crossAxisCount: 5,
//                                                 mainAxisSpacing: 5),
//                                         children: [
//                                           cardmenu('Pulsa', Icons.smartphone,
//                                               Container()),
//                                           cardmenu('Data', Icons.laptop_mac,
//                                               Container()),
//                                           cardmenu(
//                                               'Poin',
//                                               Icons.lightbulb_outline,
//                                               Container()),
//                                           cardmenu('PLN', Icons.electric_bolt,
//                                               Container()),
//                                           cardmenu(
//                                               'PDAM',
//                                               Icons.water,
//                                               Container()),
//                                           cardmenu(
//                                               'E-Money',
//                                               Icons.credit_card_rounded,
//                                               Container()),
//                                           cardmenu('Internet', Icons.wifi,
//                                               Container()),
//                                           cardmenu(
//                                               'Finance',
//                                               Icons.cloud_sync_outlined,
//                                               Container()),
//                                           cardmenu('NFT', Icons.layers,
//                                               DashboardNFT()),
//                                           cardmenu('UMKM', Icons.shopping_cart,
//                                               Container()),
//                                         ]),
//                                     SizedBox(
//                                       height: 2.h,
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(
//                                           left: 4.w, right: 4.w),
//                                       height: 9.h,
//                                       child: ListView(
//                                           shrinkWrap: true,
//                                           scrollDirection: Axis.horizontal,
//                                           children: [
//                                             cardpromo(
//                                                 'assets/images/promo.jpg'),
//                                             cardpromo(
//                                                 'assets/images/promo2.jpg'),
//                                             cardpromo(
//                                                 'assets/images/promo.jpg'),
//                                           ]),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(
//                                           left: 4.w,
//                                           right: 4.w,
//                                           top: 2.h,
//                                           bottom: 2.h),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             'NFT Terbaik',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 10.sp),
//                                           ),
//                                           InkWell(
//                                             onTap: () {
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         NftPagesAll()),
//                                               );
//                                             },
//                                             child: Text(
//                                               'Lihat Semua',
//                                               style: TextStyle(
//                                                   decoration:
//                                                       TextDecoration.underline,
//                                                   color: Colors.black,
//                                                   fontSize: 9.sp),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(
//                                         left: 4.w,
//                                         right: 4.w,
//                                       ),
//                                       height: 25.h,
//                                       child: ListView(
//                                           shrinkWrap: true,
//                                           scrollDirection: Axis.horizontal,
//                                           children: [
//                                             Cardnft(
//                                               jmlpembeli: '1',
//                                               darijumlah: '1',
//                                               nama: 'Sapi Betina',
//                                               tahun: 'Tahun 2022',
//                                               coin: 100,
//                                               images: 'assets/images/kotak.jpg',
//                                             ),
//                                             Cardnft(
//                                               jmlpembeli: '1',
//                                               darijumlah: '1',
//                                               nama: 'Nama Produk',
//                                               tahun: 'Tahun 2022',
//                                               coin: 100,
//                                               images:
//                                                   'assets/images/kotak2.jpg',
//                                             ),
//                                             Cardnft(
//                                               jmlpembeli: '1',
//                                               darijumlah: '1',
//                                               nama: 'Nama Produk',
//                                               tahun: 'Tahun 2022',
//                                               coin: 100,
//                                               images: 'assets/images/kotak.jpg',
//                                             ),
//                                           ]),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(
//                                           left: 4.w,
//                                           right: 4.w,
//                                           top: 2.h,
//                                           bottom: 2.h),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(
//                                             'Mitra UMKM',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 10.sp),
//                                           ),
//                                           Text(
//                                             'Lihat Semua',
//                                             style: TextStyle(
//                                                 decoration:
//                                                     TextDecoration.underline,
//                                                 color: Colors.black,
//                                                 fontSize: 9.sp),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(
//                                           left: 4.w, right: 4.w),
//                                       height: 6.h,
//                                       child: ListView(
//                                           shrinkWrap: true,
//                                           scrollDirection: Axis.horizontal,
//                                           children: [
//                                             cardmitraketegori(
//                                                 'Ketegori', Colors.indigo),
//                                             cardmitraketegori(
//                                                 'Ketegori', Colors.pink),
//                                             cardmitraketegori(
//                                                 'Ketegori', Colors.teal),
//                                           ]),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(
//                                           left: 4.w,
//                                           right: 4.w,
//                                           top: 2.h,
//                                           bottom: 2.h),
//                                       height: 25.h,
//                                       child: ListView(
//                                           shrinkWrap: true,
//                                           scrollDirection: Axis.horizontal,
//                                           children: [
//                                             cardnftmitra(
//                                               ketegori: 'Ketegori',
//                                               nama: 'Nama Produk',
//                                               coin: 100,
//                                               images: 'assets/images/kotak.jpg',
//                                             ),
//                                             cardnftmitra(
//                                               ketegori: 'Ketegori',
//                                               nama: 'Nama Produk',
//                                               coin: 100,
//                                               images:
//                                                   'assets/images/kotak2.jpg',
//                                             ),
//                                             cardnftmitra(
//                                               ketegori: 'Ketegori',
//                                               nama: 'Nama Produk',
//                                               coin: 100,
//                                               images: 'assets/images/kotak.jpg',
//                                             ),
//                                           ]),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             )));
//   }

//   cardmenu(String? judul, IconData icon, Widget page) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) {
//             return page;
//           }),
//         );
//       },
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
//               color: Color(0xFF85014e),
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
