import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardMenus extends StatefulWidget {
  String? judul;
  IconData? icon;
  VoidCallback? ontap;

  CardMenus({super.key, this.judul, this.icon, this.ontap});

  @override
  State<CardMenus> createState() => _CardMenusState();
}

class _CardMenusState extends State<CardMenus> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: widget.ontap,
          child: Container(
            // margin: EdgeInsets.only(left: 4.w, right: 4.w),
            color: Colors.transparent,
            height: MediaQuery.of(context).size.height / 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0xFF85014e),
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(widget.icon, size: 7.w, color: Colors.white),
                ),
                SizedBox(
                  height: 1.7.h,
                ),
                Text(
                  widget.judul ?? "",
                  style: TextStyle(color: Colors.black87, fontSize: 9.sp),
                ),
              ],
            ),
          ),
        ),
        // InkWell(
        //   onTap: widget.ontap,
        //   child: Container(
        //     margin: EdgeInsets.only(left: 4.w, right: 4.w),
        //     color: Colors.transparent,
        //     height: MediaQuery.of(context).size.height / 10,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Container(
        //           padding: EdgeInsets.all(5),
        //           decoration: BoxDecoration(
        //               color: const Color(0xFF85014e),
        //               borderRadius: BorderRadius.circular(5)),
        //           child: Icon(widget.icon, size: 7.w, color: Colors.white),
        //         ),
        //         SizedBox(
        //           height: 1.7.h,
        //         ),
        //         Text(
        //           widget.judul ?? "",
        //           style: TextStyle(color: Colors.black87, fontSize: 9.sp),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // InkWell(
        //   onTap: widget.ontap,
        //   child: Container(
        //     margin: EdgeInsets.only(left: 4.w, right: 4.w),
        //     color: Colors.transparent,
        //     height: MediaQuery.of(context).size.height / 10,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Container(
        //           padding: EdgeInsets.all(5),
        //           decoration: BoxDecoration(
        //               color: const Color(0xFF85014e),
        //               borderRadius: BorderRadius.circular(5)),
        //           child: Icon(widget.icon, size: 7.w, color: Colors.white),
        //         ),
        //         SizedBox(
        //           height: 1.7.h,
        //         ),
        //         Text(
        //           widget.judul ?? "",
        //           style: TextStyle(color: Colors.black87, fontSize: 9.sp),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
