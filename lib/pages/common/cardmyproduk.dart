import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/pages/umkm/hapusproduk.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/ui_helper/textStyling.dart';
import '../../models/product/product_model.dart';

class CardMyProduk extends StatefulWidget {
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

  @override
  State<CardMyProduk> createState() => _CardMyProdukState();

  CardMyProduk({
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
}

class _CardMyProdukState extends State<CardMyProduk> with NumberFormatMachine {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                widget.gambar ?? kEmptyImageLink)))),
                widget.stock! < 1
                    ? Container(
                        margin: EdgeInsets.only(top: 5, left: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.red.shade900,
                            borderRadius: BorderRadius.circular(2)),
                        child: Text(
                          'Stock habis',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(top: 1.h, bottom: 1.h, left: 2.w, right: 2.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.5.h, horizontal: 2.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: widget.category!.isNotEmpty
                              ? Theme.of(context).primaryColor
                              : Colors.grey),
                      child: Text(
                        widget.category!.isNotEmpty
                            ? widget.category!
                            : 'Uncategorized',
                        style: TextStyle(fontSize: 9.sp, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.5.h),
                  child: Text(
                    widget.namaProduct ?? '',
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
                      widget.moreSKU!
                          ? Expanded(
                              child: Text(
                                '${getNumberFormatSeparator(widget.priceMinimal!.toDouble())} - ${getNumberFormatSeparator(widget.priceMaximal!.toDouble())} Poin',
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 9.sp),
                              ),
                            )
                          : Expanded(
                              child: Text(
                                '${getNumberFormatSeparator(widget.priceMinimal!.toDouble())} Poin',
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 9.sp),
                              ),
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
