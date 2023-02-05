import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/common/buttons.dart';
import 'package:kmp_togo_mobile/pages/umkm/tambahprodukdenganvariant.dart';
import 'package:kmp_togo_mobile/pages/umkm/tambahproduktanpavariant.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';

class TambahVariantUMKM extends StatefulWidget {
  ProviderProduct model;

  final String nameProduk;
  final String descProduk;
  final int weight;
  final int categoryId;
  final int subCategoryId;

  TambahVariantUMKM({
    super.key,
    required this.model,
    required this.nameProduk,
    required this.descProduk,
    required this.weight,
    required this.categoryId,
    required this.subCategoryId,
  });

  @override
  State<TambahVariantUMKM> createState() => _TambahVariantUMKMState();
}

class _TambahVariantUMKMState extends State<TambahVariantUMKM> {
  bool? tambahvariant = false;

  List<TextFormField> listTextFieldUkuran = [];
  List<TextFormField> listTextFieldWarna = [];

  List<TextEditingController>? varianUkuranC = [];
  List<TextEditingController>? varianWarnaC = [];
  List<TextEditingController>? varianHargaC = [];
  List<TextEditingController>? varianStockC = [];

  String selectedUkuran = 'Ukuran';
  String selectedWarna = 'Warna';

  @override
  void initState() {
    super.initState();
  }

  removeListview(int index) {
    setState(() {
      listTextFieldUkuran.removeAt(index);
      listTextFieldWarna.removeAt(index);
      varianUkuranC!.removeAt(index);
      varianWarnaC!.removeAt(index);
      varianHargaC!.removeAt(index);
      varianStockC!.removeAt(index);
    });

    if (listTextFieldUkuran.isEmpty) {
      tambahvariant = false;
    }
  }

