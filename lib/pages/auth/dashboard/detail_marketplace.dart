import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/auth/dashboard/marketplace_shippingPage.dart';
import 'package:kmp_togo_mobile/pages/common/ratings.dart';
import 'package:kmp_togo_mobile/providers/cart/cart_provider.dart';
import 'package:kmp_togo_mobile/providers/database/database.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../models/product/product_model.dart';

class DetailMarketPlace extends StatefulWidget {
  String? title, category, images, deskripsi;
  int? rating, soldCount, priceCoins;
  List<Sku>? skus;

  DetailMarketPlace(
      {required this.images,
      required this.title,
      this.deskripsi,
      this.rating,
      this.soldCount,
      this.priceCoins,
      this.skus});

  @override
  State<DetailMarketPlace> createState() => _DetailMarketPlaceState();
}

class _DetailMarketPlaceState extends State<DetailMarketPlace>
    with TickerProviderStateMixin, NumberFormatMachine {
  late ScrollController _scrollController;

  bool? loading = false;
  int quantity = 0;

  int selectedSkuId = 0;
  int selectedVariantOptionId = 0;
  String? selectedVariantName = '';
  bool isMoreSKU = false;

  int? stockBarang = 0;

  void increment() {
    if (isMoreSKU) {
      if (selectedVariantOptionId != 0) {
        setState(() {
          if (stockBarang != 0) {
            if (quantity >= 0 && quantity < stockBarang!) {
              quantity++;
            }
          }
        });
      } else {
        customSnackbar(
            type: 'error',
            title: 'Variant belum dipilih',
            text: 'Silahkan pilih variant terlebih dahulu');
      }
    } else {
      setState(() {
        if (stockBarang != 0) {
          if (quantity >= 0 && quantity < stockBarang!) {
            quantity++;
          }
        }
      });
    }
  }

  void decrement() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  final List<SKUW> _dataListSku = [];

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });

    for (var element in widget.skus!) {
      _dataListSku.add(SKUW(
          id: element.id,
          productId: element.productId,
          price: element.price,
          stock: element.stock,
          weight: element.weight,
          skuvariants: element.skuvariants));
    }

    selectedSkuId = widget.skus?.isEmpty ?? true ? 0 : widget.skus!.first.id;
    stockBarang = _dataListSku.isEmpty
        ? 0
        : _dataListSku
                .where((element) => element.id == selectedSkuId)
                .first
                .stock ??
            0;
    isMoreSKU = _dataListSku.any((element) => element.skuvariants.isNotEmpty);

    super.initState();
  }

  dateConvert(date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Detail Produk UMKM'),
        ),
        body: loading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<ProviderNft>(
                builder: (BuildContext context, v, Widget? Child) {
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverLayoutBuilder(builder: (_, _sliver) {
                      return SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (_, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 180,
                                          width: double.maxFinite,
                                          alignment: Alignment.bottomCenter,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            ),
                                            color: Colors.grey,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  widget.images ??
                                                      kEmptyImageLink),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    v.dataAllNFTid?.data?.nft
                                                            ?.name ??
                                                        widget.title!,
                                                    style: const TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Text('0.0 coin'),
                                                ],
                                              ),
                                              const Spacer(),
                                              const Text(
                                                'Stok: ',
                                                style: TextStyling.w40014black,
                                              ),
                                              Text(
                                                  stockBarang! > 1
                                                      ? stockBarang.toString()
                                                      : 'Stok Tidak Tersedia',
                                                  style: TextStyling.w40014blue)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              StarRating(
                                                iconSize: 13,
                                                rating: widget.rating != null
                                                    ? widget.rating!.toDouble()
                                                    : 0,
                                                onRatingChanged: (rating) =>
                                                    setState(() {}),
                                                color: Colors.orange,
                                              ),
                                              Text(
                                                  ' (${widget.soldCount != null ? widget.soldCount!.toInt() : 0})',
                                                  style:
                                                      TextStyling.w40014grey),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Informasi Umum',
                                            style: TextStyling.w600bold16black),
                                        const VerticalSpacer(height: 18),
                                        StatefulBuilder(
                                          builder: (context, cts) {
                                            _dataListSku
                                                .sort((status1, status2) {
                                              var toString1 = status1.price;
                                              var toString2 = status2.price;

                                              return toString1
                                                  .compareTo(toString2);
                                            });

                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Text('SKU:'),
                                                    Row(
                                                      children: _dataListSku
                                                          .map((e) =>
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    selectedSkuId =
                                                                        e.id;
                                                                    stockBarang =
                                                                        e.stock;

                                                                    selectedVariantOptionId =
                                                                        0;
                                                                  });
                                                                },
                                                                child: Card(
                                                                  color: selectedSkuId ==
                                                                          e.id
                                                                      ? Colors
                                                                          .blue
                                                                      : Colors
                                                                          .white,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                        isMoreSKU
                                                                            ? '${widget.title} - Tipe ${_dataListSku.indexOf(e) + 1}'
                                                                            : '${widget.title}',
                                                                        style: selectedSkuId ==
                                                                                e.id
                                                                            ? TextStyling.w40014white
                                                                            : TextStyling.w40014black),
                                                                  ),
                                                                ),
                                                              ))
                                                          .toList(),
                                                    ),
                                                  ],
                                                ),
                                                isMoreSKU
                                                    ? Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const VerticalSpacer(
                                                              height: 18),
                                                          Row(
                                                            children: [
                                                              const Text(
                                                                  'Variant:'),
                                                              Row(
                                                                children:
                                                                    _dataListSku
                                                                        .where((element) =>
                                                                            element.id ==
                                                                            selectedSkuId)
                                                                        .first
                                                                        .skuvariants
                                                                        .map((e) =>
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                setState(() {
                                                                                  selectedVariantOptionId = e.variantOptionId;

                                                                                  selectedVariantName = e.variantOption.name;
                                                                                });
                                                                              },
                                                                              child: Card(
                                                                                color: selectedVariantOptionId == e.variantOptionId ? Colors.blue : Colors.white,
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(4.0),
                                                                                  child: Text(e.variantOption.name.toString(), style: selectedVariantOptionId == e.variantOptionId ? TextStyling.w40014white : TextStyling.w40014black),
                                                                                ),
                                                                              ),
                                                                            ))
                                                                        .toList(),
                                                              ),
                                                            ],
                                                          ),
                                                          const VerticalSpacer(
                                                              height: 6),
                                                        ],
                                                      )
                                                    : Container(),
                                              ],
                                            );
                                          },
                                        ),
                                        const VerticalSpacer(height: 18),
                                        const Text('Deskripsi',
                                            style: TextStyling.w600bold16black),
                                        const VerticalSpacer(height: 18),
                                        Text(widget.deskripsi ?? ''),
                                        const VerticalSpacer(height: 36),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Pilih Kuantitas: ',
                                                style: TextStyling.w40014black),
                                            Container(
                                              padding: const EdgeInsets.all(3),
                                              // decoration: BoxDecoration(
                                              //     borderRadius:
                                              //         BorderRadius.circular(5),
                                              //     color: Theme.of(context)
                                              //         .primaryColor),
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        decrement();
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                          color: Colors
                                                              .grey.shade300,
                                                        )),
                                                        child: Icon(
                                                          Icons.remove,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          size: 20,
                                                        ),
                                                      )),
                                                  Container(
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 16,
                                                        vertical: 5),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3),
                                                        color: Colors.white),
                                                    child: Text(
                                                      quantity.toString(),
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        increment();
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                          color: Colors
                                                              .grey.shade300,
                                                        )),
                                                        child: Icon(
                                                          Icons.add,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          size: 20,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        childCount: 1,
                      ));
                    })
                  ],
                );
              }),
        bottomSheet: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: quantity > 0
                        ? () {
                            setState(() {
                              loading = true;
                            });

                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MarketplaceShippingPage(
                                productName: widget.title ?? '',
                                variantName: selectedVariantName ?? '',
                                skuId: selectedSkuId,
                                qty: quantity,
                                storeId: 1,
                              );
                            }));

                            setState(() {
                              loading = false;
                            });
                          }
                        : null,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: quantity > 0
                                ? const Color(0xFF85014e)
                                : Colors.grey),
                        child: const Text(
                          'Beli Sekarang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 12),
                        )),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  flex: 1,
                  child: loading == false
                      ? InkWell(
                          onTap: quantity > 0
                              ? () async {
                                  final SharedPreferencesManager
                                      sharedPreferencesManager =
                                      locator<SharedPreferencesManager>();
                                  try {
                                    await AppDb().insertToCart(CartData(
                                        id: selectedSkuId,
                                        userId: sharedPreferencesManager.getInt(
                                            SharedPreferencesManager.userId)!,
                                        productId: selectedSkuId,
                                        productName: widget.title ?? '',
                                        initialPrice: widget.priceCoins,
                                        productPrice: _dataListSku
                                            .where((element) =>
                                                element.id == selectedSkuId)
                                            .first
                                            .price,
                                        // quantity: ValueNotifier(
                                        //     provider.cart[index]
                                        //         .quantity!.value),
                                        quantity: quantity,
                                        unitTag: widget.category ?? '',
                                        image: widget.images));
                                    cart.addTotalPrice(_dataListSku
                                        .where((element) =>
                                            element.id == selectedSkuId)
                                        .first
                                        .price
                                        .toDouble());
                                    cart.addCounter();

                                    await customSnackbar(
                                        type: 'success',
                                        title: 'success',
                                        text:
                                            'berhasil ditambahkan ke keranjang');
                                  } catch (e) {
                                    await customSnackbar(
                                        type: 'error',
                                        title: 'error',
                                        text: e.toString());
                                  }
                                }
                              : null,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: quantity > 0
                                      ? Colors.orange
                                      : Colors.grey),
                              child: const Text(
                                '+ Keranjang',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              )),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey),
                          child: const Text(
                            'Waiting.....',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SKUW {
  SKUW({
    required this.id,
    required this.productId,
    required this.price,
    required this.stock,
    required this.weight,
    required this.skuvariants,
  });

  int id;
  int productId;
  int price;
  int? stock;
  int? weight;
  List<Skuvariant> skuvariants;
}

// class SkuvariantW {
//   SkuvariantW({
//     required this.variantOptionId,
//     required this.variantOption,
//   });
//
//   int variantOptionId;
//   VariantOptionM variantOption;
//
//   factory SkuvariantW.fromJson(Map<String, dynamic> json) => SkuvariantW(
//         variantOptionId: json["variantOptionId"],
//         variantOption: VariantOptionM.fromJson(json["variantOption"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "variantOptionId": variantOptionId,
//         "variantOption": variantOption.toJson(),
//       };
// }
//
// class VariantOptionM {
//   VariantOptionM({
//     required this.name,
//     required this.variant,
//   });
//
//   String name;
//   VariantProductModel variant;
//
//   factory VariantOptionM.fromJson(Map<String, dynamic> json) => VariantOptionM(
//         name: json["name"],
//         variant: VariantProductModel.fromJson(json["variant"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "variant": variant.toJson(),
//       };
// }
//
// class VariantProductModelW {
//   VariantProductModelW({
//     required this.name,
//   });
//
//   String name;
//
//   factory VariantProductModelW.fromJson(Map<String, dynamic> json) =>
//       VariantProductModelW(
//         name: json["name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": name,
//       };
// }
