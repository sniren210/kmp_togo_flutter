import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/nft/nft_components.dart';
import 'package:kmp_togo_mobile/pages/nft/payments_nft.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:provider/provider.dart';

class DetailNFT extends StatefulWidget {
  String? title,
      category,
      images,
      expired,
      nftSerialId,
      buyer,
      buyer_est,
      monthlyPercentage,
      priceCoins,
      lockNft,
      gasfee,
      deskripsi,
      owner,
      admfee;

  DetailNFT(
      {required this.images,
      required this.title,
      required this.buyer_est,
      this.monthlyPercentage,
      this.expired,
      this.priceCoins,
      this.lockNft,
      this.buyer,
      this.nftSerialId,
      this.gasfee,
      this.deskripsi,
      this.owner,
      this.admfee});

  late int pembeli = int.parse(buyer_est!) - int.parse(buyer!);

  @override
  State<DetailNFT> createState() => _DetailNFTState();
}

class _DetailNFTState extends State<DetailNFT> with TickerProviderStateMixin {
  late ScrollController _scrollController;
  bool? loading = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.owner != null) {
        print('${widget.owner}');
        final _getkategoriProvider =
            Provider.of<ProviderNft>(context, listen: false);
        await _getkategoriProvider.getNFTbyId(context, widget.nftSerialId);
        setState(() {
          loading = _getkategoriProvider.loadinggetNFTId;
        });
      } else {}
    });
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
    print(widget.priceCoins);
    print(widget.monthlyPercentage);
    print(widget.pembeli);
    return Scaffold(
      body: loading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<ProviderNft>(
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
                    title:
                        Text(v.dataAllNFTid?.data?.nft?.name ?? widget.title!),
                    expandedHeight: 200.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        height: 200,
                        width: double.maxFinite,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.images!),
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
                                        child: Text(
                                            "${widget.buyer_est} / ${widget.pembeli}  Pembeli",
                                            style: TextStyling.w40014white),
                                      ),
                                    ),
                                    const VerticalSpacer(height: 8),
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: CircleAvatar(
                                            radius: 15,
                                            child: CircleAvatar(
                                                radius: 15,
                                                backgroundImage: AssetImage(
                                                    'assets/images/bg1024.png')),
                                            // 'assets/images/White-1024.png')),
                                          ),
                                        ),
                                        Text(' ${widget.priceCoins} Coin',
                                            style: TextStyling.w60020black),
                                      ],
                                    ),
                                    // : Row(
                                    //     children: [
                                    //       const Padding(
                                    //         padding:
                                    //             EdgeInsets.only(right: 8.0),
                                    //         child: CircleAvatar(
                                    //           radius: 15,
                                    //           child: CircleAvatar(
                                    //               radius: 15,
                                    //               backgroundImage: AssetImage(
                                    //                   'assets/images/bg1024.png')),
                                    //           // 'assets/images/White-1024.png')),
                                    //         ),
                                    //       ),
                                    //       Text(' ${widget.priceCoins} Coin',
                                    //           style:
                                    //               TextStyling.w60020black),
                                    //     ],
                                    //   ),
                                    const VerticalSpacer(height: 12),
                                    v.dataAllNFTid?.data?.nft?.name == null
                                        ? Text(
                                            v.dataAllNFTid?.data?.nft?.name ??
                                                "",
                                            style: TextStyling.w600bold16black)
                                        : Text(widget.title!,
                                            style: TextStyling.w600bold16black),
                                    const VerticalSpacer(height: 18),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text('Perkiraan keuntungan',
                                            style: TextStyling.w40014black),
                                        const HorizontalSpacer(width: 10),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: CircleAvatar(
                                            radius: 15,
                                            child: CircleAvatar(
                                                radius: 15,
                                                backgroundImage: AssetImage(
                                                    'assets/images/bg1024.png')),
                                            // 'assets/images/White-1024.png')),
                                          ),
                                        ),
                                        v.dataAllNFTid?.data
                                                    ?.monthlyPercentage ==
                                                'null'
                                            ? Text(
                                                ' ${v.dataAllNFTid?.data?.monthlyPercentage}% / bulan',
                                                style: TextStyling.w40014black)
                                            : Text(
                                                ' ${widget.monthlyPercentage}% / bulan',
                                                style: TextStyling.w40014black)
                                      ],
                                    ),
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
                                            const Text('Lock NFT',
                                                style: TextStyling.w40014black),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                  width: 22,
                                                  height: 22,
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: AssetImage(
                                                              'assets/images/logon.jpg')))),
                                            )
                                          ],
                                        ),
                                        v.dataAllNFTid?.data?.holdLimitTill ==
                                                null
                                            ? Text('Tidak Ada')
                                            // ignore: dead_code
                                            : Text(
                                                '${v.dataAllNFTid?.data?.holdLimitTill}',
                                                style: TextStyling.w40014grey),
                                      ],
                                    ),
                                    const VerticalSpacer(height: 18),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text('Expired',
                                                style: TextStyling.w40014black),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                  width: 22,
                                                  height: 22,
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: AssetImage(
                                                              'assets/images/logon.jpg')))),
                                            )
                                          ],
                                        ),
                                        v.dataAllNFTid?.data?.nft
                                                    ?.expirationDate ==
                                                null
                                            ? Text('Tidak Ada')
                                            : Text(
                                                dateConvert(v.dataAllNFTid?.data
                                                    ?.nft?.expirationDate),
                                                style: TextStyling.w40014grey),
                                      ],
                                    ),
                                    const VerticalSpacer(height: 8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const VerticalSpacer(height: 8),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const Text('Deskripsi',
                                            style: TextStyling.w600bold16black),
                                      ),
                                      const VerticalSpacer(height: 18),
                                      widget.deskripsi == 'null'
                                          ? Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child:
                                                  Text(widget.deskripsi ?? ""))
                                          : Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child:
                                                  Text('Deskripsi tidak ada')),
                                      const VerticalSpacer(height: 8),
                                    ],
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0, vertical: 50),
                              child: Row(
                                children: [
                                  widget.buyer_est == widget.pembeli.toString()
                                      ? Flexible(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.grey.shade500),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        const EdgeInsets
                                                                .symmetric(
                                                            vertical: 15,
                                                            horizontal: 70)),
                                              ),
                                              child: const Text("Beli Sekarang",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white)),
                                              onPressed: () {},
                                            ),
                                          ),
                                        )
                                      : Flexible(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color(
                                                            0xFF85014e)),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        const EdgeInsets
                                                                .symmetric(
                                                            vertical: 15,
                                                            horizontal: 70)),
                                              ),
                                              child: const Text("Beli Sekarang",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white)),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                    return NFTPayment(
                                                      title: v.dataAllNFTid
                                                          ?.data?.nft?.name,
                                                      images: v
                                                          .dataAllNFTid
                                                          ?.data
                                                          ?.nft
                                                          ?.imagePath,
                                                      buyer_est: v.dataAllNFTid
                                                          ?.data?.nft?.qtyUnit
                                                          .toString(),
                                                      buyer: v.dataAllNFTid
                                                          ?.data?.nft?.avlUnit
                                                          .toString(),
                                                      expired: v
                                                          .dataAllNFTid
                                                          ?.data
                                                          ?.nft
                                                          ?.expirationDate,
                                                      lockNft: widget.lockNft,
                                                      monthlyPercentage: v
                                                          .dataAllNFTid
                                                          ?.data
                                                          ?.nft
                                                          ?.monthlyPercentage
                                                          .toString(),
                                                      nftSerialId:
                                                          widget.nftSerialId,
                                                      priceCoins:
                                                          widget.priceCoins,
                                                      gasfee: widget.gasfee,
                                                      admfee: widget.admfee,
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ),
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