  addListview() {
    setState(() {
      listTextFieldUkuran.add(
        TextFormField(),
      );
      listTextFieldWarna.add(
        TextFormField(),
      );

      varianUkuranC = List.generate(
          listTextFieldUkuran.length, (i) => TextEditingController());
      varianWarnaC = List.generate(
          listTextFieldUkuran.length, (i) => TextEditingController());
      varianHargaC = List.generate(
          listTextFieldUkuran.length, (i) => TextEditingController());
      varianStockC = List.generate(
          listTextFieldUkuran.length, (i) => TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF85014e),
          elevation: 0,
          title: const Text("Tambah Variant"),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        setState(() {
                          tambahvariant = true;
                          addListview();
                        });
                      },
                      child: Container(
                          width: context.width,
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.yellow),
                          child: const Text(
                            'Tambah Variant',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 18),
                    //   child: ListView.builder(
                    //       shrinkWrap: true,
                    //       physics: const NeverScrollableScrollPhysics(),
                    //       itemCount: listTextFieldUkuran.length,
                    //       itemBuilder: (context, index) {
                    //         return Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             SizedBox(height: 3.h),
                    //             Text('Jenis Varian ${index + 1}'),
                    //             Padding(
                    //               padding: const EdgeInsets.only(top: 10),
                    //               child: ListTile(
                    //                 contentPadding: EdgeInsets.zero,
                    //                 title: listTextFieldUkuran[index],
                    //                 trailing: ClipOval(
                    //                     child: InkWell(
                    //                   onTap: () {
                    //                     removeListview(index);
                    //                   },
                    //                   child: Container(
                    //                       padding: EdgeInsets.all(2.w),
                    //                       color: Colors.grey,
                    //                       child: const Icon(Icons.delete)),
                    //                 )),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: const EdgeInsets.only(top: 10),
                    //               child: ListTile(
                    //                 contentPadding: EdgeInsets.zero,
                    //                 title: listTextFieldWarna[index],
                    //                 trailing: ClipOval(
                    //                     child: InkWell(
                    //                   onTap: null,
                    //                   child: Container(
                    //                       padding: EdgeInsets.all(2.w),
                    //                       color: Colors.transparent,
                    //                       child: const Icon(Icons.delete,
                    //                           color: Colors.transparent)),
                    //                 )),
                    //               ),
                    //             ),
                    //           ],
                    //         );
                    //       }),
                    // ),
                    tambahvariant!
                        ? Column(
                            children: [
                              for (int i = 0; i < varianUkuranC!.length; i++)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 3.h),
                                    Text('Jenis Varian ${i + 1}'),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: TextFormField(
                                          controller: varianUkuranC![i],
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'jenis variant tidak boleh kosong';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10),
                                            prefixIcon: Icon(
                                              Icons.view_array,
                                              size: 4.w,
                                            ),
                                            hintText: selectedUkuran,
                                            border: const OutlineInputBorder(),
                                          ),
                                        ),
                                        trailing: ClipOval(
                                            child: InkWell(
                                          onTap: () {
                                            removeListview(i);
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(2.w),
                                              color: Colors.grey,
                                              child: const Icon(Icons.delete)),
                                        )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: TextFormField(
                                          controller: varianWarnaC![i],
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'jenis variant tidak boleh kosong';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10),
                                            prefixIcon: Icon(
                                              Icons.view_array,
                                              size: 4.w,
                                            ),
                                            hintText: selectedWarna,
                                            border: const OutlineInputBorder(),
                                          ),
                                        ),
                                        trailing: ClipOval(
                                            child: InkWell(
                                          onTap: null,
                                          child: Container(
                                              padding: EdgeInsets.all(2.w),
                                              color: Colors.transparent,
                                              child: const Icon(Icons.delete,
                                                  color: Colors.transparent)),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          )
                        : Container(),
                    const SizedBox(height: 100)
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
                            onTap: () async {
                              if (tambahvariant == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TambahProdukDenganVariant(
                                              title: 'Informasi Harga & Stok',
                                              listSkuHeadersUkuran:
                                                  varianUkuranC!,
                                              listSkuHeadersWarna:
                                                  varianWarnaC!,
                                              listSkuHeadersHarga:
                                                  varianHargaC!,
                                              listSkuHeadersStock:
                                                  varianStockC!,
                                              model: widget.model,
                                              nameProduk: widget.nameProduk,
                                              descProduk: widget.descProduk,
                                              weight: widget.weight,
                                              categoryId: widget.categoryId,
                                              subCategoryId:
                                                  widget.subCategoryId,
                                            )));
                              } else {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Wrap(
                                        children: [
                                          Container(
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
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                const SizedBox(height: 10),
                                                Center(
                                                  child: Container(
                                                    width: 25.w,
                                                    height: 1.h,
                                                    margin: EdgeInsets.only(
                                                        top: 1.h),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                const Text(
                                                  'Lanjutkan Tanpa Varian?',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyling.titleStyle,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.all(
                                                      20.0),
                                                  child: const Text(
                                                    'Apakah ingin melanjutkan tanpa varian barang lain?',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: InkWell(
                                                        onTap: () {
                                                          int count = 0;
                                                          Navigator.of(context)
                                                              .popUntil((_) =>
                                                                  count++ >= 1);
                                                        },
                                                        child: Container(
                                                            width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 10.0,
                                                                    left: 10.0),
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        15,
                                                                    horizontal:
                                                                        20),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: const Color(
                                                                    0xFF85014e)),
                                                            child: const Text(
                                                              'Batalkan',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize: 15),
                                                            )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          TambahProdukTanpaVariant(
                                                                            title:
                                                                                'Informasi Harga & Stok',
                                                                            model:
                                                                                widget.model,
                                                                            nameProduk:
                                                                                widget.nameProduk,
                                                                            descProduk:
                                                                                widget.descProduk,
                                                                            weight:
                                                                                widget.weight,
                                                                            categoryId:
                                                                                widget.categoryId,
                                                                            subCategoryId:
                                                                                widget.subCategoryId,
                                                                          )));
                                                        },
                                                        child: Container(
                                                            width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width,
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right: 10.0,
                                                                    left: 10.0),
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        15,
                                                                    horizontal:
                                                                        20),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: Colors
                                                                    .white),
                                                            child: Text(
                                                              'Lanjutkan',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize: 15),
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(height: 30),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    });
                              }

                              // int count = 0;
                              // Navigator.of(context)
                              //     .popUntil((_) => count++ >= 1);
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
