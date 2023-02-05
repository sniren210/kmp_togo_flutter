// import 'dart:ui';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:kmp_togo_mobile/pages/auth/dashboard/dashboard.dart';
// import 'package:kmp_togo_mobile/pages/nft/dashboard_nft.dart';
// import 'package:kmp_togo_mobile/pages/nft/dashboardnft.dart';

// class HomeNFT extends StatefulWidget {
//   @override
//   State<HomeNFT> createState() => _HomeNFTState();
// }

// class _HomeNFTState extends State<HomeNFT> with SingleTickerProviderStateMixin {
//   int? _deviceState;
//   int _selectIndex = 0;

//   List<IconData> iconList = [
//     //list of icons that required by animated navigation bar.
//     Icons.home,
//     Icons.access_time,
//     Icons.date_range,
//     Icons.settings
//   ];

//   List<String> nameLabel = [
//     //list of icons that required by animated navigation bar.
//     'Beranda',
//     'Saldo',
//     'Dashboard',
//     'Profile'
//   ];

//   final listMenu = [Dashboard_NFT(), Dashboard(), Dashboard(), Dashboard()];

//   void _onTap(int index) {
//     setState(() {
//       _selectIndex = index;
//       debugPrint(_selectIndex.toString());
//     });
//   }

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {});
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: listMenu[_selectIndex],
//       floatingActionButton: FloatingActionButton(
//           backgroundColor: Color(0xFF85014e),
//           child: Icon(
//             Icons.qr_code_scanner,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pushNamed(context, '/wifi');
//           }),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: AnimatedBottomNavigationBar.builder(
//           itemCount: iconList.length,
//           tabBuilder: ((index, isActive) {
//             final color = isActive ? Color(0xFF85014e) : Colors.grey;
//             return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     iconList[index],
//                     size: 24,
//                     color: color,
//                   ),
//                   const SizedBox(height: 4),
//                   Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       child: Text(
//                         nameLabel[index],
//                         maxLines: 1,
//                         style: TextStyle(color: color),
//                       )),
//                   const SizedBox(height: 4),
//                 ]);
//           }),
//           activeIndex: _selectIndex,
//           gapLocation: GapLocation.center,
//           notchSmoothness: NotchSmoothness.defaultEdge,
//           // inactiveColor: Colors.white,
//           onTap: _onTap,
//           backgroundColor: Colors.white),
//     );
//   }
// }
