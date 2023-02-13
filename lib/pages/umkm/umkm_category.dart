import 'package:badges/badges.dart' as Badge;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kmp_togo_mobile/pages/cart/cart_screen.dart';
import 'package:kmp_togo_mobile/pages/common/cardmitraketgori.dart';
import 'package:kmp_togo_mobile/providers/cart/cart_provider.dart';
import 'package:provider/provider.dart';

class UmkmCategory extends StatefulWidget {
  const UmkmCategory({super.key});

  @override
  State<UmkmCategory> createState() => _UmkmCategoryState();
}

class _UmkmCategoryState extends State<UmkmCategory> {
  List items = [
    [Colors.indigo, 'hasil pertanian'],
    [Colors.pink, 'hasil bumi'],
    [Colors.teal, 'kopi'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UMKM Kategori'),
        actions: [
          Consumer<CartProvider>(builder: (context, value, child) {
            if (value.getCounter() < 1) {
              return SizedBox(
                  width: 18,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartScreen()));
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
              position: const Badge.BadgePosition(start: 30, bottom: 30),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
              ),
            );
          }),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / .5,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: 28.w,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        items[index][0],
                      ],
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      items[index][1],
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
