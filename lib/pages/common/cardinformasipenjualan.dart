import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/pages/umkm/hapusproduk.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/ui_helper/textStyling.dart';

class CardInformasiPenjualan extends StatefulWidget {
  String title;

  String? ukuran;
  String? warna;
  TextEditingController hargaC;
  TextEditingController stockC;

  CardInformasiPenjualan({
    required this.title,
    this.ukuran,
    this.warna, required this.hargaC,required this.stockC,
  });

  @override
  State<CardInformasiPenjualan> createState() => _CardInformasiPenjualanState();
}

class _CardInformasiPenjualanState extends State<CardInformasiPenjualan> {
  List<String> listDiskon = [
    "Tidak Ada",
    "Potongan Harga",
    "Persen",
  ];

  var currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade500),
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 1.5.h, bottom: 1.5.h, left: 3.w, right: 3.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 3.h),
                  child: Text(
                    widget.title,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 3.h),
                      child: Text(
                        "Ukuran",
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 3.h),
                      child: Text(
                        widget.ukuran ?? '....',
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      )),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 2.h),
                        child: Text(
                          "Warna",
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 2.h),
                        child: Text(
                          widget.warna ?? '....',
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        )),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Text(
                            "Harga",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          )),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        margin: EdgeInsets.only(top: 2.h),
                        height: 5.h,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: widget.hargaC,
                          style: TextStyle(color: Colors.grey.shade500),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Harga';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                            prefixIcon: Icon(
                              Icons.monetization_on,
                              size: 4.w,
                            ),
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500, fontSize: 11.sp),
                            hintText: 'Masukkan Harga',
                            border: const OutlineInputBorder(),
                          ),
                          onSaved: (value){
                          },
                        ),
                      ),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Text(
                            "Tipe Diskon",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          )),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 2.h,
                        ),
                        padding: EdgeInsets.only(
                          left: 3.w,
                          right: 3.w,
                        ),
                        height: 5.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: Colors.grey.shade500)),
                        child: Row(
                          children: [
                            Icon(Icons.percent,
                                size: 4.w, color: Colors.grey.shade500),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint: Text(
                                    "Pilih Tipe Diskon",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.grey.shade500),
                                  ),
                                  icon: Visibility(
                                      visible: true,
                                      child: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.grey.shade500)),
                                  isExpanded: true,
                                  items: listDiskon.map((val) {
                                    return DropdownMenuItem(
                                      value: val,
                                      child: Text(
                                        val,
                                        style: TextStyle(
                                            color: Colors.grey.shade500),
                                      ),
                                    );
                                  }).toList(),
                                  value: currentSelectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      currentSelectedValue = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Text(
                            "Potongan Harga",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          )),
                    ),
                    Expanded(
                      flex: 7,
                      child: currentSelectedValue == 'Potongan Harga'
                          ? Container(
                              margin: EdgeInsets.only(top: 2.h),
                              height: 5.h,
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey.shade500),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Harga';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  prefixIcon: Icon(
                                    Icons.discount,
                                    size: 4.w,
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 11.sp),
                                  hintText: 'Masukkan Diskon',
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: TextField(
                                  readOnly: true,
                                  enableInteractiveSelection: false,
                                  showCursor: true,
                                  focusNode: AlwaysDisabledFocusNode(),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    prefixIcon: Icon(
                                      Icons.discount,
                                      size: 4.w,
                                    ),
                                    hintText: 'Masukkan Harga',
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Text(
                            "Persen",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          )),
                    ),
                    Expanded(
                      flex: 7,
                      child: currentSelectedValue == 'Persen'
                          ? Container(
                              margin: EdgeInsets.only(top: 2.h),
                              height: 5.h,
                              child: TextFormField(
                                style: TextStyle(color: Colors.grey.shade500),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Harga';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  prefixIcon: Icon(
                                    Icons.percent,
                                    size: 4.w,
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 11.sp),
                                  hintText: 'Masukkan Persen',
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: TextField(
                                  readOnly: true,
                                  enableInteractiveSelection: false,
                                  showCursor: true,
                                  focusNode: AlwaysDisabledFocusNode(),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    prefixIcon: Icon(
                                      Icons.percent,
                                      size: 4.w,
                                    ),
                                    hintText: 'Masukkan Persen',
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Text(
                            "Stok Barang",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          )),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        margin: EdgeInsets.only(top: 2.h),
                        height: 5.h,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: widget.stockC,
                          style: TextStyle(color: Colors.grey.shade500),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Harga';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5),
                            prefixIcon: Icon(
                              Icons.list_alt,
                              size: 4.w,
                            ),
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500, fontSize: 11.sp),
                            hintText: 'Stok Barang',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(
                height: 2.h,
              )
            ],
          ),
        ));
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
