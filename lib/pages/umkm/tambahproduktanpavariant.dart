import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kmp_togo_mobile/pages/common/buttons.dart';
import 'package:kmp_togo_mobile/pages/umkm/fotoproduk.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';
import '../../models/product/product_model.dart';

class TambahProdukTanpaVariant extends StatefulWidget {
  String title;
  ProviderProduct model;

  final String nameProduk;
  final String descProduk;
  final int weight;
  final int categoryId;
  final int subCategoryId;

  TambahProdukTanpaVariant({
    super.key,
    required this.title,
    required this.model,
    required this.nameProduk,
    required this.descProduk,
    required this.weight,
    required this.categoryId,
    required this.subCategoryId,
  });

  @override
  State<TambahProdukTanpaVariant> createState() =>
      _TambahProdukTanpaVariantState();
}

class _TambahProdukTanpaVariantState extends State<TambahProdukTanpaVariant> {
  String productSelling = 'online';

  TextEditingController cHargaBarang = TextEditingController();
  TextEditingController cStokBarang = TextEditingController();

  _navigateAndRefreshAddUpdate(BuildContext context, ProviderProduct model,
      bool isUpdate, Datum? data) async {
    final result = await Get.to(() => FotoProduk(
          product: model,
          isUpdate: isUpdate,
          data: data,
          selectedProductSelling: productSelling,
          isWithVariant: false,
          nameProduk: widget.nameProduk,
          descProduk: widget.descProduk,
          categoryId: widget.categoryId,
          subCategoryId: widget.subCategoryId,
          hargaProduk: int.parse(cHargaBarang.text),
          stokProduk: int.parse(cStokBarang.text),
          weight: widget.weight,
        ));
    if (result != null) {
      model.fetchAllProduct(
          productSelling); // call your own function here to refresh screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF85014e),
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
                decoration: const BoxDecoration(
                    // border: Border(
                    //   bottom: BorderSide(color: Colors.grey.shade500),
                    // ),
                    ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 1.h, bottom: 1.5.h, left: 3.w, right: 3.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                  margin: EdgeInsets.only(top: 2.h),
                                  child: Text(
                                    "Harga",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                    ),
                                  )),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                margin: EdgeInsets.only(top: 2.h),
                                height: 5.h,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: cHargaBarang,
                                  style: TextStyle(color: Colors.grey.shade500),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Harga';
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    prefixIcon: Icon(
                                      Icons.monetization_on,
                                      size: 4.w,
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 11.sp),
                                    hintText: 'Masukkan Harga',
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                  margin: EdgeInsets.only(top: 2.h),
                                  child: Text(
                                    "Stok Barang",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                    ),
                                  )),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                margin: EdgeInsets.only(top: 2.h),
                                height: 5.h,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: cStokBarang,
                                  style: TextStyle(color: Colors.grey.shade500),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Harga';
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    prefixIcon: Icon(
                                      Icons.monetization_on,
                                      size: 4.w,
                                    ),
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 11.sp),
                                    hintText: 'Masukkan Stok Barang',
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                )),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    width: context.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            await _navigateAndRefreshAddUpdate(
                                context, widget.model, false, null);
                          },
                          child: const ButtonLanjutkan(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
