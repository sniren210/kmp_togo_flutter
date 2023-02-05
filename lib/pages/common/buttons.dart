import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:sizer/sizer.dart';

class ButtonLanjutkan extends StatelessWidget {
  const ButtonLanjutkan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width,
        margin: EdgeInsets.only(left: 2.h, right: 2.w),
        padding: EdgeInsets.symmetric(vertical: 2.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).primaryColor),
        child: const Text(
          'Lanjutkan',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 15),
        ));
  }
}
