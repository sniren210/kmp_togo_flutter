import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/models/product/productSKU_model.dart';
import 'package:kmp_togo_mobile/pages/common/buttons.dart';
import 'package:kmp_togo_mobile/pages/common/cardinformasipenjualan.dart';
import 'package:kmp_togo_mobile/pages/umkm/fotoproduk.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';

import '../../models/product/product_model.dart';

class TambahProdukDenganVariant extends StatefulWidget {
  String title;
  List<TextEditingController> listSkuHeadersUkuran;
  List<TextEditingController> listSkuHeadersWarna;
  List<TextEditingController> listSkuHeadersHarga;
  List<TextEditingController> listSkuHeadersStock;

  ProviderProduct model;

  final String nameProduk;
  final String descProduk;
  final int weight;
  final int categoryId;
  final int subCategoryId;

  TambahProdukDenganVariant(
      {Key? key,
      required this.title,
      required this.listSkuHeadersUkuran,
      required this.listSkuHeadersWarna,
      required this.listSkuHeadersHarga,
      required this.listSkuHeadersStock,
      required this.model,
      required this.nameProduk,
      required this.descProduk,
      required this.weight,
      required this.categoryId,
      required this.subCategoryId})
      : super(key: key);

  @override
  State<TambahProdukDenganVariant> createState() =>
      _TambahProdukDenganVariantState();
}

class _TambahProdukDenganVariantState extends State<TambahProdukDenganVariant> {
  String productSelling = 'online';

  final _formKey = GlobalKey<FormState>();

  _navigateAndRefreshAddUpdate(BuildContext context, ProviderProduct model,
      bool isUpdate, Datum? data) async {
    List<ItemModelProductSKU>? sku = [];

    for (int i = 0; i < widget.listSkuHeadersUkuran.length; i++) {
      sku.add(ItemModelProductSKU(
          price: int.parse(widget.listSkuHeadersHarga[i].text),
          weight: widget.weight,
          stock: int.parse(widget.listSkuHeadersStock[i].text),
          variant: [
            VariantSKUModel(
                name: 'Ukuran',
                variantOption: VariantOptionSKUModel(
                    name: widget.listSkuHeadersUkuran[i].text)),
            VariantSKUModel(
                name: 'Warna',
                variantOption: VariantOptionSKUModel(
                    name: widget.listSkuHeadersWarna[i].text)),
          ]));
    }

    final result = await Get.to(() => FotoProduk(
          product: model,
          isUpdate: isUpdate,
          data: data,
          selectedProductSelling: productSelling,
          isWithVariant: true,
          nameProduk: widget.nameProduk,
          descProduk: widget.descProduk,
          categoryId: widget.categoryId,
          subCategoryId: widget.subCategoryId,
          weight: widget.weight,
          sku: sku,
        ));
    if (result != null) {
      model.fetchAllProduct(
          productSelling); // call your own function here to refresh screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF85014e),
          elevation: 0,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 3.w, right: 3.w),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 1.h),
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: widget.listSkuHeadersUkuran.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return CardInformasiPenjualan(
                                  title: widget.title,
                                  ukuran:
                                      widget.listSkuHeadersUkuran[index].text,
                                  warna: widget.listSkuHeadersWarna[index].text,
                                  hargaC: widget.listSkuHeadersHarga[index],
                                  stockC: widget.listSkuHeadersStock[index],
                                );
                              })),
                    ),
                    const SizedBox(height: 100)
                  ],
                ),
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
        ),
      ),
    );
  }
}
