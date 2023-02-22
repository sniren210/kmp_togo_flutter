import 'package:badges/badges.dart' as Badge;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/components/addspace.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/pages/auth/dashboard/detail_marketplace.dart';
import 'package:kmp_togo_mobile/pages/auth/dashboard/extendsmenu.dart';
import 'package:kmp_togo_mobile/pages/auth/dashboard/marketplacePage.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/cart/cart_screen.dart';
import 'package:kmp_togo_mobile/pages/common/cardUMKM.dart';
import 'package:kmp_togo_mobile/pages/common/cardmitraketgori.dart';
import 'package:kmp_togo_mobile/pages/common/cardnftmitra.dart';
import 'package:kmp_togo_mobile/pages/common/cardpromo.dart';
import 'package:kmp_togo_mobile/pages/nft/dashboard_nft.dart';
import 'package:kmp_togo_mobile/pages/ppob/inputpobwithnumber.dart';
import 'package:kmp_togo_mobile/pages/umkm/umkmMyProduk.dart';
import 'package:kmp_togo_mobile/pages/umkm/umkm_category.dart';
import 'package:kmp_togo_mobile/pages/wallet/buy/buytogoPage.dart';
import 'package:kmp_togo_mobile/pages/wallet/topup/topuppages.dart';
import 'package:kmp_togo_mobile/pages/wallet/withdraw/withdrawpages.dart';
import 'package:kmp_togo_mobile/providers/apitext/providerapitext.dart';
import 'package:kmp_togo_mobile/providers/cart/cart_provider.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/providers/wallet/withdraw/providerwallet.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../../apis/repository.dart';
import '../../../providers/account/provider_account.dart';
import '../../../providers/nft/provider_nft.dart';
import '../../notification/notification_page.dart';
import '../../ppob/wtNumber/inputPpobWTNumber.dart';

class DashboardNew extends StatefulWidget {
  bool isHomeLoading;

  DashboardNew({Key? key, required this.isHomeLoading}) : super(key: key);

  @override
  State<DashboardNew> createState() => _DashboardNewState();
}

class _DashboardNewState extends State<DashboardNew> with NumberFormatMachine {
  bool? loading = true;
  bool? loadingbanner = true;
  bool? loadingBalance = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final getApiTextLogin =
          Provider.of<ProviderApiText>(context, listen: false);
      await getApiTextLogin.getTextBanner1(context);

      ///
      final getkategoriProvider =
          Provider.of<ProviderNft>(context, listen: false);
      await getkategoriProvider.getAllNFT(context);

      final _getTokenProvider =
          Provider.of<ProviderWithDraw>(context, listen: false);
      await _getTokenProvider.getBalanceWallet();

