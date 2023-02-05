import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/providers/ppob/provider_ppob_post.dart';
import 'package:sizer/sizer.dart';

class ListServiceWNumber extends StatefulWidget {
  const ListServiceWNumber({Key? key}) : super(key: key);

  @override
  State<ListServiceWNumber> createState() => _ListServiceWNumberState();
}

class _ListServiceWNumberState extends State<ListServiceWNumber> {
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
    return BaseWidget<ProviderPostpaidType>(
      model: ProviderPostpaidType(Repository()),
      onModelReady: (model) => model.fetchAllPostPaidType(),
      child: Container(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF85014e),
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
                              size: 4.w,
                            ),
                            hintText: 'Cari Layanan',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      model.busy
                          ? const CircularProgressIndicator()
                          : Container(
                              margin: EdgeInsets.only(top: 2.h),
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: data.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 10 / 2,
                                        crossAxisCount: 1,
                                        mainAxisSpacing: 10),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade500),
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context, data[index]);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.h, bottom: 1.h),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.w,
                                                                  vertical:
                                                                      3.h),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.amber,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          3.w),
                                                              child: Text(
                                                                  'Layanan Provider ${data[index]}')),
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
      ),
    );
  }
}
