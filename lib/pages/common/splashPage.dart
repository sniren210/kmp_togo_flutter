import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/main.dart';
import 'package:kmp_togo_mobile/models/product/productInq_model.dart';
import 'package:kmp_togo_mobile/models/product/productSKU_model.dart';
import 'package:kmp_togo_mobile/models/wallet/topup/topup_model.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/history/history.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/address/provider_addressBook.dart';
import 'package:kmp_togo_mobile/providers/ppob/provider_ppob_post.dart';
import 'package:kmp_togo_mobile/providers/ppob/provider_ppob_pre.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/providers/wallet/topup/provider_topup.dart';
import 'package:sizer/sizer.dart';
import '../../models/product/product_model.dart';
import '../history/jenis_transaksi.dart';

class SplashPage extends StatefulWidget {
  String title, subtitle;

  Widget nextPage;
  bool isReplace;
  dynamic model;
  String? provRepo;
  dynamic product;

  //Address
  int? id;
  String? name;
  String? contactName;
  String? phoneNumber;
  String? detailAddress;
  int? provinceId;
  int? cityId;
  int? subdistrictId;
  String? postalCode;

  // PPOB
  String? ppob_code;
  String? ppob_tipe;
  String? ppob_customer_id;
  String? ppob_operator;

  // NFT

  // Product Marketplace
  bool? isUpdate;
  Datum? data;
  String? pm_nameProduk;
  String? pm_descProduk;
  int? pm_hargaProduk;
  int? pm_stokProduk;
  int? pm_weight;
  int? pm_categoryId;
  int? pm_subCategoryId;
  String? pm_selectedProductSelling;
  File? pm_image;
  List<ItemModelProductSKU>? sku;

  double? totalCoin;

  ItemModelProductInquiry? inqDataProduct;
  ItemModelBuyCoin? itemModelBuyCoin;
  String pinValue;

  SplashPage({
    Key? key,
    required this.nextPage,
    required this.isReplace,
    this.model,
    this.provRepo,
    this.product,
    this.id,
    this.name,
    this.contactName,
    this.phoneNumber,
    this.detailAddress,
    this.provinceId,
    this.cityId,
    this.subdistrictId,
    this.postalCode,
    this.ppob_code,
    this.ppob_tipe,
    this.ppob_customer_id,
    this.ppob_operator,
    this.isUpdate,
    this.data,
    this.pm_nameProduk,
    this.pm_descProduk,
    this.pm_hargaProduk,
    this.pm_stokProduk,
    this.pm_weight,
    this.pm_categoryId,
    this.pm_subCategoryId,
    this.pm_selectedProductSelling,
    this.pm_image,
    this.sku,
    this.totalCoin,
    this.inqDataProduct,
    this.itemModelBuyCoin,
    required this.pinValue,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // startTime();
  }

  // startTime() async {
  //   var duration = const Duration(seconds: 2);
  //   return Timer(duration, navigationPage);
  // }

  // void navigationPage() {
  //   if (widget.isReplace) {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context) => widget.nextPage),
  //         (Route<dynamic> route) => false);
  //   } else {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => widget.nextPage),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    if (widget.provRepo == 'addressNew') {
      return WillPopScope(
        onWillPop: () async => false,
        child: BaseWidget<ProviderAddressBook>(
          model: ProviderAddressBook(Repository()),
          onModelReady: (model) => model.addUpdateAddressBook(
              widget.id,
              widget.name,
              widget.contactName,
              widget.phoneNumber,
              widget.detailAddress,
              widget.provinceId,
              widget.cityId,
              widget.subdistrictId,
              widget.postalCode,
              widget.isUpdate),
          child: Container(),
          builder: (context, model, child) => Scaffold(
            // appBar: buildAppBar(),
            body: model.busy
                ? buildLoadingBody()
                : LayoutBuilder(
                    builder: (context, constraints) {
                      if (widget.isUpdate!) {
                        return buildOptionBack();
                      } else {
                        final dataAddress = model.items2!.data;

                        if (dataAddress.id != 0) {
                          return buildOptionBack();
                        } else {
                          return const Center(
                            child: Text('Data Kosong'),
                          );
                        }
                      }
                    },
                  ),
          ),
        ),
      );
    }

