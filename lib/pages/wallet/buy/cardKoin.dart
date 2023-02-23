import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:sizer/sizer.dart';

class CardCoinToGo extends StatelessWidget {
  final String status;
  final String harga;

  CardCoinToGo({required this.status, required this.harga});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 1.h,
      ),
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xFF85014e))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.upcoming,
                size: 6.w,
                color: Colors.amber,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(status, style: TextStyling.w40012black),
            ],
          ),
          VerticalSpacer(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 3.w),
                      child: Icon(
                        Icons.monetization_on,
                        size: 6.w,
                        color: Colors.amber,
                      )),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 3.w),
                    child: const Text(
                      '1 ToGo',
                      style: TextStyling.w600bold14black,
                    ),
                  ),
                ],
              ),
              const Text('='),
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 3.w),
                      child: Icon(
                        Icons.monetization_on,
                        size: 6.w,
                        color: Colors.amber,
                      )),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 3.w),
                    child: Text(
                      'Coin ${harga}',
                      style: TextStyling.w600bold14black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
