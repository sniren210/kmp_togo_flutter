import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

cardmitraketegori(String? judul, Color? color) {
  return Container(
    width: 48.w,
    margin: EdgeInsets.only(
      right: 3.w,
    ),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          judul ?? "",
          style: TextStyle(color: Colors.white, fontSize: 9.sp),
        ),
      ],
    ),
  );
}
