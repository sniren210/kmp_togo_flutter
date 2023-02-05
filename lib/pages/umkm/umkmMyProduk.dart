import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/cardmyproduk.dart';
import 'package:kmp_togo_mobile/pages/umkm/hapusproduk.dart';
import 'package:kmp_togo_mobile/pages/umkm/tambahprodukumkm.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';

import '../../models/product/product_model.dart';

class MyProduk extends StatefulWidget {
  MyProduk({Key? key}) : super(key: key);

  @override
  State<MyProduk> createState() => _MyProdukState();
}

class _MyProdukState extends State<MyProduk> {
  String productSelling = 'online';

  _navigateAndRefreshAddUpdate(BuildContext context, ProviderProduct model,
      bool isUpdate, Datum? data) async {
    // final result = await Get.to(() =>
    //     AddUpdateProductPage(product: model, isUpdate: isUpdate, data: data));
    final result = await Get.to(() =>
        AddUpdateProductPage2(model: model, isUpdate: isUpdate, data: data));
    if (result != null) {
      model.fetchAllProduct(
          productSelling); // call your own function here to refresh screen
    }
  }

  void _navigateAndRefreshDelete(
      BuildContext context, ProviderProduct model, int id) async {
    final result =
        await Get.to(() => HapusProduk(isUmkmProduct: true, id: id, name: ''));
    if (result != null) {
      model.fetchAllProduct(
          productSelling); // call your own function here to refresh screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProviderProduct>(
      model: ProviderProduct(Repository()),
      onModelReady: (model) => model.fetchAllProduct(productSelling),
      child: Container(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF85014e),
            elevation: 0,
            title: const Text("Produk Saya"),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 3.w, right: 3.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  model.busy
                      ? const Center(child: CircularProgressIndicator())
                      : Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: model.items!.data.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return CardMyProduk(
                                    id: model.items!.data[index].id,
                                    gambar: model.items!.data[index].imagePath,
                                    stock: model
                                        .items!.data[index].sku.first.stock,
                                    kodebarang: model
                                        .items!.data[index].sku.first.productId,
                                    productSelling:
                                        model.items!.data[index].productSelling,
                                    namaProduct: model.items!.data[index].name,
                                    warna: '',
                                    category:
                                        model.items!.data[index].category !=
                                                null
                                            ? model.items!.data[index].category!
                                                .name
                                            : '',
                                    moreSKU:
                                        model.items!.data[index].sku.length > 1,
                                    priceMinimal: model.items!.data[index].sku
                                        .reduce((curr, next) =>
                                            curr.price < next.price
                                                ? curr
                                                : next)
                                        .price,
                                    priceMaximal: model.items!.data[index].sku
                                        .reduce((curr, next) =>
                                            curr.price > next.price
                                                ? curr
                                                : next)
                                        .price,
                                    isContainsVariants:
                                        model.items!.data[index].sku.length > 1,
                                    skus: model.items!.data[index].sku,
                                    isToBuy: false,
                                    model: model,
                                    fn: _navigateAndRefreshDelete,
                                    fn2: _navigateAndRefreshAddUpdate);
                              })),
                ],
              ),
            ),
          ),
          bottomSheet: Wrap(
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
                            context, model, false, null);
                      },
                      child: Container(
                          width: context.width,
                          margin: EdgeInsets.only(left: 2.h, right: 2.w),
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context).primaryColor),
                          child: const Text(
                            'Buat Item Baru',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
