import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/pages/produsennft/updateprodukitem.dart';
import 'package:kmp_togo_mobile/pages/umkm/hapusproduk.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/ui_helper/textStyling.dart';
import '../../models/product/product_model.dart';

class CardProdusenMyProduk extends StatefulWidget {
  int? id;
  String? gambar;
  String? productSelling;
  String? namaProduct;
  String? deskirpsi;
  int? price, category;
  int? storeId;

  // void Function(BuildContext context, ProviderProduct model, int id)? fn;
  // void Function(BuildContext context, ProviderProduct model, bool isUpdate,
  // Datum? data)? fn2;

  CardProdusenMyProduk(
      {required this.id,
      this.gambar,
      this.productSelling,
      this.namaProduct,
      required this.price,
      required this.deskirpsi,
      this.category,
      this.storeId

      // this.fn,
      // this.fn2,
      });

  @override
  State<CardProdusenMyProduk> createState() => _CardProdusenMyProdukState();
}

class _CardProdusenMyProdukState extends State<CardProdusenMyProduk>
    with NumberFormatMachine {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade500),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.6.h),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              NetworkImage(widget.gambar ?? kEmptyImageLink)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.5.h, horizontal: 2.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: const Color(0xFF85014e)),
                                margin: EdgeInsets.only(left: 3.w),
                                child: Text(
                                  widget.productSelling ?? "",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )),
                            const Spacer(),
                            ClipOval(
                                child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Wrap(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.w),
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(27.0),
                                                  topRight:
                                                      Radius.circular(27.0),
                                                )),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                const SizedBox(height: 10),
                                                const Divider(
                                                  color: Color.fromRGBO(
                                                      88, 93, 93, 1),
                                                  height: 20,
                                                  thickness: 7,
                                                  indent: 140,
                                                  endIndent: 140,
                                                ),
                                                SizedBox(height: 2.h),
                                                const Text('Opsi Lain',
                                                    style: TextStyling
                                                        .w50018black),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => UpdateProductPage(
                                                              storeId:
                                                                  widget.id,
                                                              namaProduk: widget
                                                                  .namaProduct,
                                                              deskripsi: widget
                                                                  .deskirpsi,
                                                              imagesGet:
                                                                  widget.gambar,
                                                              price:
                                                                  widget.price,
                                                              statusSelling: widget
                                                                  .productSelling,
                                                              category: this
                                                                  .widget
                                                                  .category)),
                                                    );

                                                    // widget.fn2!(
                                                    //     context,
                                                    //     widget.model!,
                                                    //     true,
                                                    //     widget
                                                    //         .model!.items!.data
                                                    //         .where((element) =>
                                                    //             element.id ==
                                                    //             widget.id)
                                                    //         .first);
                                                  },
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 2.w, top: 4.h),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.grey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1.w),
                                                            child: const Icon(
                                                              Icons.edit,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 2.w,
                                                          ),
                                                          const Text(
                                                              'Edit Produk'),
                                                        ],
                                                      )),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HapusProduk(
                                                                  isUmkmProduct:
                                                                      false,
                                                                  id: widget.id,
                                                                  name: widget
                                                                          .namaProduct ??
                                                                      '')),
                                                    );

                                                    // widget.fn!(
                                                    //     context,
                                                    //     widget.model!,
                                                    //     widget.id);
                                                  },
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 2.w, top: 2.h),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    Colors.grey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1.w),
                                                            child: const Icon(
                                                              Icons.close,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 2.w,
                                                          ),
                                                          const Text(
                                                              'Hapus Produk'),
                                                        ],
                                                      )),
                                                ),
                                                SizedBox(height: 5.h),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                  color: const Color(0xFF85014e),
                                  child: const Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  )),
                            ))
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 2.5.w, top: 0.5.h),
                            child: Text(
                              widget.namaProduct ?? "",
                              style: TextStyle(fontSize: 10.sp),
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 2.w, top: 0.5.h),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(getNumberFormatSeparator(
                                    widget.price!.toDouble())),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
