import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:sizer/sizer.dart';

import '../../models/product/product_model.dart';

class CardUMKMDashBoard extends StatelessWidget with NumberFormatMachine {
  int id;
  String? gambar;
  int? stock;
  int? kodebarang;
  String? productSelling;
  String? namaProduct;
  String? category;
  String? warna;
  bool? moreSKU;
  int? priceMinimal;
  int? priceMaximal;
  bool isContainsVariants;
  bool isToBuy;
  List<Sku>? skus;

  ProviderProduct? model;
  void Function(BuildContext context, ProviderProduct model, int id)? fn;
  void Function(BuildContext context, ProviderProduct model, bool isUpdate,
      Datum? data)? fn2;

  CardUMKMDashBoard({
    required this.id,
    this.gambar,
    this.stock,
    this.kodebarang,
    this.productSelling,
    this.namaProduct,
    this.category,
    this.warna,
    this.moreSKU,
    this.priceMinimal,
    this.priceMaximal,
    required this.isContainsVariants,
    required this.isToBuy,
    this.model,
    this.fn,
    this.fn2,
    this.skus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(gambar ?? kEmptyImageLink)))),
          ),
          Container(
            padding:
                EdgeInsets.only(top: 1.h, bottom: 1.h, left: 2.w, right: 2.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 2.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: category!.isNotEmpty
                            ? Theme.of(context).primaryColor
                            : Colors.grey),
                    child: Text(
                      category!.isNotEmpty ? category! : 'Uncategorized',
                      style: TextStyle(fontSize: 7.sp, color: Colors.white),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 1.5.h),
                  child: Text(
                    namaProduct ?? "",
                    style: TextStyle(color: Colors.black87, fontSize: 9.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Row(
                    children: [
                      Container(
                        width: 22,
                        height: 22,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/images/logon.jpg'))),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      moreSKU!
                          ? Expanded(
                              child: Text(
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 9.sp),
                                  '${getNumberFormatSeparator(priceMinimal!.toDouble())} - ${getNumberFormatSeparator(priceMaximal!.toDouble())} Poin'),
                            )
                          : Expanded(
                              child: Text(
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 9.sp),
                                  '${getNumberFormatSeparator(priceMinimal!.toDouble())} Poin'),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