    if (widget.provRepo == 'postpaid_checkout') {
      return WillPopScope(
        onWillPop: () async => false,
        child: BaseWidget<ProviderPostpaidCheckout>(
          model: ProviderPostpaidCheckout(Repository()),
          onModelReady: (model) => model.postPaidCheckout(widget.ppob_code!,
              widget.ppob_tipe!, widget.ppob_customer_id!, widget.pinValue),
          child: Container(),
          builder: (context, model, child) => Scaffold(
            // appBar: buildAppBar(),
            body: model.busy
                ? buildLoadingBody()
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final dataInquery = model.items!.data;

                      if (dataInquery.status != '') {
                        return buildOptionBack();
                      } else {
                        return Center(
                          child: Text(dataInquery.status),
                        );
                      }
                    },
                  ),
          ),
        ),
      );
    }

    if (widget.provRepo == 'prepaid_checkout') {
      return WillPopScope(
        onWillPop: () async => false,
        child: BaseWidget<ProviderPrepaidCheckout>(
          model: ProviderPrepaidCheckout(Repository()),
          onModelReady: (model) => model.prePaidCheckout(
              widget.ppob_tipe!,
              widget.ppob_customer_id!,
              widget.ppob_operator ?? '',
              widget.product,
              widget.pinValue),
          child: Container(),
          builder: (context, model, child) => Scaffold(
            // appBar: buildAppBar(),
            body: model.busy
                ? buildLoadingBody()
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final dataInquery = model.items!.data;

                      if (dataInquery.status != '') {
                        return buildOptionBack();
                      } else {
                        return Center(
                          child: Text(dataInquery.status),
                        );
                      }
                    },
                  ),
          ),
        ),
      );
    }

    if (widget.provRepo == 'product_w_variant') {
      return WillPopScope(
        onWillPop: () async => false,
        child: BaseWidget<ProviderCreateProductWithVariant>(
          model: ProviderCreateProductWithVariant(Repository()),
          onModelReady: (model) => model.createProductWithVariant(
              widget.isUpdate,
              widget.isUpdate! ? 0 : 0,
              sharedPreferencesManager.getInt('ownerId'),
              widget.data != null ? widget.data!.name : widget.pm_nameProduk,
              widget.pm_categoryId,
              widget.pm_subCategoryId,
              widget.data != null
                  ? widget.data!.description
                  : widget.pm_descProduk,
              widget.pm_hargaProduk ?? 0,
              widget.sku ?? [],
              widget.pm_selectedProductSelling,
              widget.isUpdate!
                  ? widget.product.items!.data.first.imagePath
                  : widget.pm_image!.path),
          child: Container(),
          builder: (context, model, child) => Scaffold(
            // appBar: buildAppBar(),
            body: model.busy
                ? buildLoadingBody()
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return buildOptionBack();
                    },
                  ),
          ),
        ),
      );
    }

    if (widget.provRepo == 'product_wt_variant') {
      return WillPopScope(
        onWillPop: () async => false,
        child: BaseWidget<ProviderCreateProductWithoutVariant>(
          model: ProviderCreateProductWithoutVariant(Repository()),
          onModelReady: (model) => model.createProductWtVariant(
              widget.isUpdate,
              widget.isUpdate! ? 0 : 0,
              sharedPreferencesManager.getInt('ownerId'),
              widget.data != null ? widget.data!.name : widget.pm_nameProduk,
              widget.data != null
                  ? widget.data!.description
                  : widget.pm_descProduk,
              widget.pm_hargaProduk ?? 0,
              widget.pm_stokProduk ?? 0,
              widget.pm_weight ?? 0,
              widget.pm_categoryId,
              widget.pm_subCategoryId,
              widget.pm_selectedProductSelling,
              widget.isUpdate!
                  ? widget.product.items!.data.first.imagePath
                  : widget.pm_image!.path),
          child: Container(),
          builder: (context, model, child) => Scaffold(
            // appBar: buildAppBar(),
            body: model.busy
                ? buildLoadingBody()
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return buildOptionBack();
                    },
                  ),
          ),
        ),
      );
    }

    if (widget.provRepo == 'product_buy') {
      return WillPopScope(
        onWillPop: () async => false,
        child: BaseWidget<ProviderProduct>(
          model: ProviderProduct(Repository()),
          onModelReady: (model) =>
              model.buyProduct(widget.inqDataProduct, widget.pinValue),
          child: Container(),
          builder: (context, model, child) => Scaffold(
            // appBar: buildAppBar(),
            body: model.busy
                ? buildLoadingBody()
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return buildOptionBack();
                    },
                  ),
          ),
        ),
      );
    }

    if (widget.provRepo == 'buy_coin') {
      return WillPopScope(
        onWillPop: () async => false,
        child: BaseWidget<ProviderTopup>(
          model: ProviderTopup(Repository()),
          onModelReady: (model) =>
              model.buyCoin(widget.totalCoin!, widget.pinValue),
          child: Container(),
          builder: (context, model, child) => Scaffold(
            // appBar: buildAppBar(),
            body: model.busy
                ? buildLoadingBody()
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return buildOptionBack();
                    },
                  ),
          ),
        ),
      );
    }

    if (widget.provRepo == 'sell_coin') {
      return WillPopScope(
        onWillPop: () async => false,
        child: BaseWidget<ProviderTopup>(
          model: ProviderTopup(Repository()),
          onModelReady: (model) =>
              model.sellCoin(widget.totalCoin!, widget.pinValue),
          child: Container(),
          builder: (context, model, child) => Scaffold(
            // appBar: buildAppBar(),
            body: model.busy
                ? buildLoadingBody()
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return buildOptionBack();
                    },
                  ),
          ),
        ),
      );
    }

    return Container(
      color: Colors.greenAccent,
    );
  }

  Scaffold buildLoadingBody() {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 5.h),
              height: 25.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/logon.jpg'))),
            ),
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Tunggu Sebentar Ya...',
              textAlign: TextAlign.center,
              style: TextStyling.titleStyle,
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text(
                'Lörem ipsum putinas eurobävning, pohöpas trev. Odade global hektar rere i biohögån ultras. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF85014e),
      title: Container(
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
              const Text('Cari Aplikasi Disini'),
            ],
          )),
      actions: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 3.w),
          child: Icon(
            Icons.notifications,
            size: 5.w,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget buildOptionBack() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 5.h),
            height: 25.h,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/logon.jpg'))),
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyling.titleStyle,
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: const Text(
              'Lörem ipsum putinas eurobävning, pohöpas trev. Odade global hektar rere i biohögån ultras. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
          ),
          widget.provRepo != 'addressNew'
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 70)),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                // If the button is pressed, return green, otherwise blue
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.green;
                                }
                                return Colors.white;
                              }),
                              textStyle:
                                  MaterialStateProperty.resolveWith((states) {
                                // If the button is pressed, return size 40, otherwise 20
                                if (states.contains(MaterialState.pressed)) {
                                  return const TextStyle(fontSize: 40);
                                }
                                return const TextStyle(fontSize: 20);
                              }),
                            ),
                            child: const Text("Lihat Riwayat Transaksi",
                                style: TextStyling.normal15grey),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return jenisTransaksi();
                                }),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          widget.provRepo != 'addressNew'
              ? const VerticalSpacer(height: 12)
              : Container(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF85014e)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 70)),
                      ),
                      child: Text(
                          widget.provRepo != 'addressNew'
                              ? "Kembali Ke Beranda"
                              : 'Kembali',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                      onPressed: () {
                        if (widget.provRepo != 'addressNew') {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Home();
                            }),
                            (route) => false,
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Home(selectedIndex: 3);
                            }),
                            (route) => false,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
