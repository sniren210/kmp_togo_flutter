import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/providers/ppob/provider_ppob_post.dart';
import 'package:sizer/sizer.dart';

class ListServiceWTNumber extends StatefulWidget {
  final String product_name;

  ListServiceWTNumber({Key? key, required this.product_name}) : super(key: key);

  @override
  State<ListServiceWTNumber> createState() => _ListServiceWTNumberState();
}

class _ListServiceWTNumberState extends State<ListServiceWTNumber> {
  final TextEditingController _cariC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProviderPostpaidProduct>(
      model: ProviderPostpaidProduct(Repository()),
      onModelReady: (model) => model.fetchPostPaidProduct(widget.product_name),
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
                          controller: _cariC,
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
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2.h),
                        child: model.busy
                            ? const Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: model.items!.data.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  if (_cariC.text.isNotEmpty) {
                                    if (model.items!.data[index].name
                                        .toLowerCase()
                                        .contains(_cariC.text.toLowerCase())) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: buildListProduct(model, index),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  }
                                  return buildListProduct(model, index);
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

  Widget buildListProduct(ProviderPostpaidProduct model, int index) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade500),
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pop(context, model.items!.data[index]);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 3.h),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Flexible(
                            child: Container(
                                margin: EdgeInsets.only(left: 3.w),
                                child: Text(model.items!.data[index].name)),
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
  }
}
