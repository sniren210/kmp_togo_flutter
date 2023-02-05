import 'package:badges/badges.dart' as Badge;
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/pages/auth/dashboard/detail_marketplace.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/cart/cart_screen.dart';
import 'package:kmp_togo_mobile/pages/common/cardmyproduk.dart';
import 'package:kmp_togo_mobile/providers/cart/cart_provider.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MarketplacePage extends StatefulWidget {
  MarketplacePage({Key? key}) : super(key: key);

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  String productSelling = 'online';

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
            title: const Text("Produk UMKM"),
            actions: [
              Consumer<CartProvider>(
                  builder: (context, value, child) {
                    if(value.getCounter() < 1){
                      return SizedBox(
                          width: 18,
                          child: IconButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const CartScreen()));
                              },
                              icon: const Icon(Icons.shopping_cart), color: Colors.white));
                    }
                    return Badge.Badge(
                      badgeContent: Text(
                        value.getCounter().toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      position: const Badge.BadgePosition(start: 30, bottom: 30),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartScreen()));
                        },
                        icon:
                        const Icon(Icons.shopping_cart, color: Colors.white),
                      ),
                    );
                  }
              ),
              const SizedBox(
                width: 20.0,
              ),
            ],
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
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: model.items!.data.length,
                              shrinkWrap: true,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return DetailMarketPlace(
                                          title: model.items!.data[index].name,
                                          images: model
                                              .items!.data[index].imagePath,
                                          rating:
                                              model.items!.data[index].rating,
                                          soldCount: model
                                              .items!.data[index].soldCount,
                                          priceCoins: model.items!.data[index]
                                              .sku.first.price,
                                          deskripsi:
                                              model.items!.data[index].name,
                                          skus: model.items!.data[index].sku,
                                        );
                                      }),
                                    );
                                  },
                                  child: CardMyProduk(
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
                                    model: model,
                                    isToBuy: true,
                                  ),
                                );
                              })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
