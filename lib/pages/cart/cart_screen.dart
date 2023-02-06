import 'dart:async';
import 'package:badges/badges.dart' as Badge;
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/models/product/productCart_model.dart';
import 'package:kmp_togo_mobile/pages/auth/dashboard/marketplace_inquiryPage.dart';
import 'package:kmp_togo_mobile/providers/cart/cart_provider.dart';
import 'package:kmp_togo_mobile/providers/database/database.dart';
import 'package:kmp_togo_mobile/providers/product/provider_product.dart';
import 'package:kmp_togo_mobile/utils/createExcel.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with NumberFormatMachine {
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  bool isHomeLoading = true;

  startHome() {
    var duration = const Duration(milliseconds: 500);
    return Timer(duration, handleDashboard);
  }

  void handleDashboard() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      context.read<CartProvider>().getData(
          sharedPreferencesManager.getInt(SharedPreferencesManager.userId));
    });

    setState(() {
      isHomeLoading = false;
    });
  }

  @override
  void initState() {
    startHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Keranjang Saya'),
        actions: [
          isHomeLoading
              ? CircularProgressIndicator()
              : AbsorbPointer(
                  absorbing: false,
                  child:
                      Consumer<CartProvider>(builder: (context, value, child) {
                    if (value.getCounter() < 1) {
                      return SizedBox(
                          width: 18,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        DriftDbViewer(AppDb())));
                              },
                              icon: const Icon(Icons.shopping_cart),
                              color: Colors.white));
                    }
                    return Badge.Badge(
                      badgeContent: Text(
                        value.getCounter().toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      position:
                          const Badge.BadgePosition(start: 30, bottom: 30),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DriftDbViewer(AppDb())));
                        },
                        icon: const Icon(Icons.shopping_cart,
                            color: Colors.white),
                      ),
                    );
                  }),
                ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartProvider>(
              builder: (BuildContext context, provider, widget) {
                if (provider.cart.isEmpty) {
                  return const Center(
                      child: Text(
                    'Keranjang Anda kosong',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ));
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.cart.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.blueGrey.shade200,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image(
                                      height: 80,
                                      width: 80,
                                      image: NetworkImage(
                                          provider.cart[index].image ??
                                              kEmptyImageLink),
                                    ),
                                    const HorizontalSpacer(width: 10),
                                    SizedBox(
                                      width: 130,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 5.0,
                                          ),
                                          RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            text: TextSpan(
                                                text: '',
                                                style: TextStyle(
                                                    color: Colors
                                                        .blueGrey.shade800,
                                                    fontSize: 16.0),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          '${provider.cart[index].productName}\n',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ]),
                                          ),
                                          RichText(
                                            maxLines: 1,
                                            text: TextSpan(
                                                text: 'Stock: ',
                                                style: TextStyle(
                                                    color: Colors
                                                        .blueGrey.shade800,
                                                    fontSize: 16.0),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          '${provider.cart[index].unitTag}\n',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ]),
                                          ),
                                          RichText(
                                            maxLines: 1,
                                            text: TextSpan(
                                                text: 'Harga: ',
                                                style: TextStyle(
                                                    color: Colors
                                                        .blueGrey.shade800,
                                                    fontSize: 16.0),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          '${getNumberFormatSeparator(provider.cart[index].productPrice!.toDouble())} Poin',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PlusMinusButtons(
                                      addQuantity: () {
                                        cart.addQuantity(
                                            provider.cart[index].id);
                                        AppDb()
                                            .updateQuantity(CartData(
                                                id: provider.cart[index].id,
                                                userId: sharedPreferencesManager
                                                    .getInt(
                                                        SharedPreferencesManager
                                                            .userId)!,
                                                productId: provider
                                                    .cart[index].productId,
                                                productName: provider
                                                    .cart[index].productName,
                                                initialPrice: provider
                                                    .cart[index].initialPrice,
                                                productPrice: provider
                                                    .cart[index].productPrice,
                                                quantity: ValueNotifier(provider
                                                        .cart[index].quantity!)
                                                    .value,
                                                // quantity:
                                                //     provider.cart[index].quantity,
                                                unitTag: provider
                                                    .cart[index].unitTag,
                                                image:
                                                    provider.cart[index].image))
                                            .then((value) {
                                          setState(() {
                                            cart.addTotalPrice(double.parse(
                                                provider
                                                    .cart[index].productPrice
                                                    .toString()));
                                          });
                                        });
                                      },
                                      deleteQuantity: () {
                                        cart.deleteQuantity(
                                            provider.cart[index].id);
                                        cart.removeTotalPrice(double.parse(
                                            provider.cart[index].productPrice
                                                .toString()));
                                      },
                                      text: provider.cart[index].quantity
                                          .toString(),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          AppDb().deleteCartItem(
                                              provider.cart[index].id);
                                          provider.removeItem(
                                              provider.cart[index].id);
                                          provider.removeCounter();
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red.shade800,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ),
          Consumer<CartProvider>(
            builder: (BuildContext context, value, Widget? child) {
              final ValueNotifier<int?> totalPrice = ValueNotifier(null);
              for (var element in value.cart) {
                totalPrice.value = (element.productPrice! * element.quantity!) +
                    (totalPrice.value ?? 0);
              }
              return Column(
                children: [
                  ValueListenableBuilder<int?>(
                      valueListenable: totalPrice,
                      builder: (context, val, child) {
                        return ReusableWidget(
                            title: 'Total',
                            value: getNumberFormatSeparator(
                                val != null ? val.toDouble() : 0.0));
                      }),
                ],
              );
            },
          )
        ],
      ),
      bottomNavigationBar: Consumer<CartProvider>(
          builder: (BuildContext context, provider, widget) {
        return InkWell(
          onTap: () {
            List<ItemProductCart> items = [];
            for (var element in provider.cart) {
              items.add(ItemProductCart(
                  sku: [
                    {"skuId": element.productId, "qty": element.quantity}
                  ],
                  storeId: 1,
                  shipping: Shipping(
                    addressBookId: 1,
                    code: 'jnt',
                  )));
            }

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return MarketplaceInquiryPage(
                  isFromCart: true,
                  itemsCart: items,
                );
              }),
            );

            providerProduct.buyProductInquiryCart(items);

            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(
            //     content: Text('Payment Successful'),
            //     duration: Duration(seconds: 2),
            //   ),
            // );
          },
          child: Container(
            color: Colors.yellow.shade600,
            alignment: Alignment.center,
            height: 50.0,
            child: const Text(
              'Proses Pembayaran',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),
    );
  }
}

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;
  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
        Text(text),
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({Key? key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
