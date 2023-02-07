import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Cardnft extends StatelessWidget {
  String? jmlpembeli;
  String? darijumlah;
  String? nama;
  String? tahun;
  int? coin;
  String? images;

  Cardnft(
      {this.jmlpembeli,
      this.darijumlah,
      this.nama,
      this.tahun,
      this.coin,
      this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      margin: EdgeInsets.only(
        right: 3.w,
      ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(images ?? "")))),
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
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${jmlpembeli}/${darijumlah} Pembeli',
                        style: TextStyle(color: Colors.black87, fontSize: 9.sp),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.5.h),
                    child: Text(
                      nama ?? "",
                      style: TextStyle(color: Colors.black87, fontSize: 9.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.5.h),
                    child: Text(
                      tahun ?? "",
                      style: TextStyle(color: Colors.black87, fontSize: 8.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.5.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.layers,
                          size: 12.sp,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          '${coin.toString()} Coin',
                          style:
                              TextStyle(color: Colors.black87, fontSize: 9.sp),
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
