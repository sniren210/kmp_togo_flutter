import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/cardtopup.dart';
import 'package:kmp_togo_mobile/pages/common/customAppBar.dart';
import 'package:kmp_togo_mobile/pages/wallet/buy/buytogoPage.dart';
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

  @override
  void initState() {
    getMyHistorySaldo();
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
      builder: (context, model, child) => Scaffold(
        body: Consumer<ProviderWithDraw>(builder: (context, v, child) {
          return SafeArea(
            child: SizedBox(
              height: context.height,
              width: context.width,
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 4.w, right: 4.w, top: 1.h, bottom: 1.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.isHome
                                ? Container()
                                : Expanded(
                                    flex: 3,
                                    child: CustomAppBar(
                                      iconDataApp: Icon(
                                        Icons.monetization_on,
                                        color: Colors.black,
                                        size: 8.w,
                                      ),
                                      title: 'IDR WALLET',
                                      popContext: 1,
                                      height: 200,
                                      padding: 15,
                                    ),
                                  ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Expanded(
                                flex: 8,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                                                  'Rp. ${getNumberFormatSeparator(0)}',
                                                  // 'Rp. ${getNumberFormatSeparator(model.items!.data.tokenWallet.token)}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                                TopUpPage()),
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
                                                          color: Colors
                                                              .orangeAccent,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        8.0,
                                                                    horizontal:
                                                                        12.0),
                                                            child: Text(
                                                              'Top Up',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      9.sp),
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
                                                            builder:
                                                                (context) =>
                                                                    WithDraw()),
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
                                                          color: Colors
                                                              .orangeAccent,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        8.0,
                                                                    horizontal:
                                                                        12.0),
                                                            child: Text(
                                                              'Withdraw',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      9.sp),
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
                                                            builder:
                                                                (context) =>
                                                                    BeliToGo()),
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
                                                          color: Colors
                                                              .orangeAccent,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        8.0,
                                                                    horizontal:
                                                                        12.0),
                                                            child: Text(
                                                              'Buy ToGo',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      9.sp),
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
                                ))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 4.w, top: 0.h),
                            child: Text(
                              'Riwayat',
                              style: TextStyle(
                                  fontSize: 10.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(left: 4.w, right: 4.w),
                              child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    card1('Semua', 0),
                                    card1('Deposit', 1),
                                    card1('Withdraw', 2),
                                    card1('Jual', 3),
                                  ]),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              padding: EdgeInsets.only(left: 4.w, right: 4.w),
                              child: loading == true
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount:
                                          v.dataHistorySaldo?.data?.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        if (selectedIndex == 0) {
                                          return CardTopup(
                                            kategori: v.dataHistorySaldo
                                                        ?.data?[index].trxOut ==
                                                    0
                                                ? 'Top Up'
                                                : 'Withdraw',
                                            icon: Icons.monetization_on,
                                            ref: v.dataHistorySaldo
                                                ?.data?[index].description,
                                            harga: v.dataHistorySaldo
                                                        ?.data?[index].trxOut ==
                                                    0
                                                ? '${v.dataHistorySaldo?.data?[index].trxIn}'
                                                : '${v.dataHistorySaldo?.data?[index].trxOut}',
                                            tanggal:
                                                '${v.dataHistorySaldo?.data?[index].createdAt}',
                                            waktu: '',
                                            metode: 'Artha Graha Internasional',
                                            pembayaran: v.dataHistorySaldo
                                                        ?.data?[index].trxOut ==
                                                    0
                                                ? '${v.dataHistorySaldo?.data?[index].trxIn}'
                                                : '-',
                                            total: v.dataHistorySaldo
                                                        ?.data?[index].trxIn ==
                                                    0
                                                ? '${v.dataHistorySaldo?.data?[index].trxOut}'
                                                : '-',
                                          );
                                        }

                                        if (selectedIndex == 1 &&
                                            v.dataHistorySaldo?.data?[index]
                                                    .trxOut ==
                                                0) {
                                          return CardTopup(
                                            kategori: v.dataHistorySaldo
                                                        ?.data?[index].trxOut ==
                                                    0
                                                ? 'Top Up'
                                                : 'Withdraw',
                                            icon: Icons.monetization_on,
                                            ref: v.dataHistorySaldo
                                                ?.data?[index].description,
                                            harga: v.dataHistorySaldo
                                                        ?.data?[index].trxOut ==
                                                    0
                                                ? '${v.dataHistorySaldo?.data?[index].trxIn}'
                                                : '${v.dataHistorySaldo?.data?[index].trxOut}',
                                            tanggal:
                                                '${v.dataHistorySaldo?.data?[index].createdAt}',
                                            waktu: '',
                                            metode: 'Artha Graha Internasional',
                                            pembayaran: v.dataHistorySaldo
                                                        ?.data?[index].trxOut ==
                                                    0
                                                ? '${v.dataHistorySaldo?.data?[index].trxIn}'
                                                : '-',
                                            total: v.dataHistorySaldo
                                                        ?.data?[index].trxIn ==
                                                    0
                                                ? '${v.dataHistorySaldo?.data?[index].trxOut}'
                                                : '-',
                                          );
                                        }

                                        if (selectedIndex == 2 &&
                                            v.dataHistorySaldo?.data?[index]
                                                    .trxOut !=
                                                0) {
                                          return CardTopup(
                                            kategori: v.dataHistorySaldo
                                                        ?.data?[index].trxOut ==
                                                    0
                                                ? 'Top Up'
                                                : 'Withdraw',
                                            icon: Icons.monetization_on,
                                            ref: v.dataHistorySaldo
                                                ?.data?[index].description,
                                            harga: v.dataHistorySaldo
                                                        ?.data?[index].trxOut ==
                                                    0
                                                ? '${v.dataHistorySaldo?.data?[index].trxIn}'
                                                : '${v.dataHistorySaldo?.data?[index].trxOut}',
                                            tanggal:
                                                '${v.dataHistorySaldo?.data?[index].createdAt}',
                                            waktu: '',
                                            metode: 'Artha Graha Internasional',
                                            pembayaran: v.dataHistorySaldo
                                                        ?.data?[index].trxOut ==
                                                    0
                                                ? '${v.dataHistorySaldo?.data?[index].trxIn}'
                                                : '-',
                                            total: v.dataHistorySaldo
                                                        ?.data?[index].trxIn ==
                                                    0
                                                ? '${v.dataHistorySaldo?.data?[index].trxOut}'
                                                : '-',
                                          );
                                        }

                                        return Container();
                                      },
                                    ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          );
        }),
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
          padding: EdgeInsets.only(right: 2.w, left: 2.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: selectedIndex == _selectedIndex
                  ? Colors.grey
                  : Colors.grey.shade300),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                judul,
                style: TextStyle(color: Colors.black, fontSize: 9.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
