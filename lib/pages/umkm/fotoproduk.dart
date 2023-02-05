import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/models/product/productSKU_model.dart';
import 'package:kmp_togo_mobile/pages/common/buttons.dart';
import 'package:kmp_togo_mobile/pages/common/splashPage.dart';
import 'package:kmp_togo_mobile/pages/umkm/umkmMyProduk.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';
import '../../models/product/product_model.dart';

class FotoProduk extends StatefulWidget {
  ProviderProduct product;
  bool isUpdate, isWithVariant;
  Datum? data;
  String selectedProductSelling;

  final String nameProduk;
  final String descProduk;
  final int categoryId;
  final int subCategoryId;
  final int? hargaProduk;
  final int? stokProduk;
  final int weight;
  final List<ItemModelProductSKU>? sku;

  FotoProduk(
      {super.key,
      required this.product,
      required this.isUpdate,
      required this.isWithVariant,
      required this.selectedProductSelling,
      required this.nameProduk,
      required this.descProduk,
      required this.categoryId,
      required this.subCategoryId,
      this.hargaProduk,
      this.stokProduk,
      required this.weight,
      this.sku,
      this.data});

  @override
  State<FotoProduk> createState() => _FotoProdukState();
}

class _FotoProdukState extends State<FotoProduk> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF85014e),
          elevation: 0,
          title: const Text("Foto Produk"),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 1.h),
                      child: Text('Foto Produk',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w600)),
                    ),
                    Container(
                      //show captured image
                      child: image == null
                          ? InkWell(
                              onTap: () {
                                pickImage();
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade500,
                                      borderRadius: BorderRadius.circular(4)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.h, horizontal: 3.w),
                                  margin: EdgeInsets.symmetric(vertical: 2.h),
                                  child: const Text("Add image captured")))
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 2.h,
                              ),
                              child: Image.file(
                                File(image!.path),
                                height: 12.h,
                              ),
                            ),
                      //display captured image
                    )
                  ],
                ),
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
                            onTap: image == null
                                ? null
                                : () async {
                              final SharedPreferencesManager sharedPreferencesManager =
                              locator<SharedPreferencesManager>();

                                    // if (widget.isWithVariant) {
                                    //   await Provider.of<
                                    //               ProviderCreateProductWithoutVariant>(
                                    //           context,
                                    //           listen: false)
                                    //       .createProductWtVariant(
                                    //           widget.isUpdate,
                                    //           widget.isUpdate ? 0 : 0,
                                    //           sharedPreferencesManager
                                    //               .getInt('ownerId'),
                                    //           widget.data!.name,
                                    //           widget.data!.description,
                                    //           500,
                                    //           100,
                                    //           widget.selectedProductSelling,
                                    //           widget.isUpdate
                                    //               ? widget.product.items!.data.first
                                    //                   .imagePath
                                    //               : image!.path);
                                    // } else {
                                    //   await Provider.of<
                                    //               ProviderCreateProductWithVariant>(
                                    //           context,
                                    //           listen: false)
                                    //       .createProduct(
                                    //           widget.isUpdate,
                                    //           widget.isUpdate ? 0 : 0,
                                    //           sharedPreferencesManager
                                    //               .getInt('ownerId'),
                                    //           widget.nameProduk,
                                    //           widget.descProduk,
                                    //           widget.hargaProduk,
                                    //           '',
                                    //           widget.selectedProductSelling,
                                    //           widget.isUpdate
                                    //               ? widget.product.items!.data.first
                                    //                   .imagePath
                                    //               : image!.path);
                                    // }

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SplashPage(
                                            pinValue: sharedPreferencesManager
                                                .getString(
                                                SharedPreferencesManager
                                                    .pin) ??
                                                '',
                                                title: 'Berhasil Menambahkan',
                                                subtitle: '',
                                                provRepo: widget.isWithVariant
                                                    ? 'product_w_variant'
                                                    : 'product_wt_variant',
                                                nextPage: MyProduk(),
                                                isReplace: true,
                                                isUpdate: widget.isUpdate,
                                                data: null,
                                                pm_nameProduk:
                                                    widget.nameProduk,
                                                pm_descProduk:
                                                    widget.descProduk,
                                                pm_hargaProduk:
                                                    widget.hargaProduk ?? 0,
                                                pm_stokProduk:
                                                    widget.stokProduk ?? 0,
                                                pm_weight: widget.weight,
                                                pm_categoryId:
                                                    widget.categoryId,
                                                pm_subCategoryId:
                                                    widget.subCategoryId,
                                                pm_selectedProductSelling:
                                                    widget
                                                        .selectedProductSelling,
                                                product: widget.product,
                                                pm_image: image,
                                                sku: widget.isWithVariant
                                                    ? widget.sku
                                                    : null,
                                              )),
                                    );
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
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
