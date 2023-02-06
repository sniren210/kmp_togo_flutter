import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/common/buySuccessPage.dart';
import 'package:kmp_togo_mobile/pages/common/pinPage.dart';
import 'package:kmp_togo_mobile/pages/common/splashPage.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/pages/nft/widgetNft/enterpinnft.dart';
import 'package:kmp_togo_mobile/pages/nft/widgetNft/splashNft.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:provider/provider.dart';

import '../../helpers/ui_helper/custom_snackbar.dart';
// import 'package:size_config/size_config.dart';

class NFTPayment extends StatefulWidget {
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
      admfee;

  NFTPayment(
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
      this.admfee});

  late double total =
      double.parse(gasfee!) + double.parse(admfee!) + double.parse(priceCoins!);
  @override
  State<NFTPayment> createState() => _NFTPaymentState();
}

class _NFTPaymentState extends State<NFTPayment> {
  GlobalKey? _formKey;

  int? groupValue = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final _getkategoriProvider =
          Provider.of<ProviderNft>(context, listen: false);
      await _getkategoriProvider.getCoinKu(context);
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
    print('haloo ya ${widget.total}');
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: Consumer<ProviderNft>(
          builder: (BuildContext context, v, Widget? Child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            // SizeConfig().init(
            //     context: context,
            //     safeAreaBox: constraints,
            //     referenceHeight: 800,
            //     referenceWidth: 360);
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  widget.images ?? kEmptyImageLink),
                              fit: BoxFit.fitHeight,
                            )),
                            alignment: Alignment.center,
                          ),
                          const HorizontalSpacer(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${widget.title}',
                                  style: TextStyling.w600bold16black),
                              const VerticalSpacer(height: 7),
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
                                      style: TextStyling.w600bold14black),
                                ],
                              ),
                              const VerticalSpacer(height: 7),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Perkiraan keuntungan',
                                      style: TextStyling.w40014black),
                                  HorizontalSpacer(width: 10),
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
                                  Text('${widget.monthlyPercentage}%',
                                      style: TextStyling.w40014black),
                                ],
                              ),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Detail Pembayaran",
                                style: TextStyling.w600bold16black,
                              ),
                            ],
                          ),
                          const VerticalSpacer(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Harga NFT",
                                      style: TextStyling.w30013black,
                                    ),
                                    Text(
                                      "${widget.priceCoins} Coin",
                                      style: TextStyling.bold13black,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Biaya Admin",
                                      style: TextStyling.w30013black,
                                    ),
                                    Text(
                                      widget.admfee.toString(),
                                      style: TextStyling.bold13black,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Gas Fee",
                                      style: TextStyling.w30013black,
                                    ),
                                    Text(
                                      widget.gasfee.toString(),
                                      style: TextStyling.bold13black,
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                                child: Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Biaya",
                                      style: TextStyling.w50015black,
                                    ),
                                    Text(
                                      '${widget.total} Coins',
                                      style: TextStyling.w600bold16black,
                                    ),
                                  ],
                                ),
                              ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Text('Lock NFT',
                                      style: TextStyling.w40014black),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child:
                                        Icon(Icons.currency_exchange, size: 16),
                                  )
                                ],
                              ),
                              widget.lockNft == 'null'
                                  ? Text('Tidak Ada')
                                  : Text('${widget.lockNft}',
                                      style: TextStyling.w40014grey),
                            ],
                          ),
                          const VerticalSpacer(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Text('Expired',
                                      style: TextStyling.w40014black),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child:
                                        Icon(Icons.currency_exchange, size: 16),
                                  )
                                ],
                              ),
                              widget.expired == null
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
                          const Text('Metode Pembayaran NFT',
                              style: TextStyling.w600bold16black),
                          const VerticalSpacer(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: 0,
                                  groupValue: groupValue,
                                  onChanged: (value) {
                                    setState(() {
                                      groupValue = value as int?;
                                    });
                                  }),
                              const HorizontalSpacer(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text('Coin Kamu',
                                          style: TextStyling.w40014black),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Icon(Icons.currency_exchange,
                                            size: 16),
                                      )
                                    ],
                                  ),
                                  const VerticalSpacer(height: 12),
                                  Row(
                                    children: [
                                      Icon(Icons.currency_exchange, size: 16),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: v.dataMyInfo?.data.coinWallet ==
                                                'null'
                                            ? Text('Coin Wallet Kosong',
                                                style: TextStyling.w40014black)
                                            : Text(
                                                '${v.dataMyInfo?.data.coinWallet.coin} Coin',
                                                style: TextStyling.w40014black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const VerticalSpacer(height: 30),
                          Row(
                            children: [
                              Flexible(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFF85014e)),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 70)),
                                    ),
                                    child: const Text("Beli Sekarang",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white)),
                                    onPressed: () async {
                                      if (groupValue == 1) {
                                        await customSnackbar(
                                            type: 'error',
                                            title: 'Coin Belum Dipilih',
                                            text: 'Terjadi kesalahan!');
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return EnterPinNFT(
                                              nftSerialId:
                                                  widget.nftSerialId.toString(),
                                              priceCoin:
                                                  widget.priceCoins.toString(),
                                              isRegister: false,
                                              isAllowBack: true,
                                              nextPage: SplashNft(
                                                  nftSerialId: widget
                                                      .nftSerialId
                                                      .toString(),
                                                  priceCoin: widget.priceCoins
                                                      .toString(),
                                                  title: 'Berhasil Membeli NFT',
                                                  subtitle: '',
                                                  nextPage: BuySuccessPage(
                                                    nextPage: Home(),
                                                    title:
                                                        'Berhasil Membeli NFT',
                                                    subtitle: '',
                                                  ),
                                                  isReplace: false),
                                              isContainFunctionBack: true,
                                              title: 'Konfirmasi Pembelian',
                                            );
                                          }),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
