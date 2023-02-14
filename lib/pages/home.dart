import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/pages/auth/dashboard/dashboardnnew.dart';
import 'package:kmp_togo_mobile/pages/profile/profilePage.dart';
import 'package:kmp_togo_mobile/pages/scan/scanPembayaran.dart';
import 'package:provider/provider.dart';
import 'package:kmp_togo_mobile/pages/wallet/dashboard_wallet.dart';
import 'package:kmp_togo_mobile/providers/cart/cart_provider.dart';

import 'history/jenis_transaksi.dart';

class Home extends StatefulWidget {
  int? selectedIndex;

  Home({super.key, this.selectedIndex});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String _scanBarcode = 'Unknown';

  int _selectIndex = 0;

  List<IconData> iconList = [
    //list of icons that required by animated navigation bar.
    Icons.home,
    Icons.access_time,
    Icons.date_range,
    Icons.person
  ];

  List<String> nameLabel = [
    //list of icons that required by animated navigation bar.
    'Beranda',
    'Saldo',
    'Transaksi',
    'Profile'
  ];

  final listMenu = [
    DashboardNew(isHomeLoading: true),
    DashboardWallet(isHome: true),
    const jenisTransaksi(),
    const Profile()
  ];

  void _onTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  bool isHomeLoading = true;

  startHome() {
    var duration = const Duration(milliseconds: 500);
    return Timer(duration, handleDashboard);
  }

  void handleDashboard() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      context.read<CartProvider>().getData(
          sharedPreferencesManager.getInt(SharedPreferencesManager.userId));
    });

    setState(() {
      isHomeLoading = false;
    });
  }

  @override
  void initState() {
    if (widget.selectedIndex != null) {
      _selectIndex = widget.selectedIndex!;
    }

    startHome();

    WidgetsBinding.instance.addPostFrameCallback((_) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listMenu[_selectIndex],
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF85014e),
          child: const Icon(
            Icons.qr_code_scanner,
            color: Colors.white,
          ),
          onPressed: () async {
            try {
              scanBarcodeNormal();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScanPagePembayaran()),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString().toLowerCase())));
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: ((index, isActive) {
            final color = isActive ? const Color(0xFF85014e) : Colors.grey;
            return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconList[index],
                    size: 24,
                    color: color,
                  ),
                  const SizedBox(height: 4),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        nameLabel[index],
                        maxLines: 1,
                        style: TextStyle(color: color),
                      )),
                  const SizedBox(height: 4),
                ]);
          }),
          activeIndex: _selectIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          // inactiveColor: Colors.white,
          onTap: _onTap,
          backgroundColor: Colors.white),
    );
  }
}
