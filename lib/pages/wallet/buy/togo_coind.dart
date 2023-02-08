import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/cardtopup.dart';
import 'package:kmp_togo_mobile/pages/wallet/buy/buytogoPage.dart';
import 'package:kmp_togo_mobile/pages/wallet/topup/topup_coin_pages.dart';
import 'package:kmp_togo_mobile/pages/wallet/topup/topuppages.dart';
import 'package:kmp_togo_mobile/pages/wallet/withdraw/withdraw_coin_pages.dart';
import 'package:kmp_togo_mobile/pages/wallet/withdraw/withdrawpages.dart';
import 'package:kmp_togo_mobile/providers/account/provider_account.dart';
import 'package:kmp_togo_mobile/providers/wallet/withdraw/providerwallet.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ToGoCoin extends StatefulWidget {
  const ToGoCoin({super.key});

  @override
  State<ToGoCoin> createState() => _ToGoCoinState();
}

class _ToGoCoinState extends State<ToGoCoin> with NumberFormatMachine {
  int selectedIndex = 0;
  late ScrollController _scrollController;

  @override
  void initState() {
    getMyHistorySaldo();

    _scrollController = ScrollController()..addListener(() {});

    super.initState();
  }

  bool? loading = true;
  getMyHistorySaldo() async {
    final _getkategoriProvider =
        Provider.of<ProviderWithDraw>(context, listen: false);
    await _getkategoriProvider.getHistorySaldoWallet(context);
    setState(() {
      loading = _getkategoriProvider.loadinghistory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProviderAccountInfo>(
      model: ProviderAccountInfo(Repository()),
      onModelReady: (model) => model.fetchAccountInfo(),
      child: Container(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Consumer<ProviderWithDraw>(builder: (context, v, child) {
            return CustomScrollView(
              controller: _scrollController,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const AlwaysScrollableScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              slivers: [
                SliverAppBar(
                  // toolbarHeight: 100,
                  title: Text(
                    'Coin',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: const Color(0xFF85014e),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TopUpCoinPage()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    color: Colors.orangeAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 12.0),
                                      child: Text(
                                        'Top Up',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9.sp),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WithDrawCoin()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    color: Colors.orangeAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 12.0),
                                      child: Text(
                                        'Withdraw',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9.sp),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BeliToGo()),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    color: Colors.orangeAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 12.0),
                                      child: Text(
                                        'PPM',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9.sp),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 8,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        // for (int i = 0;
                        //     i < (v.dataHistorySaldo?.data?.length ?? 0);
                        //     i++)
                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),
                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),
                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),
                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),

                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),

                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),

                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),
                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),
                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),
                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),
                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),
                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),
                        CardTopup(
                          kategori: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? 'Top Up'
                              : 'Withdraw',
                          icon: Icons.monetization_on,
                          ref: v.dataHistorySaldo?.data?[0].description,
                          harga: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '${v.dataHistorySaldo?.data?[0].trxOut}',
                          tanggal: '${v.dataHistorySaldo?.data?[0].createdAt}',
                          waktu: '',
                          metode: 'Artha Graha Internasional',
                          pembayaran: v.dataHistorySaldo?.data?[0].trxOut == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxIn}'
                              : '-',
                          total: v.dataHistorySaldo?.data?[0].trxIn == 0
                              ? '${v.dataHistorySaldo?.data?[0].trxOut}'
                              : '-',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  card1(String judul, int _selectedIndex) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.h, 1.h, 1.h, 1.h),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = _selectedIndex;
          });
        },
        child: Container(
          padding:
              EdgeInsets.only(right: 1.2.w, left: 1.2.w, top: 1.h, bottom: 1.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: selectedIndex == _selectedIndex
                  ? const Color(0xFF85014e)
                  : Colors.grey.shade300),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                judul,
                style: TextStyle(
                    color: selectedIndex == _selectedIndex
                        ? Colors.white
                        : Colors.black,
                    fontSize: 6.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
