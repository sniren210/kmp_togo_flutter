import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/models/product/productCart_model.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/buySuccessPage.dart';
import 'package:kmp_togo_mobile/pages/common/pinPage.dart';
import 'package:kmp_togo_mobile/pages/common/splashPage.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/account/provider_account.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';

class MarketplaceInquiryPage extends StatefulWidget {
  String? productName;
  String? variantName;
  int? skuId;
  int? qty;
  int? storeId;
  int? addressBookId;
  String? code;

  String? shippingName;

  String? contactName;
  String? phoneNumber;
  String? detailAddress;

  final bool isFromCart;
  List<ItemProductCart>? itemsCart = [];

  MarketplaceInquiryPage({
    Key? key,
    this.productName,
    this.variantName,
    this.skuId,
    this.qty,
    this.storeId,
    this.addressBookId,
    this.code,
    this.shippingName,
    this.contactName,
    this.phoneNumber,
    this.detailAddress,
    required this.isFromCart,
    this.itemsCart,
  }) : super(key: key);

  @override
  State<MarketplaceInquiryPage> createState() => _MarketplaceInquiryPageState();
}

class _MarketplaceInquiryPageState extends State<MarketplaceInquiryPage>
    with NumberFormatMachine {
  int? groupValue = 1;

  @override
  Widget build(BuildContext context) {
    if (widget.isFromCart) {
      return BaseWidget<ProviderProduct>(
        model: ProviderProduct(Repository()),
        onModelReady: (model) => model.buyProductInquiryCart(widget.itemsCart!),
        child: Container(),
        builder: (context, model, child) => BaseWidget<ProviderAccountInfo>(
            model: ProviderAccountInfo(Repository()),
            onModelReady: (model) => model.fetchAccountInfo(),
            child: Container(),
            builder: (context, model2, child) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xFF85014e),
                  title: const Text('Inquiry'),
                ),
                body: model.busy || model2.busy
                    ? const Center(child: CircularProgressIndicator())
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          final dataInquery = model.itemsInquiry!.data;

                          if (dataInquery.orders.isNotEmpty) {
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        1.6,
                                    child: ListView.builder(
                                        itemCount: model
                                            .itemsInquiry!.data.orders.length,
                                        itemBuilder: (context, index) {
                                          final dataItem = dataInquery.orders;

                                          return Container(
                                            color: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    color: Colors.white,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 100,
                                                            height: 80,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    image:
                                                                        DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/images/logon.jpg'),
                                                              fit: BoxFit
                                                                  .fitHeight,
                                                            )),
                                                            alignment: Alignment
                                                                .center,
                                                          ),
                                                          const HorizontalSpacer(
                                                              width: 8),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  widget.productName ??
                                                                      '',
                                                                  style: TextStyling
                                                                      .w600bold16black),
                                                              const VerticalSpacer(
                                                                  height: 7),
                                                              Text(
                                                                  widget.variantName ??
                                                                      '',
                                                                  style: TextStyling
                                                                      .w40014black),
                                                              // const VerticalSpacer(height: 7),
                                                              // Row(
                                                              //   children: [
                                                              //     const Icon(Icons.currency_bitcoin,
                                                              //         size: 14),
                                                              //     const Text(' Poin',
                                                              //         style: TextStyling.w40014black),
                                                              //   ],
                                                              // ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const VerticalSpacer(
                                                      height: 8),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text(
                                                        "Pengiriman",
                                                        style: TextStyling
                                                            .w600bold16black,
                                                      ),
                                                    ],
                                                  ),
                                                  const VerticalSpacer(
                                                      height: 8),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Nama Kontak",
                                                              style: TextStyling
                                                                  .w30013black,
                                                            ),
                                                            Text(
                                                              widget.contactName ??
                                                                  '',
                                                              style: TextStyling
                                                                  .bold13black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Alamat Pengantaran",
                                                              style: TextStyling
                                                                  .w30013black,
                                                            ),
                                                            Text(
                                                              widget.detailAddress ??
                                                                  '',
                                                              style: TextStyling
                                                                  .bold13black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Nomer Hp/Telepon",
                                                              style: TextStyling
                                                                  .w30013black,
                                                            ),
                                                            Text(
                                                              widget.phoneNumber ??
                                                                  '',
                                                              style: TextStyling
                                                                  .bold13black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const VerticalSpacer(
                                                          height: 8),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Kurir",
                                                              style: TextStyling
                                                                  .w30013black,
                                                            ),
                                                            Text(
                                                              widget.shippingName ??
                                                                  '',
                                                              style: TextStyling
                                                                  .bold13black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const VerticalSpacer(
                                                      height: 30),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text(
                                                        "Detail Pembayaran",
                                                        style: TextStyling
                                                            .w600bold16black,
                                                      ),
                                                    ],
                                                  ),
                                                  const VerticalSpacer(
                                                      height: 8),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Biaya",
                                                              style: TextStyling
                                                                  .w30013black,
                                                            ),
                                                            Text(
                                                              "${getNumberFormatSeparator(dataInquery.subtotal.toDouble())} Poin",
                                                              style: TextStyling
                                                                  .bold13black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Diskon",
                                                              style: TextStyling
                                                                  .w30013black,
                                                            ),
                                                            Text(
                                                              "${getNumberFormatSeparator(dataInquery.discount.toDouble())} Poin",
                                                              style: TextStyling
                                                                  .bold13black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 7.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Biaya Admin",
                                                              style: TextStyling
                                                                  .w30013black,
                                                            ),
                                                            Text(
                                                              "${getNumberFormatSeparator(dataInquery.admfee.toDouble())} Poin",
                                                              style: TextStyling
                                                                  .bold13black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 2.0),
                                                        child: Divider(
                                                          height: 1,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Total Biaya",
                                                              style: TextStyling
                                                                  .w50015black,
                                                            ),
                                                            Text(
                                                              "${getNumberFormatSeparator(dataInquery.total.toDouble())} Poin",
                                                              style: TextStyling
                                                                  .w600bold16black,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                  const VerticalSpacer(height: 8),
                                  Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const VerticalSpacer(height: 8),
                                          const Text('Metode Pembayaran NFT',
                                              style:
                                                  TextStyling.w600bold16black),
                                          const VerticalSpacer(height: 18),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Radio(
                                                  value: 0,
                                                  groupValue: groupValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      groupValue =
                                                          value as int?;
                                                    });
                                                  }),
                                              const HorizontalSpacer(width: 8),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text('Poin Kamu',
                                                      style: TextStyling
                                                          .w40014black),
                                                  const VerticalSpacer(
                                                      height: 12),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                          Icons
                                                              .currency_exchange,
                                                          size: 16),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Text(
                                                            '${getNumberFormatSeparator(0)} Poin Kamu',
                                                            // '${getNumberFormatSeparator(model2.items!.data.tokenWallet.token)} Poin Kamu',
                                                            style: TextStyling
                                                                .w40014black),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const VerticalSpacer(height: 30),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(const Color(
                                                                  0xFF85014e)),
                                                      padding: MaterialStateProperty
                                                          .all(const EdgeInsets
                                                                  .symmetric(
                                                              vertical: 15,
                                                              horizontal: 70)),
                                                    ),
                                                    child: const Text(
                                                        "Beli Sekarang",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color:
                                                                Colors.white)),
                                                    onPressed: () {
                                                      final SharedPreferencesManager
                                                          sharedPreferencesManager =
                                                          locator<
                                                              SharedPreferencesManager>();

                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                          return EnterPinPage(
                                                              isAllowBack: true,
                                                              nextPage:
                                                                  SplashPage(
                                                                      pinValue:
                                                                          sharedPreferencesManager.getString(SharedPreferencesManager.pin) ??
                                                                              '',
                                                                      nextPage:
                                                                          BuySuccessPage(
                                                                        nextPage:
                                                                            Home(),
                                                                        title:
                                                                            'Berhasil Membeli',
                                                                        subtitle:
                                                                            '',
                                                                      ),
                                                                      title:
                                                                          'Berhasil Membeli',
                                                                      subtitle:
                                                                          '',
                                                                      provRepo:
                                                                          'product_buy',
                                                                      model:
                                                                          null,
                                                                      inqDataProduct:
                                                                          model
                                                                              .itemsInquiry,
                                                                      isReplace:
                                                                          false),
                                                              isContainFunctionBack:
                                                                  true,
                                                              title:
                                                                  'Konfirmasi Pembelian');
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text('null'),
                            );
                          }
                        },
                      ),
              );
            }),
      );
    }
    return BaseWidget<ProviderProduct>(
      model: ProviderProduct(Repository()),
      onModelReady: (model) => model.buyProductInquiry(widget.skuId, widget.qty,
          widget.storeId, widget.addressBookId, widget.code),
      child: Container(),
      builder: (context, model, child) => BaseWidget<ProviderAccountInfo>(
          model: ProviderAccountInfo(Repository()),
          onModelReady: (model) => model.fetchAccountInfo(),
          child: Container(),
          builder: (context, model2, child) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xFF85014e),
                title: const Text('Inquiry'),
              ),
              body: model.busy || model2.busy
                  ? const Center(child: CircularProgressIndicator())
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        final dataInquery = model.itemsInquiry!.data;

                        if (dataInquery.orders.isNotEmpty) {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 80,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/logon.jpg'),
                                            fit: BoxFit.fitHeight,
                                          )),
                                          alignment: Alignment.center,
                                        ),
                                        const HorizontalSpacer(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(widget.productName ?? '',
                                                style: TextStyling
                                                    .w600bold16black),
                                            const VerticalSpacer(height: 7),
                                            Text(widget.variantName ?? '',
                                                style: TextStyling.w40014black),
                                            // const VerticalSpacer(height: 7),
                                            // Row(
                                            //   children: [
                                            //     const Icon(Icons.currency_bitcoin,
                                            //         size: 14),
                                            //     const Text(' Poin',
                                            //         style: TextStyling.w40014black),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const VerticalSpacer(height: 8),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Pengiriman",
                                              style:
                                                  TextStyling.w600bold16black,
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacer(height: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Nama Kontak",
                                                    style:
                                                        TextStyling.w30013black,
                                                  ),
                                                  Text(
                                                    widget.contactName ?? '',
                                                    style:
                                                        TextStyling.bold13black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Alamat Pengantaran",
                                                    style:
                                                        TextStyling.w30013black,
                                                  ),
                                                  Text(
                                                    widget.detailAddress ?? '',
                                                    style:
                                                        TextStyling.bold13black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Nomer Hp/Telepon",
                                                    style:
                                                        TextStyling.w30013black,
                                                  ),
                                                  Text(
                                                    widget.phoneNumber ?? '',
                                                    style:
                                                        TextStyling.bold13black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const VerticalSpacer(height: 8),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Kurir",
                                                    style:
                                                        TextStyling.w30013black,
                                                  ),
                                                  Text(
                                                    widget.shippingName ?? '',
                                                    style:
                                                        TextStyling.bold13black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacer(height: 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Detail Pembayaran",
                                              style:
                                                  TextStyling.w600bold16black,
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacer(height: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Biaya",
                                                    style:
                                                        TextStyling.w30013black,
                                                  ),
                                                  Text(
                                                    "${getNumberFormatSeparator(dataInquery.subtotal.toDouble())} Poin",
                                                    style:
                                                        TextStyling.bold13black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Diskon",
                                                    style:
                                                        TextStyling.w30013black,
                                                  ),
                                                  Text(
                                                    "${getNumberFormatSeparator(dataInquery.discount.toDouble())} Poin",
                                                    style:
                                                        TextStyling.bold13black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Biaya Admin",
                                                    style:
                                                        TextStyling.w30013black,
                                                  ),
                                                  Text(
                                                    "${getNumberFormatSeparator(dataInquery.admfee.toDouble())} Poin",
                                                    style:
                                                        TextStyling.bold13black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.0),
                                              child: Divider(
                                                height: 1,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Total Biaya",
                                                    style:
                                                        TextStyling.w50015black,
                                                  ),
                                                  Text(
                                                    "${getNumberFormatSeparator(dataInquery.total.toDouble())} Poin",
                                                    style: TextStyling
                                                        .w600bold16black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const VerticalSpacer(height: 8),
                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const VerticalSpacer(height: 8),
                                        const Text('Metode Pembayaran NFT',
                                            style: TextStyling.w600bold16black),
                                        const VerticalSpacer(height: 18),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Radio(
                                                value: 0,
                                                groupValue: groupValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    groupValue = value as int?;
                                                  });
                                                }),
                                            const HorizontalSpacer(width: 8),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text('Poin Kamu',
                                                    style: TextStyling
                                                        .w40014black),
                                                const VerticalSpacer(
                                                    height: 12),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        Icons.currency_exchange,
                                                        size: 16),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text(
                                                          '${getNumberFormatSeparator(0)} Poin Kamu',
                                                          // '${getNumberFormatSeparator(model2.items!.data.tokenWallet.token)} Poin Kamu',
                                                          style: TextStyling
                                                              .w40014black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacer(height: 30),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(const Color(
                                                                0xFF85014e)),
                                                    padding:
                                                        MaterialStateProperty
                                                            .all(const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 15,
                                                                horizontal:
                                                                    70)),
                                                  ),
                                                  child: const Text(
                                                      "Beli Sekarang",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white)),
                                                  onPressed: () {
                                                    final SharedPreferencesManager
                                                        sharedPreferencesManager =
                                                        locator<
                                                            SharedPreferencesManager>();

                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                        return EnterPinPage(
                                                            isAllowBack: true,
                                                            nextPage:
                                                                SplashPage(
                                                                    pinValue:
                                                                        sharedPreferencesManager.getString(SharedPreferencesManager.pin) ??
                                                                            '',
                                                                    nextPage:
                                                                        BuySuccessPage(
                                                                      nextPage:
                                                                          Home(),
                                                                      title:
                                                                          'Berhasil Membeli',
                                                                      subtitle:
                                                                          '',
                                                                    ),
                                                                    title:
                                                                        'Berhasil Membeli',
                                                                    subtitle:
                                                                        '',
                                                                    provRepo:
                                                                        'product_buy',
                                                                    model: null,
                                                                    inqDataProduct:
                                                                        model
                                                                            .itemsInquiry,
                                                                    isReplace:
                                                                        false),
                                                            isContainFunctionBack:
                                                                true,
                                                            title:
                                                                'Konfirmasi Pembelian');
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text('null'),
                          );
                        }
                      },
                    ),
            );
          }),
    );
  }
}
