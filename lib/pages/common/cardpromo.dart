import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

cardpromo(String? images) {
  return Container(
    width: 48.w,
    margin: EdgeInsets.only(
      right: 3.w,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage(images ?? ""))),
    // child: Column(
    //   children: [
    //     Text(
    //       judul ?? "",
    //       style: TextStyle(color: Colors.black87, fontSize: 9.sp),
    //     ),
    //   ],
    // ),
  );
}
