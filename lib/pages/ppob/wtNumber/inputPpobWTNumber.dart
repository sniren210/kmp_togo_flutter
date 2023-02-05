import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kmp_togo_mobile/models/ppob/postpaid/PostPaidProduct.dart';
import 'package:kmp_togo_mobile/pages/ppob/ppobPaymentPostpaid.dart';
import 'package:kmp_togo_mobile/pages/ppob/wtNumber/listservices.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';

class InputPPOBWithoutNumber extends StatefulWidget {
  final String title;
  final String product_type;

  InputPPOBWithoutNumber({required this.title, required this.product_type});

  @override
  State<InputPPOBWithoutNumber> createState() => _InputPPOBWithoutNumberState();
}

class _InputPPOBWithoutNumberState extends State<InputPPOBWithoutNumber> {
  PostPaidProduct? postpaidProduct;

  TextEditingController numbersC = TextEditingController();

  FutureOr? onGoBack(dynamic value) {
    setState(() {
      if (value != null) {
        postpaidProduct = value;
      } else {
        postpaidProduct = PostPaidProduct(
            code: '', name: '', status: 0, fee: 0, komisi: 0, type: '');
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  bool? validate = false;

  _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        validate = true;
      });
    } else {}
  }

  nextPage(String code, String customer_id) {
    if (validate == true) {
      print(validate);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PPOBPaymentPostPaid(
                  code: code,
                  product: widget.product_type,
                  customer_id: customer_id)));
    }
  }

  @override
  void initState() {
    postpaidProduct = PostPaidProduct(
        code: '', name: '', status: 0, fee: 0, komisi: 0, type: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF85014e),
          elevation: 0,
          title: Text(widget.title),
        ),
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Text(
                            'Pembayaran ${widget.title}',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade600),
                          )),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextField(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListServiceWTNumber(
                                      product_name: widget.product_type)),
                            ).then((value) {
                              onGoBack(value);
                            });
                          },
                          readOnly: true,
                          enableInteractiveSelection: false,
                          showCursor: true,
                          focusNode: AlwaysDisabledFocusNode(),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            prefixIcon: Icon(
                              Icons.phone_android_rounded,
                              size: 4.w,
                            ),
                            hintText: postpaidProduct!.name == ''
                                ? 'Pilih Layanan'
                                : postpaidProduct!.name,
                            border: const OutlineInputBorder(),
                            suffixIcon: const Icon(Icons.arrow_drop_down_sharp),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          controller: numbersC,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nomor registrasi tidak boleh kosong';
                            }
                            //  else if (int.parse(value) < 1 ||
                            //     int.parse(value) > 13) {
                            //   return 'Nomor telepon tidak ditemukan.';
                            // }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            prefixIcon: Icon(
                              Icons.phone_android_rounded,
                              size: 4.w,
                            ),
                            hintText: 'Masukkan Nomor ${getProductType()}',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 160)
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        width: context.width,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                await _submit();
                                nextPage(postpaidProduct!.code, numbersC.text);
                              },
                              child: Container(
                                  width: context.width,
                                  margin:
                                      EdgeInsets.only(left: 2.h, right: 2.w),
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFF85014e)),
                                  child: const Text(
                                    'Lanjutkan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getProductType() {
    switch (widget.product_type) {
      case 'pln':
        return 'Meter';
      case 'pdam':
        return 'Meter';
      case 'emoney':
        return 'e-Money';
      case 'internet':
        return '';
      case 'finance':
        return '';
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
