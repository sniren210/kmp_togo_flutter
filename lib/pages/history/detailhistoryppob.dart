import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/nft/nft_components.dart';
import 'package:kmp_togo_mobile/pages/nft/payments_nft.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:provider/provider.dart';

class DetailHistoryPPOB extends StatefulWidget {
  String? title, status, images, ppobMobileOperatorId, subTotal, total, gasfee;

  DetailHistoryPPOB(
      {this.title,
      this.status,
      this.images,
      this.ppobMobileOperatorId,
      this.subTotal,
      this.total,
      this.gasfee});

  @override
  State<DetailHistoryPPOB> createState() => _DetailHistoryPPOBState();
}

class _DetailHistoryPPOBState extends State<DetailHistoryPPOB>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool? loading = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  dateConvert(date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderNft>(
          builder: (BuildContext context, v, Widget? Child) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              title: Text(widget.title!),
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 200,
                  width: double.maxFinite,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.images ?? kEmptyImageLink),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SliverLayoutBuilder(builder: (_, _sliver) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: const Color(0xFF85014e),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Text('Status : ${widget.status}',
                                      style: TextStyling.w40014white),
                                ),
                              ),
                              const VerticalSpacer(height: 8),
                              // Row(
                              //   children: [
                              //     const Padding(
                              //       padding: EdgeInsets.only(right: 8.0),
                              //       child: CircleAvatar(
                              //         radius: 15,
                              //         child: CircleAvatar(
                              //             radius: 15,
                              //             backgroundImage: AssetImage(
                              //                 'assets/images/bg1024.png')),
                              //         // 'assets/images/White-1024.png')),
                              //       ),
                              //     ),
                              //     Text(' ${widget.status}',
                              //         style: TextStyling.w60020black),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpacer(height: 8),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const VerticalSpacer(height: 8),
                              const Text('Informasi Utama',
                                  style: TextStyling.w600bold16black),
                              const VerticalSpacer(height: 18),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text('Operator',
                                          style: TextStyling.w40014black),
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(left: 8.0),
                                      //   child: Container(
                                      //       width: 22,
                                      //       height: 22,
                                      //       decoration: const BoxDecoration(
                                      //           image: DecorationImage(
                                      //               fit: BoxFit.contain,
                                      //               image: AssetImage(
                                      //                   'assets/images/logon.jpg')))),
                                      // )
                                    ],
                                  ),
                                  Text(widget.ppobMobileOperatorId ?? "")
                                  // ignore: dead_code
                                ],
                              ),
                              const VerticalSpacer(height: 18),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('Gasfee',
                                          style: TextStyling.w40014black),
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(left: 8.0),
                                      //   child: Container(
                                      //       width: 22,
                                      //       height: 22,
                                      //       decoration: const BoxDecoration(
                                      //           image: DecorationImage(
                                      //               fit: BoxFit.contain,
                                      //               image: AssetImage(
                                      //                   'assets/images/logon.jpg')))),
                                      // )
                                    ],
                                  ),
                                  Text(widget.gasfee ?? "",
                                      style: TextStyling.w40014black),
                                ],
                              ),
                              const VerticalSpacer(height: 18),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('Subtotal',
                                          style: TextStyling.w40014black),
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(left: 8.0),
                                      //   child: Container(
                                      //       width: 22,
                                      //       height: 22,
                                      //       decoration: const BoxDecoration(
                                      //           image: DecorationImage(
                                      //               fit: BoxFit.contain,
                                      //               image: AssetImage(
                                      //                   'assets/images/logon.jpg')))),
                                      // )
                                    ],
                                  ),
                                  Text(widget.subTotal ?? "",
                                      style: TextStyling.w40014black),
                                ],
                              ),
                              const VerticalSpacer(height: 18),
                              Divider(),
                              const VerticalSpacer(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('Total',
                                          style: TextStyling.w40014black),
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(left: 8.0),
                                      //   child: Container(
                                      //       width: 22,
                                      //       height: 22,
                                      //       decoration: const BoxDecoration(
                                      //           image: DecorationImage(
                                      //               fit: BoxFit.contain,
                                      //               image: AssetImage(
                                      //                   'assets/images/logon.jpg')))),
                                      // )
                                    ],
                                  ),
                                  Text(widget.total ?? "",
                                      style: TextStyling.w40014black),
                                ],
                              ),
                              const VerticalSpacer(height: 8),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpacer(height: 8),
                    ],
                  );
                },
                childCount: 1,
              ));
            })
          ],
        );
      }),
    );
  }
}
