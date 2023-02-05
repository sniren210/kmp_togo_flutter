import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';

class KategoriSubUMKM extends StatefulWidget {
  KategoriSubUMKM({Key? key}) : super(key: key);

  @override
  State<KategoriSubUMKM> createState() => _KategoriSubUMKMState();
}

class _KategoriSubUMKMState extends State<KategoriSubUMKM> {
  List data = [
    {"1"},
    {"2"},
    {"3"},
    {"4"},
    {"5"},
    {"6"},
    {"7"},
    {"8"},
    {"9"},
    {"10"},
    {"1"},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF85014e),
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 3.w, right: 3.w),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 6.w,
                          ),
                          hintText: 'Cari Sub Kategori',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.h),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 10 / 2,
                            crossAxisCount: 1,
                            mainAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade500),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    String? kategori = 'Sub Kategori Produk 99';
                                    Navigator.pop(context, kategori);
                                  });
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 1.h, bottom: 1.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 3.w),
                                                      child: Text(
                                                          'Sub Kategori ${data[index]}')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Icon(
                                          //   Icons.token,
                                          //   size: 5.w,
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
