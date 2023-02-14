import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/pages/nft/detail_nft.dart';
import 'package:sizer/sizer.dart';

class cardnftmitra extends StatelessWidget {
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
      ketegori,
      nama,
      imagesa,
      owner;
  double? coin;

  cardnftmitra(
      {this.images,
      this.title,
      this.buyer_est,
      this.monthlyPercentage,
      this.expired,
      this.priceCoins,
      this.lockNft,
      this.buyer,
      this.gasfee,
      this.admfee,
      this.owner,
      this.deskripsi,
      this.category,
      this.nama,
      this.coin,
      this.imagesa,
      this.ketegori,
      this.nftSerialId});

  late int pembeli = int.parse(buyer_est!) - int.parse(buyer!);
  // String? ketegori;
  // String? nama;
  // double? coin;
  // String? images;

  // cardnftmitra({this.ketegori, this.nama, this.coin, this.images});

  getNumberFormatSeparator3(double number) {
    return number.toStringAsFixed(3);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailNFT(
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
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(images ?? kEmptyImageLink)))),
                  buyer_est == pembeli.toString()
                      ? Container(
                          margin: const EdgeInsets.only(top: 5, left: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.red.shade900,
                              borderRadius: BorderRadius.circular(2)),
                          child: const Text(
                            'Stock habis',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 1.h, bottom: 1.h, left: 2.w, right: 2.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text(
                      "$buyer_est / $pembeli  Pembeli",
                      style: TextStyle(color: Colors.black87, fontSize: 9.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.5.h),
                    child: Text(
                      title ?? "",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Row(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image:
                                      AssetImage('assets/images/logon.jpg'))),
                          // child: Icon(
                          //   Icons.monetization_on,
                          //   size: 9.w,
                          //   color:
                          //       Color(0xFF85014e),
                          // ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Expanded(
                          child: Text(
                            '${getNumberFormatSeparator3(double.parse(priceCoins!))} Coin',
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black87, fontSize: 9.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
