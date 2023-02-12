import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class cardMitraKategori extends StatelessWidget {
  const cardMitraKategori({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.w,
      margin: EdgeInsets.only(
        right: 3.w,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              color,
            ],
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 9.sp),
          ),
        ],
      ),
    );
  }
}
