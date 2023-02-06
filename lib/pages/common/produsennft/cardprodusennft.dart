import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/image_generator.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/pages/nft/detailNftPenjualan.dart';
import 'package:sizer/sizer.dart';

class CardProdusenNFT extends StatefulWidget {
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
      admfee,
      owner;

  double? priceCoins;

  CardProdusenNFT(
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
      this.nftSerialId});

  @override
  State<CardProdusenNFT> createState() => _CardProdusenNFTState();
}

class _CardProdusenNFTState extends State<CardProdusenNFT>
    with NumberFormatMachine {
  dateConvert(date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 1.5.h),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade300)
                // Border(
                //   bottom: BorderSide(color: Colors.grey.shade500),
                // ),
                ),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailNFTPenjualan(
                title: widget.title,
                images: widget.images,
                buyer_est: widget.buyer_est,
                buyer: widget.buyer,
                expired: widget.expired,
                lockNft: widget.lockNft,
                monthlyPercentage: widget.monthlyPercentage,
                nftSerialId: widget.nftSerialId,
                priceCoins: widget.priceCoins,
                gasfee: widget.gasfee,
                admfee: widget.admfee,
              );
            }));
          },
          child: Padding(
            padding:
                EdgeInsets.only(top: 2.h, bottom: 2.h, left: 2.w, right: 2.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  widget.images ?? kEmptyImageLink))),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.5.h, horizontal: 2.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Colors.grey.shade300),
                                  margin: EdgeInsets.only(left: 3.w),
                                  child: Text(
                                    '0/1 Pembeli',
                                    style: TextStyle(fontSize: 7.sp),
                                  )),
                              const Spacer(),
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 2.5.w, top: 0.5.h),
                              child: Text(
                                widget.title ?? "",
                                style: TextStyle(fontSize: 12.sp),
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 2.5.w, top: 0.5.h),
                              child: Text(
                                'Otentik',
                                style: TextStyle(fontSize: 10.sp),
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 2.w, top: 0.5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.expired == 'null'
                                      ? 'Tidak ada expired'
                                      : dateConvert(widget.expired)),
                                  // widget.expired
                                  //     .toString()
                                  //     .substring(0, 10)),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.monetization_on,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Text(
                                          '${getNumberFormatSeparator(25000)} Coins'),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
