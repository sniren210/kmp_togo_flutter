import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/nft/detail_nft.dart';

class CardSearching extends StatelessWidget {
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

  CardSearching(
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
    return InkWell(
      onTap: () {
        print(pembeli);
        print(nftSerialId);
        print(lockNft);
        print(monthlyPercentage);
        print(priceCoins);
        print(images);
        if (owner == '') {
          customSnackbar(
              type: 'error', title: 'error', text: 'NFT tidak tersedia');
        } else {
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
              );
            }),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
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
            Container(
              width: MediaQuery.of(context).size.width,
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
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text('$pembeli / $buyer_est Pembeli',
                                style: TextStyling.w40012black),
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
                              radius: 15,
                              child: CircleAvatar(
                                  radius: 15,
                                  backgroundImage: AssetImage(
                                      'assets/images/bg1024.png')),
                              // 'assets/images/White-1024.png')),
                            ),
                          ),
                          Text("${priceCoins}",
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
