import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/nft/detail_nft.dart';

class NFTDashCard extends StatelessWidget {
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
      admfee,
      deskripsi,
      owner;

  NFTDashCard(
      {required this.images,
      required this.title,
      required this.buyer_est,
      this.monthlyPercentage,
      this.expired,
      this.priceCoins,
      this.lockNft,
      this.buyer,
      this.gasfee,
      this.admfee,
      this.owner,
      this.deskripsi,
      this.nftSerialId});

  late int pembeli = int.parse(buyer_est!) - int.parse(buyer!);

  @override
  Widget build(BuildContext context) {
    getNumberFormatSeparator3(double number) {
      return number.toStringAsFixed(3);
    }

    return InkWell(
      onTap: () {
        print(pembeli);
        print('nfgtid ${nftSerialId}');
        print('locknft ${lockNft}');
        print('montly ${monthlyPercentage}');
        print('price ${priceCoins}');
        print('halooo ${images}');

        // if (owner == '') {
        //   customSnackbar(
        //       type: 'error', title: 'error', text: 'NFT tidak tersedia');
        // } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return DetailNFT(
              title: title,
              images: images,
              buyer_est: buyer_est,
              buyer: buyer,
              expired: expired,
              lockNft: lockNft,
              monthlyPercentage: monthlyPercentage,
              nftSerialId: nftSerialId,
              priceCoins: priceCoins,
              gasfee: gasfee,
              admfee: admfee,
              deskripsi: deskripsi,
              owner: owner,
            );
          }),
        );
        // }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: images == null
                        ? NetworkImage(
                            'https://picsum.photos/id/870/200/300?grayscale&blur=2')
                        : NetworkImage('$images'),
                    fit: BoxFit.cover,
                  )),
                  alignment: Alignment.center,
                ),
                buyer_est == pembeli.toString()
                    ? Container(
                        margin: EdgeInsets.only(top: 5, left: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.red.shade900,
                            borderRadius: BorderRadius.circular(2)),
                        child: Text(
                          'Stock habis',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Container()
              ],
            ),
            Container(
              width: 200,
              height: 126,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Card(
                          color: Color(0xFF85014e),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 6),
                            child: Text("${buyer_est} / ${pembeli}  Pembeli",
                                style: TextStyling.w40014white),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      title ?? "",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyling.w50014black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: CircleAvatar(
                              radius: 10,
                              child: CircleAvatar(
                                  radius: 10,
                                  backgroundImage:
                                      AssetImage('assets/images/bg1024.png')),
                              // 'assets/images/White-1024.png')),
                            ),
                          ),
                          Text(
                              '${getNumberFormatSeparator3(double.parse(priceCoins!))} Coin',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyling.w600bold16black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
