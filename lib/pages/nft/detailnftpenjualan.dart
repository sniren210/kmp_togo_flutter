import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/common/buySuccessPage.dart';
import 'package:kmp_togo_mobile/pages/history/history.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/pages/nft/nft_components.dart';
import 'package:kmp_togo_mobile/pages/nft/payments_nft.dart';
import 'package:kmp_togo_mobile/pages/nft/widgetNft/enterpinpenjualan.dart';
import 'package:kmp_togo_mobile/pages/nft/widgetNft/sellsucces.dart';
import 'package:kmp_togo_mobile/pages/nft/widgetNft/splashpenjualan.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:provider/provider.dart';

class DetailNFTPenjualan extends StatefulWidget {
  String? title,
      category,
      images,
      expired,
      nftSerialId,
      buyer,
      buyer_est,
      monthlyPercentage,
      lockNft,
      gasfee,
      deskripsi,
      admfee;

  double? priceCoins;

  DetailNFTPenjualan(
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
      this.admfee});

  late int pembeli = int.parse(buyer_est!) - int.parse(buyer!);

  @override
  State<DetailNFTPenjualan> createState() => _DetailNFTPenjualanState();
}

class _DetailNFTPenjualanState extends State<DetailNFTPenjualan>
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Text(
                                      '${widget.pembeli} / ${widget.buyer_est} Pembeli',
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
                                  Text('${widget.priceCoins} Coin',
                                      style: TextStyling.w60020black),
                                ],
                              ),
                              const VerticalSpacer(height: 12),
                              Text(widget.title ?? "",
                                  style: TextStyling.w600bold16black),
                              const VerticalSpacer(height: 18),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  Text('${widget.monthlyPercentage}% / bulan',
                                      style: TextStyling.w40014black),
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
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
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
                                  widget.lockNft == 'null'
                                      ? Text('Tidak Ada')
                                      // ignore: dead_code
                                      : Text('${widget.lockNft}',
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
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
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
                                  widget.expired == 'null'
                                      ? Text('Tidak Ada')
                                      : Text(dateConvert(widget.expired),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const VerticalSpacer(height: 8),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: const Text('Deskripsi',
                                      style: TextStyling.w600bold16black),
                                ),
                                const VerticalSpacer(height: 18),
                                widget.deskripsi == 'null'
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text('Deskripsi tidak ada'))
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(widget.deskripsi ?? "")),
                                const VerticalSpacer(height: 8),
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xFF85014e)),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 70)),
                                  ),
                                  child: const Text("Jual Sekarang",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.white)),
                                  onPressed: () {
                                    dialogWidget(context);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) {
                                    //     return NFTPayment(
                                    //       title: widget.title,
                                    //       images: widget.images,
                                    //       buyer_est: widget.buyer,
                                    //       buyer: widget.buyer_est,
                                    //       expired: widget.expired,
                                    //       lockNft: widget.lockNft,
                                    //       monthlyPercentage:
                                    //           widget.monthlyPercentage,
                                    //       nftSerialId: widget.nftSerialId,
                                    //       priceCoins: widget.priceCoins,
                                    //       gasfee: widget.gasfee,
                                    //       admfee: widget.admfee,
                                    //     );
                                    //   }),
                                    // );
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

  dialogWidget(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              Container(
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
                    const Divider(
                      color: Color.fromRGBO(88, 93, 93, 1),
                      height: 20,
                      thickness: 7,
                      indent: 140,
                      endIndent: 140,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Apakah Akan Menjual NFT',
                                style: TextStyling.w50018black),
                            const SizedBox(height: 18),
                            Image(
                              height: 100,
                              image: AssetImage('assets/images/logon.jpg'),
                            ),
                            const SizedBox(height: 18),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(text: 'Kamu akan mendapatkan'),
                                  TextSpan(
                                      text: ' ${widget.priceCoins} ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const TextSpan(
                                      text:
                                          'Coin dari hasil penjualan ini, pastikan kamu yakin ingin menjualnya.',
                                      style: const TextStyle()),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                          ],
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return EnterPinPejualanNFT(
                              nftSerialId: widget.nftSerialId.toString(),
                              priceCoin: widget.priceCoins.toString(),
                              isRegister: false,
                              isAllowBack: true,
                              nextPage: SplashNftPenjualan(
                                  nftSerialId: widget.nftSerialId.toString(),
                                  priceCoin: widget.priceCoins.toString(),
                                  title: 'Tunggu Konfirmasi Dulu',
                                  subtitle: '',
                                  nextPage: SellSUccess(
                                    nextPage: Home(),
                                    title: 'Tunggu Konfirmasi Dulu',
                                    subtitle: '',
                                  ),
                                  isReplace: false),
                              isContainFunctionBack: true,
                              title: 'Konfirmasi Pembelian',
                            );
                          }),
                        );
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
                            'Lanjut',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        // int count = 0;
                        // Navigator.popUntil(context, (route) {
                        //   return count++ == 2;
                        // });
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              const EdgeInsets.only(right: 20.0, left: 20.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 70),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: const Text(
                            'Kembali',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          );
        });
  }
}
