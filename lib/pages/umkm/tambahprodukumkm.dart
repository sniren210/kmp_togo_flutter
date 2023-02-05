import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kmp_togo_mobile/apis/product/category_api.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/models/product/category.dart';
import 'package:kmp_togo_mobile/models/product/sub_category.dart';
import 'package:kmp_togo_mobile/pages/common/buttons.dart';
import 'package:kmp_togo_mobile/pages/umkm/kategoriumkm.dart';
import 'package:kmp_togo_mobile/pages/umkm/subkategoriumkm.dart';
import 'package:kmp_togo_mobile/pages/umkm/tambahvariantumkm.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';
import '../../models/product/product_model.dart';

class AddUpdateProductPage2 extends StatefulWidget {
  ProviderProduct model;
  bool isUpdate;
  Datum? data;

  AddUpdateProductPage2(
      {super.key, required this.model, required this.isUpdate, this.data});

  @override
  State<AddUpdateProductPage2> createState() => _AddUpdateProductPage2State();
}

class _AddUpdateProductPage2State extends State<AddUpdateProductPage2>
    with NumberFormatMachine {
  ItemModelProductCategory? modelCategory;
  ItemModelProductSubCategory? modelSubCategory;

  String? Kategori;
  String? SubKategori;

  List<String> statusSelling = [
    "online",
    "offline",
  ];

  bool lookUpCategoryDone = false, lookUpSubCategoryDone = false;

  TextEditingController namaProdukC = TextEditingController(text: '');
  TextEditingController beratProdukC = TextEditingController(text: '');
  TextEditingController descProdukC = TextEditingController(text: '');

  bool isLoading = false;

  int categoryId = 0;
  int subCategoryId = 0;
  String selectedProductSelling = 'online';

  getAllCategory() async {
    modelCategory = await productCatSubApi.fetchAllCategory();

    setState(() {
      lookUpCategoryDone = true;
    });
  }

  getSubCategory(id) async {
    modelSubCategory = await productCatSubApi.fetchSubCategoryByCatId(id);

    setState(() {
      lookUpSubCategoryDone = true;
    });
  }

  @override
  void initState() {
    getAllCategory();

    if (widget.isUpdate) {
      setState(() {
        namaProdukC = TextEditingController(text: widget.data!.name);
        descProdukC = TextEditingController(text: widget.data!.description);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF85014e),
          elevation: 0,
          title: Text(widget.isUpdate ? "Edit Produk" : "Tambah Produk"),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(
                          controller: namaProdukC,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama produk tidak boleh kosong';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            prefixIcon: Icon(
                              Icons.shopping_bag,
                              size: 4.w,
                            ),
                            hintText: 'Nama Produk',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.only(top: 15),
                      //   child: TextFormField(
                      //     controller: descProdukC,
                      //     onTap: () async {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => KategoriUMKM()),
                      //       ).then((value) {
                      //         onGoBackCategory(value);
                      //       });
                      //     },
                      //     readOnly: true,
                      //     enableInteractiveSelection: false,
                      //     showCursor: true,
                      //     focusNode: AlwaysDisabledFocusNode(),
                      //     decoration: InputDecoration(
                      //       contentPadding:
                      //           const EdgeInsets.symmetric(vertical: 10),
                      //       prefixIcon: Icon(
                      //         Icons.phone_android_rounded,
                      //         size: 4.w,
                      //       ),
                      //       hintText: Kategori != null && Kategori != ''
                      //           ? Kategori
                      //           : 'Pilih Kategori',
                      //       border: const OutlineInputBorder(),
                      //       suffixIcon: const Icon(Icons.arrow_drop_down_sharp),
                      //     ),
                      //   ),
                      // ),
                      lookUpCategoryDone
                          ? Container(
                              padding: const EdgeInsets.only(top: 15),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  prefixIcon: Icon(
                                    Icons.phone_android_rounded,
                                    size: 4.w,
                                  ),
                                  hintText: Kategori != null && Kategori != ''
                                      ? Kategori
                                      : 'Pilih Kategori',
                                  border: const OutlineInputBorder(),
                                  suffixIcon:
                                      const Icon(Icons.arrow_drop_down_sharp),
                                ),
                                // validator: (Object? arg) =>
                                //     validateValue(cCorrType!.text.isEmpty ? true : false),
                                isExpanded: true,
                                icon: Container(),
                                value: Kategori,
                                items: modelCategory!.data.map((value) {
                                  return DropdownMenuItem(
                                    value: value.id,
                                    child: Text(value.name),
                                  );
                                }).toList(),
                                selectedItemBuilder: (context) =>
                                    modelCategory!.data
                                        .map((value) => Text(
                                              value.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ))
                                        .toList(),
                                onChanged: (value) async {
                                  setState(() {
                                    SubKategori = null;
                                    categoryId = int.parse(value.toString());
                                  });
                                  await getSubCategory(value);
                                },
                              ),
                            )
                          : Container(),
                      lookUpSubCategoryDone
                          ? Container(
                              padding: const EdgeInsets.only(top: 15),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  prefixIcon: Icon(
                                    Icons.phone_android_rounded,
                                    size: 4.w,
                                  ),
                                  hintText:
                                      SubKategori != null && SubKategori != ''
                                          ? SubKategori
                                          : 'Pilih Sub Kategori',
                                  border: const OutlineInputBorder(),
                                  suffixIcon:
                                      const Icon(Icons.arrow_drop_down_sharp),
                                ),
                                // validator: (Object? arg) =>
                                //     validateValue(cCorrType!.text.isEmpty ? true : false),
                                isExpanded: true,
                                icon: Container(),
                                value: SubKategori,
                                items: modelSubCategory!.data.map((value) {
                                  return DropdownMenuItem(
                                    value: value.id,
                                    child: Text(value.name),
                                  );
                                }).toList(),
                                selectedItemBuilder: (context) =>
                                    modelSubCategory!.data
                                        .map((value) => Text(
                                              value.name,
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ))
                                        .toList(),
                                onChanged: (value) async {
                                  setState(() {
                                    subCategoryId = int.parse(value.toString());
                                  });
                                },
                              ),
                            )
                          : Container(),
                      Container(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: beratProdukC,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Berat Barang (gram)';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            prefixIcon: Icon(
                              Icons.phone_android_rounded,
                              size: 4.w,
                            ),
                            hintText: 'Berat Barang (gram)',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: descProdukC,
                          maxLines: 5,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 3.w),
                            hintText: 'Masukkan Deskripsi',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.only(top: 20),
                      //   child: TextFormField(
                      //     controller: hargaProdukC,
                      //     keyboardType: TextInputType.number,
                      //     inputFormatters: [
                      //       FilteringTextInputFormatter.digitsOnly
                      //     ],
                      //     decoration: InputDecoration(
                      //       contentPadding: EdgeInsets.symmetric(vertical: 2.h),
                      //       prefixIcon: Icon(
                      //         Icons.monetization_on,
                      //         size: 4.w,
                      //       ),
                      //       hintStyle: TextStyle(fontSize: 10.sp),
                      //       hintText: 'Harga',
                      //       border: const OutlineInputBorder(),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
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
                            onTap: () {
                              setState(() {
                                isLoading = true;
                              });

                              if (namaProdukC.text.isEmpty ||
                                  descProdukC.text.isEmpty ||
                                  beratProdukC.text.isEmpty ||
                                  categoryId == 0 || subCategoryId == 0) {
                                customSnackbar(
                                    type: 'error',
                                    title: 'Field harus diisi',
                                    text: 'Data tidak boleh kosong');
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TambahVariantUMKM(
                                          model: widget.model,
                                          nameProduk: namaProdukC.text,
                                          descProduk: descProdukC.text,
                                          weight:
                                          int.parse(beratProdukC.text),
                                          categoryId: categoryId,
                                          subCategoryId: subCategoryId,
                                        )));
                              }
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
