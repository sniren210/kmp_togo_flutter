import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';

class CustomAppBar extends StatefulWidget {
  String title;
  int? popContext, height, padding;
  Icon? iconDataApp;

  CustomAppBar({
    Key? key,
    required this.title,
    required this.height,
    required this.padding,
    this.popContext,
    this.iconDataApp,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        widget.padding!.w,
      ),
      height: widget.height!.h,
      width: 375.w,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.1),
            width: 1.h,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              int count = 0;

              Navigator.popUntil(context, (route) {
                return count++ == (widget.popContext ?? 1);
              });
            },
            child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: FittedBox(
                fit: BoxFit.cover,
                child: SvgPicture.asset(
                  'assets/images/back_icon.svg',
                ),
              ),
            ),
          ),
          widget.iconDataApp != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.iconDataApp!,
                    const HorizontalSpacer(width: 8),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          SizedBox(
            width: 24.w,
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