      cektanggal();
      print(getkategoriProvider.loadinggetNFTALL);
      setState(() {
        loading = getkategoriProvider.loadinggetNFTALL;
        loadingbanner = getApiTextLogin.loadinbanner;
        loadingBalance = _getTokenProvider.loadinghistory;
      });
    });

    super.initState();
  }

  calcSaparator(double number) {
    String k_m_b_generator(num) {
      if (num > 999 && num < 99999) {
        return "${(num / 1).toStringAsFixed(1)}";
      } else if (num > 99999 && num < 999999) {
        return NumberFormat('###,###,###,###')
            .format(number)
            .replaceAll(' ', '');
      } else if (num > 999999 && num < 999999999) {
        return "${(num / 1000000).toStringAsFixed(1)} juta";
      } else if (num > 999999999) {
        return "${(num / 1000000000).toStringAsFixed(1)} Miliar";
      } else {
        return num.toString();
      }
    }

    return k_m_b_generator(double.parse(number.toStringAsFixed(3)));
  }

  final List<String> cardList = [
    'assets/images/promo.jpg',
    'assets/images/promo2.jpg',
  ];
  int _currentIndex = 0;
  // List<int> cardList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  cektanggal() async {
    String? tanggalShare = sharedPreferencesManager
        .getString(SharedPreferencesManager.tanggalbanner);
    // print('halo pak : $tanggalShare');
    var now = DateTime.now();

    String? cekAda;
    for (var i = 0; i < 25; i++) {
      DateTime pastMonth = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour - i,
      );
      String? passday = pastMonth.toString().substring(0, 13);

      if (tanggalShare == passday) {
        setState(() {
          cekAda = 'ada';
        });
      } else {
        // print('tidak ada');
      }
    }
    if (cekAda == 'ada') {
      print('ada');
    } else {
      print('kosong');
      _showOpenDialog(context);
    }
  }

  String? tanggalAA;
  _showOpenDialog(_) {
    showDialog(
        context: context,
        builder: (context) {
          return Consumer<ProviderApiText>(builder: (context, v, child) {
            return Center(
                child: ClipRect(
              child: Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: AlertDialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              InkWell(
                                child: ClipRRect(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              v.listImageA?.first ??
                                                  kEmptyImageLink),
                                          fit: BoxFit.cover,
                                        )),
                                    height: MediaQuery.of(context).size.height /
                                        3.2,
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                  ),
                                ),
                                onTap: () {},
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 70,
                              ),

                              // InkWell(
                              //   child: Text('Close(X)',
                              //       style: TextStyle(
                              //         fontSize: MediaQuery.of(context).size.width / 25,
                              //         color: Colors.red,
                              //         fontFamily: 'Open Sans',
                              //       )),
                              //   onTap: () {
                              //     Navigator.of(context).pop();
                              //   },
                              // ),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () async {
                                Navigator.of(context).pop();
                                var now = DateTime.now();
                                String nowSplit = now.toString();
                                DateTime pastMonth = DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  DateTime.now().hour,
                                );
                                String? passday =
                                    pastMonth.toString().substring(0, 13);
                                // String? passday = pastMonth.toString().substring(0, 16);
                                print('asasas $passday');
                                tanggalAA = passday;

                                print('asasas $tanggalAA');

                                await sharedPreferencesManager.setString(
                                    SharedPreferencesManager.tanggalbanner,
                                    tanggalAA!);
                              },
                              child: ClipOval(
                                child: Container(
                                  color: Colors.red,
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )),
            ));
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProviderAccountInfo>(
        model: ProviderAccountInfo(Repository()),
        onModelReady: (model) => model.fetchAccountInfo(),
        child: Container(),
        builder: (context, model, child) {
          return Consumer<ProviderNft>(
              builder: (BuildContext context, v, Widget? child) {
            return Consumer<ProviderApiText>(
                builder: (BuildContext context, va, Widget? child) {
              // print(model.busy);
              return Scaffold(
                appBar: AppBar(
                  title: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        child: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/bg1024.png')),
                        // 'assets/images/White-1024.png')),
                      ),
                      addWidth(10),
                      const Expanded(child: Text('KMP-ToGo')),
                    ],
                  ),
                  actions: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const notificationPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Consumer<CartProvider>(builder: (context, value, child) {
                      if (value.getCounter() < 1) {
                        return SizedBox(
                            width: 18,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CartScreen()));
                                },
                                icon: const Icon(Icons.shopping_cart),
                                color: Colors.white));
                      }
                      return Badge.Badge(
                        badgeContent: Text(
                          value.getCounter().toString(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        position:
                            const Badge.BadgePosition(start: 30, bottom: 30),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen()));
                          },
                          icon: const Icon(Icons.shopping_cart,
                              color: Colors.white),
                        ),
                      );
                    }),
                    const SizedBox(width: 20),
                  ],
                  elevation: 0,
                ),
                body: RefreshIndicator(
                  onRefresh: _pullRefresh,
                  // child: Text('ok'),
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        loadingbanner == false
                            ? CarouselSlider(
                                options: CarouselOptions(
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 1200),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    pauseAutoPlayOnTouch: true,
                                    enlargeCenterPage: true,
                                    viewportFraction: 1,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentIndex = index;
                                      });
                                    }),
                                items: va.listImageA?.map((item) {
                                  return Container(
                                      // color: Colors.transparent,
                                      padding: EdgeInsets.only(
                                          left: 4.w,
                                          right: 4.w,
                                          top: 10.h,
                                          bottom: 10.h),
                                      // color: const Color(0xFF85014e),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(item
                                            // kEmptyImageLink,
                                            ),
                                        fit: BoxFit.cover,
                                      )));
                                }).toList(),
                              )
                            : Center(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 27.h,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                        model.busy
                            ? Container()
                            : Container(
                                margin: EdgeInsets.only(top: 26.h),
                                child: Container(
                                  // color: Colors.white,
                                  color: const Color(0xFF85014e),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          GridView(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 5,
                                                      mainAxisSpacing: 5),
                                              children: [
                                                cardmenu('Topup',
                                                    Icons.monetization_on, () {
                                                  if (model.items!.user.roles
                                                              .first.name ==
                                                          'Konsumen' ||
                                                      model.items!.user.roles
                                                              .first.name ==
                                                          'Trader' ||
                                                      model.items!.user.roles
                                                              .first.name ==
                                                          'Produsen' ||
                                                      true) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              TopUpPage()),
                                                    );
                                                  } else {
                                                    snackbarMenu();
                                                  }
                                                }),
                                                cardmenu(
                                                    'Withdraw', Icons.wallet,
                                                    () {
                                                  if (model.items!.user.roles
                                                              .first.name ==
                                                          'Konsumen' ||
                                                      model.items!.user.roles
                                                              .first.name ==
                                                          'Trader' ||
                                                      model.items!.user.roles
                                                              .first.name ==
                                                          'Produsen' ||
                                                      true) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WithDraw()),
                                                    );
                                                  } else {
                                                    snackbarMenu();
                                                  }
                                                }),
                                                cardmenu('NFT', Icons.layers,
                                                    () {
                                                  if (model.items!.user.roles
                                                              .first.name ==
                                                          'konsumen1' ||
                                                      true) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DashboardNFT()),
                                                    );
                                                  } else {
                                                    snackbarMenu();
                                                  }
                                                }),
                                                cardmenu(
                                                    'UMKM', Icons.shopping_cart,
                                                    () {
                                                  if (model.items!.user.roles.first.name ==
                                                          'produsen' ||
                                                      model.items!.user.roles
                                                              .first.name ==
                                                          'konsumen1' ||
                                                      model.items!.user.roles
                                                              .first.name ==
                                                          'konsumen2' ||
                                                      model.items!.user.roles
                                                              .first.name ==
                                                          'trader' ||
                                                      model.items!.user.roles
                                                              .first.name ==
                                                          'umkm' ||
                                                      true) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MarketplacePage()),
                                                    );
                                                  } else {
                                                    snackbarMenu();
                                                  }
                                                }),
                                                cardmenu(
                                                    'Pulsa', Icons.smartphone,
                                                    () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InputPPOBWithNumber(
                                                              title: 'Pulsa',
                                                              product_type:
                                                                  'pulsa',
                                                            )),
                                                  );
                                                }),
                                                cardmenu(
                                                    'Data', Icons.laptop_mac,
                                                    () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InputPPOBWithNumber(
                                                              title: 'Data',
                                                              product_type:
                                                                  'data',
                                                            )),
                                                  );
                                                }),
                                                cardmenu('Token',
                                                    Icons.lightbulb_outline,
                                                    () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InputPPOBWithNumber(
                                                              title: 'Token',
                                                              product_type:
                                                                  'pln',
                                                            )),
                                                  );
                                                }),
                                                cardmenu(
                                                    'PLN', Icons.electric_bolt,
                                                    () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InputPPOBWithoutNumber(
                                                                title: 'PLN',
                                                                product_type:
                                                                    'pln')),
                                                  );
                                                }),
                                                cardmenu('PDAM', Icons.water,
                                                    () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InputPPOBWithoutNumber(
                                                                title: 'PDAM',
                                                                product_type:
                                                                    'pdam')),
                                                  );
                                                }),
                                                cardmenu(
                                                    'Lainnya', Icons.more_horiz,
                                                    () {
                                                  // klikBottom();
                                                  Get.to(() => ExtendsMenu(
                                                      membertype: model
                                                          .items!
                                                          .user
                                                          .roles
                                                          .first
                                                          .name));
                                                })
                                              ]),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        model.busy
                            ? Container()
                            : Container(
                                margin: EdgeInsets.only(top: 58.h),
                                child: Column(
                                  children: [
                                    model.items!.user.roles.first.name ==
                                                'konsumen1' ||
                                            true
                                        ? Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 4.w,
                                                    right: 4.w,
                                                    top: 2.h,
                                                    bottom: 2.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'NFT Terbaru',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10.sp),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DashboardNFT()),
                                                        );
                                                      },
                                                      child: Text(
                                                        'Lihat Semua',
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            color: Colors.black,
                                                            fontSize: 9.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                  left: 4.w,
                                                  right: 4.w,
                                                ),
                                                child: loading == true
                                                    ? const Center(
                                                        child: Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ))
                                                    : GridView.builder(
                                                        itemCount: v
                                                                    .dataAllNFT!
                                                                    .data!
                                                                    .isNotEmpty &&
                                                                v.dataAllNFT!.data!
                                                                        .length >
                                                                    4
                                                            ? 4
                                                            : v.dataAllNFT!
                                                                .data!.length,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    2,
                                                                childAspectRatio:
                                                                    3 / 4),
                                                        shrinkWrap: true,
                                                        itemBuilder:
                                                            (_, index) {
                                                          final e = v
                                                              .dataAllNFT!
                                                              .data!;
                                                          if (e[index]
                                                              .nftId!
                                                              .isNotEmpty) {
                                                            return cardnftmitra(
                                                              title:
                                                                  e[index].name,
                                                              images: e[index]
                                                                  .imagePath,
                                                              buyer_est: e[
                                                                      index]
                                                                  .qtyUnit
                                                                  .toString(),
                                                              buyer: e[index]
                                                                  .avlUnit
                                                                  .toString(),
                                                              expired: e[index]
                                                                  .expirationDate,
                                                              lockNft: e[index]
                                                                  .nftUnit!
                                                                  .first
                                                                  .holdLimitTill
                                                                  .toString(),
                                                              monthlyPercentage: e[
                                                                      index]
                                                                  .nftUnit!
                                                                  .first
                                                                  .monthlyPercentage
                                                                  .toString(),
                                                              nftSerialId: e[
                                                                          index]
                                                                      .nftUnit!
                                                                      .where((element) =>
                                                                          element
                                                                              .ownerId ==
                                                                          null)
                                                                      .isNotEmpty
                                                                  ? e[index]
                                                                      .nftUnit
                                                                      ?.where((element) =>
                                                                          element
                                                                              .ownerId ==
                                                                          null)
                                                                      .first
                                                                      .nftSerialId
                                                                      .toString()
                                                                  : '',
                                                              priceCoins: e[
                                                                      index]
                                                                  .nftUnit!
                                                                  .first
                                                                  .priceCoin
                                                                  .toString(),
                                                              gasfee: e[index]
                                                                  .gasfee
                                                                  .toString(),
                                                              admfee: e[index]
                                                                  .admfee
                                                                  .toString(),
                                                              deskripsi: e[
                                                                      index]
                                                                  .description,
                                                              owner: e[index]
                                                                      .nftUnit!
                                                                      .where((element) =>
                                                                          element
                                                                              .ownerId ==
                                                                          null)
                                                                      .isNotEmpty
                                                                  ? e[index]
                                                                      .nftUnit
                                                                      ?.where((element) =>
                                                                          element
                                                                              .ownerId ==
                                                                          null)
                                                                      .first
                                                                      .ownerId
                                                                      .toString()
                                                                  : '',
                                                            );
                                                          } else {
                                                            return Container();
                                                          }
                                                        },
                                                      ),
                                              ),
                                              const VerticalSpacer(height: 30),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 4.w, right: 4.w),
                                                height: 14.h,
                                                child: ListView(
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    children: [
                                                      cardpromo(
                                                          'assets/images/promo.jpg'),
                                                      cardpromo(
                                                          'assets/images/promo2.jpg'),
                                                      cardpromo(
                                                          'assets/images/kotak.jpg'),
                                                    ]),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                    model.items!.user.roles.first.name ==
                                                'Produsen' ||
                                            model.items!.user.roles.first
                                                    .name ==
                                                'Konsumen' ||
                                            model.items!.user.roles.first
                                                    .name ==
                                                'konsumen2' ||
                                            model.items!.user.roles.first
                                                    .name ==
                                                'Trader' ||
                                            model.items!.user.roles.first
                                                    .name ==
                                                'umkm' ||
                                            true
                                        ? Column(
                                            children: [
                                              const VerticalSpacer(height: 20),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 4.w,
                                                    right: 4.w,
                                                    top: 2.h,
                                                    bottom: 2.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Mitra UMKM',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10.sp),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  UmkmCategory()),
                                                        );
                                                      },
                                                      child: Text(
                                                        'Lihat Semua',
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            color: Colors.black,
                                                            fontSize: 9.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 4.w, right: 4.w),
                                                height: 6.h,
                                                child: ListView(
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: const [
                                                    cardMitraKategori(
                                                      title: 'hasil pertanian',
                                                      color: Colors.indigo,
                                                    ),
                                                    cardMitraKategori(
                                                      title: 'hasil bumi',
                                                      color: Colors.pink,
                                                    ),
                                                    cardMitraKategori(
                                                      title: 'kopi',
                                                      color: Colors.teal,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 4.w,
                                                    right: 4.w,
                                                    top: 4.h,
                                                    bottom: 2.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Produk UMKM',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10.sp),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MarketplacePage()),
                                                        );
                                                      },
                                                      child: Text(
                                                        'Lihat Semua',
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            color: Colors.black,
                                                            fontSize: 9.sp),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              BaseWidget<ProviderProduct>(
                                                model: ProviderProduct(
                                                    Repository()),
                                                onModelReady: (model) => model
                                                    .fetchAllProduct('online'),
                                                child: Container(),
                                                builder:
                                                    (context, model, child) =>
                                                        Container(
                                                  padding: EdgeInsets.only(
                                                      left: 4.w,
                                                      right: 4.w,
                                                      top: 2.h,
                                                      bottom: 2.h),
                                                  child: model.busy
                                                      ? const Center(
                                                          child:
                                                              CircularProgressIndicator())
                                                      : GridView.builder(
                                                          itemCount: model
                                                                      .items!
                                                                      .data
                                                                      .length >
                                                                  4
                                                              ? 4
                                                              : model.items!
                                                                  .data.length,
                                                          physics:
                                                              const NeverScrollableScrollPhysics(),
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            childAspectRatio:
                                                                3 / 4,
                                                          ),
                                                          shrinkWrap: true,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            model.items!.data.removeWhere(
                                                                (element) => element
                                                                        .sku
                                                                        .isEmpty
                                                                    ? false
                                                                    : element
                                                                            .sku
                                                                            .first
                                                                            .stock! <
                                                                        1);
                                                            return InkWell(
                                                              onTap: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) {
                                                                    return DetailMarketPlace(
                                                                      title: model
                                                                          .items!
                                                                          .data[
                                                                              index]
                                                                          .name,
                                                                      images: model
                                                                          .items!
                                                                          .data[
                                                                              index]
                                                                          .imagePath,
                                                                      rating: model
                                                                          .items!
                                                                          .data[
                                                                              index]
                                                                          .rating,
                                                                      soldCount: model
                                                                          .items!
                                                                          .data[
                                                                              index]
                                                                          .soldCount,
                                                                      priceCoins: model
                                                                              .items!
                                                                              .data[
                                                                                  index]
                                                                              .sku
                                                                              .isEmpty
                                                                          ? 0
                                                                          : model
                                                                              .items!
                                                                              .data[index]
                                                                              .sku
                                                                              .first
                                                                              .price,
                                                                      deskripsi: model
                                                                          .items!
                                                                          .data[
                                                                              index]
                                                                          .name,
                                                                      skus: model
                                                                          .items!
                                                                          .data[
                                                                              index]
                                                                          .sku,
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                              child:
                                                                  CardUMKMDashBoard(
                                                                id: model
                                                                    .items!
                                                                    .data[index]
                                                                    .id,
                                                                gambar: model
                                                                    .items!
                                                                    .data[index]
                                                                    .imagePath,
                                                                stock: model
                                                                        .items!
                                                                        .data[
                                                                            index]
                                                                        .sku
                                                                        .isEmpty
                                                                    ? 0
                                                                    : model
                                                                        .items!
                                                                        .data[
                                                                            index]
                                                                        .sku
                                                                        .first
                                                                        .stock,
                                                                kodebarang: model
                                                                        .items!
                                                                        .data[
                                                                            index]
                                                                        .sku
                                                                        .isEmpty
                                                                    ? null
                                                                    : model
                                                                        .items!
                                                                        .data[
                                                                            index]
                                                                        .sku
                                                                        .first
                                                                        .productId,
                                                                productSelling: model
                                                                    .items!
                                                                    .data[index]
                                                                    .productSelling,
                                                                namaProduct: model
                                                                    .items!
                                                                    .data[index]
                                                                    .name,
                                                                warna: '',
                                                                category: model
                                                                            .items!
                                                                            .data[
                                                                                index]
                                                                            .category !=
                                                                        null
                                                                    ? model
                                                                        .items!
                                                                        .data[
                                                                            index]
                                                                        .category!
                                                                        .name
                                                                    : '',
                                                                moreSKU: model
                                                                        .items!
                                                                        .data[
                                                                            index]
                                                                        .sku
                                                                        .length >
                                                                    1,
                                                                priceMinimal: model
                                                                        .items!
                                                                        .data[
                                                                            index]
                                                                        .sku
                                                                        .isEmpty
                                                                    ? 0
                                                                    : model
                                                                        .items!
                                                                        .data[
                                                                            index]
                                                                        .sku
                                                                        .reduce((curr, next) => curr.price <
                                                                                next.price
                                                                            ? curr
                                                                            : next)
                                                                        .price,
                                                                priceMaximal: model
                                                                        .items!
                                                                        .data[
                                                                            index]
                                                                        .sku
                                                                        .isEmpty
                                                                    ? 0
                                                                    : model
                                                                        .items!
                                                                        .data[
                                                                            index]
                                                                        .sku
                                                                        .reduce((curr, next) => curr.price >
                                                                                next.price
                                                                            ? curr
                                                                            : next)
                                                                        .price,
                                                                isContainsVariants: model
                                                                        .items!
                                                                        .data[
                                                                            index]
                                                                        .sku
                                                                        .length >
                                                                    1,
                                                                model: model,
                                                                isToBuy: true,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                ),
                                              ),
                                              const VerticalSpacer(height: 20),
                                            ],
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                        Consumer<ProviderWithDraw>(
                            builder: (context, v, child) {
                          return Container(
                            padding: EdgeInsets.only(
                              left: 2.w,
                              right: 2.w,
                            ),
                            margin: EdgeInsets.only(
                                left: 4.w, right: 4.w, top: 22.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 2.h, bottom: 2.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.wallet,
                                                    size: 9.w,
                                                    color:
                                                        const Color(0xFF85014e),
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      loadingBalance ?? true
                                                          ? Text(
                                                              '....',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      12.sp),
                                                            )
                                                          : Text(
                                                              calcSaparator(
                                                                  double.parse(v
                                                                          .balanceWallet
                                                                          ?.data
                                                                          .point ??
                                                                      '0')),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      10.sp),
                                                            ),
                                                      SizedBox(
                                                        height: 1.w,
                                                      ),
                                                      Text(
                                                        'Saldo Poin',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 9.sp),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: VerticalDivider(
                                      color: Colors.black,
                                      thickness: 1,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 2.h, bottom: 2.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 10.w,
                                                    height: 4.h,
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.contain,
                                                            image: AssetImage(
                                                                'assets/images/logon.jpg'))),
                                                    // child: Icon(
                                                    //   Icons.monetization_on,
                                                    //   size: 9.w,
                                                    //   color:
                                                    //       Color(0xFF85014e),
                                                    // ),
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      loadingBalance ?? true
                                                          ? Text(
                                                              '....',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      12.sp),
                                                            )
                                                          : Text(
                                                              calcSaparator(
                                                                  double.parse(v
                                                                          .balanceWallet
                                                                          ?.data
                                                                          .coin ??
                                                                      '0')),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      10.sp),
                                                            ),
                                                      SizedBox(
                                                        height: 1.w,
                                                      ),
                                                      Text(
                                                        'Saldo Coin',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 9.sp),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: VerticalDivider(
                                      color: Colors.black,
                                      thickness: 1,
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
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 2.h, bottom: 2.h),
                                      child: Icon(Icons.swap_horiz,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              );
            });
          });
        });
  }

  cardmenu(String? judul, IconData icon, VoidCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(left: 2.w, right: 2.w),
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Icon(
                icon,
                size: 7.w,
                color: const Color(0xFF85014e),
              ),
            ),
            SizedBox(
              height: 1.7.h,
            ),
            Text(
              judul ?? "",
              style: TextStyle(color: Colors.white, fontSize: 9.sp),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    Get.offAllNamed('/home');
  }
}
