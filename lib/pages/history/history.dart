import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/models/history/modelhistory.dart';
import 'package:kmp_togo_mobile/pages/auth/dashboard/marketplacePage.dart';
import 'package:kmp_togo_mobile/pages/history/detail_history_ppob_new.dart';
import 'package:kmp_togo_mobile/pages/history/detailhistorynft.dart';
import 'package:kmp_togo_mobile/pages/history/detailhistoryumkm.dart';
import 'package:kmp_togo_mobile/pages/nft/dashboard_nft.dart';
import 'package:kmp_togo_mobile/pages/ppob/wtNumber/inputPpobWTNumber.dart';
import 'package:kmp_togo_mobile/providers/history/providerhistory.dart';
import 'package:provider/provider.dart';

class History extends StatefulWidget {
  String? search;

  History({Key? key, this.search, required this.jenisTransaksi});

  final String jenisTransaksi;

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with NumberFormatMachine {
  String? status;
  String? tanggal;
  String? pencarian;

  bool loading = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getData();
      // final _getkategoriProvider =
      //     Provider.of<ProviderHistory>(context, listen: false);
      // await _getkategoriProvider.getAllHistory(context);
      // setState(() {
      //   loading = _getkategoriProvider.loadingHistory;
      // });
    });
    super.initState();
  }

  getData() async {
    final getkategoriProvider =
        Provider.of<ProviderHistory>(context, listen: false);
    await getkategoriProvider.getAllHistory(context);
    setState(() {
      loading = getkategoriProvider.loadingHistory ?? false;
    });
  }

  getSelectDropdown(String? status, String? tanggala) async {
    if (status == "all") {
      getData();
    } else {
      final getkategoriProvider =
          Provider.of<ProviderHistory>(context, listen: false);
      await getkategoriProvider.getSelectDropdown(context, status, tanggal);
      setState(() {
        loading = getkategoriProvider.loadingHistory ?? false;
      });
    }
  }

  searchFitur() async {
    if (status == "all") {
      final getkategoriProvider =
          Provider.of<ProviderHistory>(context, listen: false);
      await getkategoriProvider.searchAllA(
          context, _cariC.text, status, tanggal);
      setState(() {
        loading = getkategoriProvider.loadingHistory ?? false;
      });
    } else {
      final getkategoriProvider =
          Provider.of<ProviderHistory>(context, listen: false);
      await getkategoriProvider.searchByText(
          context, _cariC.text, status, tanggal);
      setState(() {
        loading = getkategoriProvider.loadingHistory ?? false;
      });
    }
  }

  final TextEditingController _cariC = TextEditingController();

  dateConvert(date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Transaksi ${widget.jenisTransaksi}"),
          ),
          body: loading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<ProviderHistory>(
                  builder: (BuildContext context, v, Widget? child) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 14),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 12),
                                      child: TextField(
                                        controller: _cariC,
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          prefixIcon: Icon(
                                            Icons.search,
                                            size: 20,
                                          ),
                                          hintText: 'Cari Pembelian...',
                                          border: OutlineInputBorder(),
                                        ),
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      searchFitur();
                                    },
                                    child: CircleAvatar(
                                        backgroundColor:
                                            const Color(0xFF85014e),
                                        child: Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Icon(
                                              Icons.search,
                                              color: Colors.white,
                                            ))),
                                  ))
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSelectedItems: true,
                                    disabledItemFn: (String s) =>
                                        s.startsWith('I'),
                                  ),
                                  items: const [
                                    "done",
                                    "processing",
                                    "cancel",
                                    "paid",
                                    "all"
                                  ],
                                  dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      hintText: "-----",
                                      labelText: "Select Status",
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      status = value;
                                    });
                                    getSelectDropdown(status, tanggal);
                                  },
                                  // selectedItem: "done",
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSelectedItems: true,
                                    disabledItemFn: (String s) =>
                                        s.startsWith('I'),
                                  ),
                                  items: const [
                                    "Semua Tanggal Transaksi",
                                    "30 Hari Terakhir",
                                    "90 Hari Terakhir",
                                    "Atur Tanggal Sendiri",
                                  ],
                                  dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                        hintText: "----",
                                        labelText: "Select Tanggal"),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      tanggal = value;
                                    });
                                    if (tanggal == 'Atur Tanggal Sendiri') {
                                      klikBottom();
                                    } else {
                                      getSelectDropdown(status, tanggal);
                                    }
                                  },
                                  // selectedItem: "createdAt:desc",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, left: 8),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: v.dataAllHistory?.data?.length,
                              itemBuilder: (BuildContext context, int index) {
                                final nftTransaction = v.dataAllHistory
                                        ?.data?[index].nftTransaction ??
                                    NftTransaction();

                                final ppobTransaction = v.dataAllHistory
                                        ?.data?[index].ppobTransaction ??
                                    PpobTransaction();

                                final productOrder = v.dataAllHistory
                                        ?.data?[index].productOrder ??
                                    ProductOrder();

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: InkWell(
                                      // onTap: () {
                                      //   if (nftTransaction != null) {
                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) {
                                      //         return DetailHistoryNFT(
                                      //           title:
                                      //               nftTransaction.nft!.name ??
                                      //                   "",
                                      //           images: nftTransaction
                                      //                   .nft!.imagePath ??
                                      //               "",
                                      //           buyer_est: nftTransaction
                                      //               .nft!.qtyUnit
                                      //               .toString(),
                                      //           buyer: nftTransaction
                                      //               .nft!.avlUnit
                                      //               .toString(),
                                      //           expired: nftTransaction
                                      //               .nft!.expirationDate
                                      //               .toString(),
                                      //           lockNft: nftTransaction
                                      //               .nft!.holdLimitinDay
                                      //               .toString(),
                                      //           monthlyPercentage:
                                      //               nftTransaction
                                      //                   .nft!.monthlyPercentage
                                      //                   .toString(),
                                      //           nftSerialId: nftTransaction
                                      //               .nft!.nftId
                                      //               .toString(),
                                      //           priceCoins: nftTransaction
                                      //               .priceCoin!
                                      //               .toString(),
                                      //           gasfee: nftTransaction.gasFee!
                                      //               .toString(),
                                      //           admfee: nftTransaction.admFee!
                                      //               .toString(),
                                      //           deskripsi: nftTransaction
                                      //               .nft!.description
                                      //               .toString(),
                                      //           // owner: owner,
                                      //         );
                                      //       }),
                                      //     );
                                      //   } else if (ppobTransaction != null) {
                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) {
                                      //         return DetailHistoryPpobPage(
                                      //             title:
                                      //                 '${ppobTransaction.ppobType!.name} ${ppobTransaction.ppobMobileOperatorId.toString()}',
                                      //             customerId: ppobTransaction
                                      //                 .customerId,
                                      //             subTotal: ppobTransaction
                                      //                 .subTotal!
                                      //                 .toString(),
                                      //             status: ppobTransaction
                                      //                 .status!
                                      //                 .toString(),
                                      //             gasfee: ppobTransaction
                                      //                 .gasFee!
                                      //                 .toString(),
                                      //             total: ppobTransaction.total!
                                      //                 .toString(),
                                      //             date: ppobTransaction
                                      //                 .createdAt!
                                      //                 .toString(),
                                      //             noPesanan: ppobTransaction.id
                                      //                 .toString());
                                      //         // return DetailHistoryPPOB(
                                      //         //   title: ppobTransaction.ppobTypeId!
                                      //         //       .toString(),
                                      //         //   images: "",
                                      //         //   status: ppobTransaction.status!
                                      //         //       .toString(),
                                      //         //   ppobMobileOperatorId:
                                      //         //       ppobTransaction
                                      //         //           .ppobMobileOperatorId!
                                      //         //           .toString(),
                                      //         //   gasfee: ppobTransaction.gasFee!
                                      //         //       .toString(),
                                      //         //   subTotal: ppobTransaction
                                      //         //       .subTotal!
                                      //         //       .toString(),
                                      //         //   total: ppobTransaction.total!
                                      //         //       .toString(),
                                      //         //   // owner: owner,
                                      //         // );
                                      //       }),
                                      //     );
                                      //   } else if (productOrder != null) {
                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) {
                                      //         return DetailHistoryUMKM(
                                      //           title: productOrder
                                      //               .orders
                                      //               ?.first
                                      //               .orderItems
                                      //               ?.first
                                      //               .product
                                      //               ?.name
                                      //               .toString(),
                                      //           images: productOrder
                                      //               .orders
                                      //               ?.first
                                      //               .orderItems
                                      //               ?.first
                                      //               .product
                                      //               ?.imagePath
                                      //               .toString(),
                                      //           status: productOrder
                                      //               .orders?.first.status,
                                      //           deskripsi: productOrder
                                      //               .orders
                                      //               ?.first
                                      //               .orderItems
                                      //               ?.first
                                      //               .product
                                      //               ?.description
                                      //               .toString(),
                                      //           gasfee: productOrder.gasFee
                                      //               .toString(),
                                      //           subTotal: productOrder.subTotal
                                      //               .toString(),
                                      //           total: productOrder.total
                                      //               .toString(),

                                      //           admfee: productOrder.admFee
                                      //               .toString(),
                                      //           discount: productOrder.discount
                                      //               .toString(),
                                      //           // owner: owner,
                                      //         );
                                      //       }),
                                      //     );
                                      //   }
                                      // },
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return DetailHistoryNFT(
                                              title: "title",
                                              images: "image",
                                              buyer_est: "0987678909",
                                              buyer: "0978678900",
                                              expired: "expired",
                                              lockNft: "lockNFT",
                                              monthlyPercentage:
                                                  "monthlypercen",
                                              nftSerialId: "NFT serial Id",
                                              priceCoins: "Price coin",
                                              gasfee: "gassfee",
                                              admfee: "adm fee",
                                              deskripsi: "deskripsi",
                                              // owner: owner,
                                            );
                                          }),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration:
                                                          const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/logon.jpg'),
                                                        fit: BoxFit.fitHeight,
                                                      )),
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                    const HorizontalSpacer(
                                                        width: 10),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ppobTransaction != null
                                                            ? Text(
                                                                ppobTransaction
                                                                        .ppobType
                                                                        ?.name ??
                                                                    '',
                                                                style: TextStyling
                                                                    .w600bold16black)
                                                            : const Text(''),
                                                        productOrder != null
                                                            ? Text(
                                                                productOrder
                                                                        .orders
                                                                        ?.first
                                                                        .orderItems
                                                                        ?.first
                                                                        .product
                                                                        ?.name ??
                                                                    "",
                                                                style: TextStyling
                                                                    .w600bold16black)
                                                            : const Text(''),
                                                        nftTransaction != null
                                                            ? Text(
                                                                nftTransaction
                                                                        .nft
                                                                        ?.name ??
                                                                    '',
                                                                style: TextStyling
                                                                    .w600bold16black)
                                                            : const Text(''),
                                                        const VerticalSpacer(
                                                            height: 7),
                                                        const Text(
                                                            // dateConvert(
                                                            //   v
                                                            //           .dataAllHistory
                                                            //           ?.data?[
                                                            //               index]
                                                            //           .createdAt ??
                                                            //       '',
                                                            // ),
                                                            '2011-11-02T02:50:12.208Z',
                                                            style: TextStyling
                                                                .w40012black),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Card(
                                                  color: v
                                                              .dataAllHistory
                                                              ?.data?[index]
                                                              .status ==
                                                          'paid'
                                                      ? Colors.greenAccent
                                                      : v
                                                                  .dataAllHistory
                                                                  ?.data?[index]
                                                                  .status ==
                                                              'done'
                                                          ? Colors.greenAccent
                                                          : Colors.red,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8,
                                                        vertical: 8),
                                                    child: Text(
                                                        v
                                                                .dataAllHistory
                                                                ?.data?[index]
                                                                .status ??
                                                            '',
                                                        style: TextStyling
                                                            .w40012black),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const VerticalSpacer(height: 7),
                                            const Divider(
                                              color: Colors.grey,
                                              thickness: 1,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7.0,
                                                      horizontal: 2.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "Layanan Produk",
                                                    style:
                                                        TextStyling.w40014grey,
                                                  ),
                                                  const VerticalSpacer(
                                                      height: 10),

                                                  ppobTransaction != null
                                                      ? Text(
                                                          ppobTransaction
                                                              .ppobMobileOperatorId
                                                              .toString(),
                                                          style: TextStyling
                                                              .w600bold16black,
                                                        )
                                                      : const Text(''),
                                                  productOrder != null
                                                      ? Text(
                                                          productOrder
                                                                  .orders
                                                                  ?.first
                                                                  .orderItems
                                                                  ?.first
                                                                  .product
                                                                  ?.name ??
                                                              "",
                                                          style: TextStyling
                                                              .w600bold16black)
                                                      : const Text(''),
                                                  nftTransaction != null
                                                      ? Text(
                                                          nftTransaction.nft
                                                                  ?.status ??
                                                              '',
                                                          style: TextStyling
                                                              .w600bold16black)
                                                      : const Text(''),
                                                  // Text(
                                                  //   v
                                                  //       .dataAllHistory!
                                                  //       .data![index]
                                                  //       .ppobTransaction!
                                                  //       .ppobMobileOperatorId
                                                  //       .toString(),
                                                  //   style: TextStyling
                                                  //       .w600bold16black,
                                                  // ),
                                                ],
                                              ),
                                            ),
                                            const VerticalSpacer(height: 8),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7.0,
                                                      horizontal: 2.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        "Total Harga",
                                                        style: TextStyling
                                                            .w40014grey,
                                                      ),
                                                      const VerticalSpacer(
                                                          height: 10),
                                                      Text(
                                                        v
                                                                    .dataAllHistory
                                                                    ?.data![
                                                                        index]
                                                                    .nftTransactionId !=
                                                                null
                                                            ? "${v.dataAllHistory!.data![index].total} Coin"
                                                            : "${getNumberFormatSeparator(v.dataAllHistory?.data?[index].total ?? 0.0)} Poin",
                                                        style: TextStyling
                                                            .w600bold16black,
                                                      ),
                                                    ],
                                                  ),
                                                  //  v.dataAllHistory!.data![index].ppobTransaction

                                                  InkWell(
                                                    onTap: () {
                                                      if (nftTransaction !=
                                                          null) {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DashboardNFT()),
                                                        );
                                                      } else if (ppobTransaction !=
                                                          null) {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  InputPPOBWithoutNumber(
                                                                      title:
                                                                          'PLN',
                                                                      product_type:
                                                                          'pln')),
                                                        );
                                                      } else if (v
                                                              .dataAllHistory!
                                                              .data![index]
                                                              .productOrder !=
                                                          null) {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  MarketplacePage()),
                                                        );
                                                      }
                                                    },
                                                    child: Container(
                                                      height: 49.h,
                                                      width: 70.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: const Color(
                                                              0xFF85014e)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "Beli Lagi",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
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
                              }),
                        ),
                      ],
                    ),
                  );
                })),
    );
  }

  DateTime selectedDateAwal = DateTime.now();
  DateTime selectedDateAkhir = DateTime.now();

  klikBottom() {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            StatefulBuilder(
              builder: (BuildContext context, setState) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(27.0),
                        topRight: Radius.circular(27.0),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Center(
                        child: Container(
                          width: 25.w,
                          height: 1.h,
                          margin: EdgeInsets.only(top: 1.h),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const SizedBox(height: 4),
                      const Center(
                        child: Text('Atur Tanggal Sendiri',
                            style: TextStyling.w50018black),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 25),
                                const Text("Tanggal Awal"),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text("${selectedDateAwal.toLocal()}"
                                    .split(' ')[0]),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: selectedDateAwal,
                                            firstDate: DateTime(2015, 8),
                                            lastDate: DateTime(2101));
                                    if (picked != null &&
                                        picked != selectedDateAwal) {
                                      setState(() {
                                        selectedDateAwal = picked;
                                      });
                                    }
                                  },
                                  child: const Text('Select date'),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(height: 25),
                                const Text("Tanggal Akhir"),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text("${selectedDateAkhir.toLocal()}"
                                    .split(' ')[0]),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    final DateTime? picked =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: selectedDateAkhir,
                                            firstDate: DateTime(2015, 8),
                                            lastDate: DateTime(2101));
                                    if (picked != null &&
                                        picked != selectedDateAkhir) {
                                      setState(() {
                                        selectedDateAkhir = picked;
                                      });
                                    }
                                  },
                                  child: const Text('Select date'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 20),
                          child: ElevatedButton(
                            onPressed: () async {
                              tanggal =
                                  '${("${selectedDateAwal.toLocal()}".split(' ')[0])}:${("${selectedDateAkhir.toLocal()}".split(' ')[0])}';
                              getSelectDropdown(status, tanggal);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.search,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                const Text('Cari'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin:
                                const EdgeInsets.only(right: 20.0, left: 20.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 70),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xFF85014e)),
                            child: const Text(
                              'Tutup',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            )),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
