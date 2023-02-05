import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/models/product/product_model.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/cardprodusenmyproduk.dart';
import 'package:kmp_togo_mobile/pages/produsennft/addUpdateProdukPage.dart';
import 'package:kmp_togo_mobile/pages/produsennft/widgetnftprodusen/detailnftprodusenusaha.dart';
import 'package:kmp_togo_mobile/pages/umkm/hapusproduk.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProdusenMyProduk extends StatefulWidget {
  int? storeId;
  ProdusenMyProduk({this.storeId});

  @override
  State<ProdusenMyProduk> createState() => _ProdusenMyProdukState();
}

class _ProdusenMyProdukState extends State<ProdusenMyProduk> {
  // String productSelling = 'offline';

  // _navigateAndRefreshAddUpdate(BuildContext context, ProviderProduct model,
  //     bool isUpdate, Datum? data) async {
  //   final result = await Get.to(() =>
  //       AddUpdateProductPage(product: model, isUpdate: isUpdate, data: data));
  //   if (result != null) {
  //     model.fetchAllProduct(
  //         productSelling); // call your own function here to refresh screen
  //   }
  // }

  // void _navigateAndRefreshDelete(
  //     BuildContext context, ProviderProduct model, int id) async {
  //   final result = await Get.to(() => HapusProduk(id: id));
  //   if (result != null) {
  //     model.fetchAllProduct(
  //         productSelling); // call your own function here to refresh screen
  //   }
  // }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final _getkategoriProvider =
          Provider.of<ProviderNft>(context, listen: false);
      await _getkategoriProvider.getNftItemProduct(context, widget.storeId);
      setState(() {
        loading = _getkategoriProvider.statusNFTItemProdusen;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  bool? loading = true;

  // getItemroduct() async {
  //   final _getkategoriProvider =
  //       Provider.of<ProviderNft>(context, listen: false);
  //   await _getkategoriProvider.getNftItemProduct(context, 'usaha');
  //   setState(() {
  //     loading = _getkategoriProvider.statusNFTProdusenUsaha;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print('${widget.storeId} saya');
    return Consumer<ProviderNft>(
        builder: (BuildContext context, v, Widget? child) {
      return SafeArea(
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
                  loading == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: v.dataNFTItemProdusen?.data?.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                print(
                                    '${v.dataNFTItemProdusen?.data?.length} panjangnya');
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return DetailProduusenUsaha(
                                        title: v.dataNFTItemProdusen
                                            ?.data?[index].name,
                                        images: v.dataNFTItemProdusen
                                            ?.data?[index].imagePath,
                                        // buyer_est:  v.dataNFTItemProdusen
                                        //   ?.data?[index].imagePath,
                                        // buyer: v.dataNFTItemProdusen
                                        //     ?.data?[index].imagePath,

                                        priceCoins: v.dataNFTItemProdusen
                                            ?.data?[index].sku?.first.price,
                                        selling: v.dataNFTItemProdusen
                                            ?.data?[index].productSelling,
                                        deskripsi: v.dataNFTItemProdusen
                                            ?.data?[index].description,
                                        storeId: v.dataNFTItemProdusen
                                            ?.data?[index].storeId,
                                        long: v.dataNFTItemProdusen
                                            ?.data?[index].store?.longitude,
                                        lat: v.dataNFTItemProdusen?.data?[index]
                                            .store?.latitude,
                                        namastore: v.dataNFTItemProdusen
                                            ?.data?[index].store?.name,
                                        // gasfee: widget.gasfee,
                                        // admfee: widget.admfee,
                                      );
                                    }));
                                  },
                                  child: CardProdusenMyProduk(
                                    storeId: widget.storeId,
                                    id: v.dataNFTItemProdusen?.data?[index].id,
                                    deskirpsi: v.dataNFTItemProdusen
                                        ?.data?[index].description,
                                    gambar: v.dataNFTItemProdusen?.data?[index]
                                        .imagePath,
                                    productSelling: v.dataNFTItemProdusen
                                        ?.data?[index].productSelling,
                                    namaProduct: v
                                        .dataNFTItemProdusen?.data?[index].name,
                                    price: v.dataNFTItemProdusen?.data?[index]
                                        .sku?.first.price,
                                    category: v.dataNFTItemProdusen
                                        ?.data?[index].sku?.first.id,
                                  ),
                                );
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
                        Get.to(() => AddUpdateProductPage(
                          isUpdate: true,
                          storeId: widget.storeId,
                        ));
                        // await _navigateAndRefreshAddUpdate(
                        //     context, model, false, null);
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
      );
    });
  }
}
