import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:sizer/sizer.dart';

class CardTopup extends StatelessWidget with NumberFormatMachine {
  IconData? icon;
  String? kategori;
  String? ref;
  String? harga;
  String? tanggal;
  String? waktu;
  String? metode;
  String? pembayaran;
  String? total;

  VoidCallback? ontap;

  CardTopup(
      {this.icon,
      this.kategori,
      this.ref,
      this.harga,
      this.ontap,
      this.tanggal,
      this.waktu,
      this.metode,
      this.pembayaran,
      this.total});

  // dateConvert2(date) {
  //   DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
  //   var inputDate = DateTime.parse(parseDate.toString());
  //   var outputFormat = DateFormat('HH:mm:ss');
  //   var outputDate = outputFormat.format(inputDate);
  //   return outputDate;
  // }

  dateConvert(date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('d MMM y HH:mm:ss');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  @override
  Widget build(BuildContext context) {
    String? tanggalconvert = DateTime.now().toIso8601String();
    // String? tanggalconvert = dateConvert(tanggal);
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (builder) {
              return Wrap(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(27.0),
                          topRight: Radius.circular(27.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Center(
                          child: Container(
                            width: 25.w,
                            height: 1.h,
                            margin: EdgeInsets.only(top: 1.h),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        detailRiwayatWidget(context, tanggalconvert),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(
                                  right: 20.0, left: 20.0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 70),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xFF85014e)),
                              child: const Text(
                                'Tutup',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                              )),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  )
                ],
              );
            });
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 1.h,
        ),
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: const Color(0xFF85014e))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  // 'Rp. ${getNumberFormatSeparator(double.parse(harga!))}',
                  'Rp. 100',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 138, 111, 111),
                      fontSize: 9.sp),
                ),
                Text(
                  ' - $kategori',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 138, 111, 111),
                      fontSize: 9.sp),
                ),
                Text(
                  '',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 138, 111, 111),
                      fontSize: 9.sp),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(left: 3.w),
                child: const Icon(Icons.arrow_drop_down)),
          ],
        ),
      ),
    );
  }

  Widget detailRiwayatWidget(context, String? tanggalConv) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(top: 1.h),
                child: Text(
                  'Detail Riwayat',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold),
                )),
            Container(
              margin: EdgeInsets.only(
                top: 0.5.h,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        icon,
                        size: 8.w,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kategori ?? "",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 138, 111, 111),
                                fontSize: 9.sp),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          SizedBox(
                            width: 35.w,
                            child: Text(
                              ref == null ? '' : '$ref',
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 9.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 3.w),
                    child: Text(
                      'Rp. ${getNumberFormatSeparator(double.parse(harga!))}',
                      style: TextStyle(color: Colors.black, fontSize: 9.sp),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Icon(
                          Icons.date_range,
                          size: 5.w,
                          color: Colors.black,
                        )),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          '$tanggalConv',
                          style: TextStyle(color: Colors.black, fontSize: 9.sp),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Icon(
                          Icons.wallet,
                          size: 5.w,
                          color: Colors.black,
                        )),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          '${metode}',
                          style: TextStyle(color: Colors.black, fontSize: 9.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Icon(
                          Icons.generating_tokens,
                          size: 5.w,
                          color: Colors.black,
                        )),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'Rp.${pembayaran}',
                          style: TextStyle(color: Colors.black, fontSize: 9.sp),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Icon(
                          Icons.money,
                          size: 5.w,
                          color: Colors.black,
                        )),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'Rp.${total}',
                          style: TextStyle(color: Colors.black, fontSize: 9.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
