import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/cardtopup.dart';
import 'package:kmp_togo_mobile/pages/common/customAppBar.dart';
import 'package:kmp_togo_mobile/pages/wallet/buy/buy_poin_page.dart';
import 'package:kmp_togo_mobile/pages/wallet/buy/togo_coind.dart';
import 'package:kmp_togo_mobile/pages/wallet/topup/topupPayment.dart';
import 'package:kmp_togo_mobile/pages/wallet/topup/topuppages.dart';
import 'package:kmp_togo_mobile/pages/wallet/withdraw/withdrawpages.dart';
import 'package:kmp_togo_mobile/providers/account/provider_account.dart';
import 'package:kmp_togo_mobile/providers/wallet/withdraw/providerwallet.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DashboardWallet extends StatefulWidget {
  bool isHome;

  DashboardWallet({super.key, required this.isHome});

  @override
  State<DashboardWallet> createState() => _DashboardWalletState();
}

// void _modalBottomSheetMenu() {

// }

class _DashboardWalletState extends State<DashboardWallet>
    with NumberFormatMachine {
  int selectedIndex = 0;
  late ScrollController _scrollController;

  Color colorAppBar = Colors.transparent;
  double expandHeight = 340;

  @override
  void initState() {
    getMyHistorySaldo();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          colorAppBar = _isSliverAppBarExpanded
              ? Theme.of(context).canvasColor
              : Colors.transparent;
          expandHeight = _isSliverAppBarExpanded ? 90 : 340;
        });
      });

    super.initState();
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  bool? loading = true;
  getMyHistorySaldo() async {
    final _getTokenProvider =
        Provider.of<ProviderWithDraw>(context, listen: false);
    await _getTokenProvider.getBalanceWallet();

    loading = _getTokenProvider.loadinghistory;
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
                  backgroundColor: Theme.of(context).canvasColor,
                  expandedHeight: 340,
                  collapsedHeight: 60,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: EdgeInsets.only(
                          left: 4.w, right: 4.w, top: 1.h, bottom: 1.h),
                      // child: SizedBox.shrink(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!_isSliverAppBarExpanded) ...[
                            SizedBox(
                              height: 230,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 50,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                                border: Border.fromBorderSide(
                                                    BorderSide(
                                                        color: Colors.white)),
                                                image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: AssetImage(
                                                        'assets/images/bg1024.png')))),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        model.busy
                                            ? Text(
                                                '....',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 9.sp),
                                              )
                                            : Text(
                                                'Poin : ${getNumberFormatSeparator(double.parse(v.balanceWallet?.data.point ?? '0'))}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                    fontSize: 17.sp),
                                              ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 3,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              BeliPoinToGo(
                                                                isBuy: true,
                                                              )),
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Card(
                                                        color:
                                                            Colors.orangeAccent,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 8.0,
                                                                  horizontal:
                                                                      12.0),
                                                          child: Text(
                                                            'Beli Poin',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 9.sp),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              BeliPoinToGo(
                                                                isBuy: false,
                                                              )),
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Card(
                                                        color:
                                                            Colors.orangeAccent,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 8.0,
                                                                  horizontal:
                                                                      12.0),
                                                          child: Text(
                                                            'Jual Poin',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 9.sp),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ToGoCoin(),
                                                      ),
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Card(
                                                        color:
                                                            Colors.orangeAccent,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 8.0,
                                                                  horizontal:
                                                                      12.0),
                                                          child: Text(
                                                            'Togo Coin',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 9.sp),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                    stretchModes: const [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                    ],
                    centerTitle: true,
                    titlePadding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8,
                    ),
                    title: Container(
                      color: colorAppBar,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_isSliverAppBarExpanded) ...[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 1.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          border: Border.fromBorderSide(
                                              BorderSide(color: Colors.black)),
                                          image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: AssetImage(
                                                  'assets/images/bg1024.png')))),
                                  model.busy
                                      ? Text(
                                          '....',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.sp),
                                        )
                                      : Text(
                                          'Poin : ${getNumberFormatSeparator(double.parse(v.balanceWallet?.data.point ?? '0'))}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                              fontSize: 17.sp),
                                        ),
                                ],
                              ),
                            ),
                          ],
                          Container(
                            // color: Theme.of(context).canvasColor,
                            margin: EdgeInsets.only(left: 2.w, top: 0.h),
                            child: Text(
                              'Riwayat',
                              style: TextStyle(
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            // color: Theme.of(context).canvasColor,
                            padding: EdgeInsets.only(left: 2.w, right: 2.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: card1('Semua', 0),
                                ),
                                Expanded(
                                  child: card1('Beli', 1),
                                ),
                                Expanded(
                                  child: card1('Jual', 2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
                        // CardTopup(
                        //   harga: '50.000',
                        //   icon: Icons.people,
                        //   kategori: "top up",
                        //   metode: 'transfer',
                        //   pembayaran: 'lunas',
                        //   tanggal: '12',
                        //   total: '50.000',
                        //   waktu: 'siang hari',
                        // ),
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
          width: 60,
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
