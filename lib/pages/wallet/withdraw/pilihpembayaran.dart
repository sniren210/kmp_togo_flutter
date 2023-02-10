import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/models/payment_method.dart';
import 'package:kmp_togo_mobile/pages/auth/register/payments/registerPaymentsProcess.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerIdValidationPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kmp_togo_mobile/pages/wallet/withdraw/otpwithdraw.dart';
import 'package:kmp_togo_mobile/providers/wallet/withdraw/providerwallet.dart';
import 'package:provider/provider.dart';
// import 'package:size_config/size_config.dart';

class PilihPembayaran extends StatefulWidget {
  // final bool isRegister;
  // final Widget nextPage;
  int? amount;
  PilihPembayaran({Key? key, this.amount
      // required this.isRegister, required this.nextPage
      })
      : super(key: key);

  @override
  State<PilihPembayaran> createState() => _PilihPembayaranState();
}

class _PilihPembayaranState extends State<PilihPembayaran> {
  final _formKey = GlobalKey<FormState>();

  List<PaymentMethodVA> data_va = [];
  List<PaymentMethodOT> data_ot = [];

  // bool? bank_active = true, dompet_digital_active = false;
  int? bank_group_val = 0, dompet_digital_group_val = 0;

  // TextEditingController nomorpembayaran = TextEditingController();
  TextEditingController nameUser = TextEditingController();
  TextEditingController nomorBank = TextEditingController();

  bool? checkedValue = false;
  bool loading = true;
  bool loadingaddbank = false;

  @override
  void initState() {
    data_va.add(PaymentMethodVA(
        val: 0,
        description: 'Bank Artha Graha Internasional',
        imageAsset: 'assets/images/logo-bagi-resize.png'));

    // data_ot.add(PaymentMethodOT(
    //     val: 0, description: 'Dana', imageAsset: 'assets/images/logon.jpg'));
    //
    // data_ot.add(PaymentMethodOT(
    //     val: 0, description: 'Go Pay', imageAsset: 'assets/images/logon.jpg'));
    //
    // data_ot.add(PaymentMethodOT(
    //     val: 0, description: 'OVO', imageAsset: 'assets/images/logon.jpg'));
    //
    // data_ot.add(PaymentMethodOT(
    //     val: 0,
    //     description: 'Link Aja',
    //     imageAsset: 'assets/images/logon.jpg'));

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final _getkategoriProvider =
          Provider.of<ProviderWithDraw>(context, listen: false);
      await _getkategoriProvider.getNomorbank();
      // await _getkategoriProvider.getMyNFT(context);
      setState(() {
        loading = _getkategoriProvider.loadinggetBank = false;
      });
    });
    super.initState();
  }

  void _submit(int? idBank) async {
    // if (_formKey.currentState!.validate()) {
    //   // if (checkedValue != false) {
    //   print(widget.amount);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => OtpWithDraw(
                amount: widget.amount,
                nomor: idBank!,
              )),
    );
    // }

    // }
  }

  void _submitbank(String name, String password) async {
    if (_formKey.currentState!.validate()) {
      final _getkategoriProvider =
          Provider.of<ProviderWithDraw>(context, listen: false);
      await _getkategoriProvider.addnomorBank(context, name, password);
      // await _getkategoriProvider.getMyNFT(context);
      setState(() {
        loadingaddbank = _getkategoriProvider.loadingaddbank;
        loading = true;
      });

      await _getkategoriProvider.getNomorbank();
      setState(() {
        loading = _getkategoriProvider.loadinggetBank;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading == false
            ? Consumer<ProviderWithDraw>(builder: (context, v, child) {
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                            15.w,
                          ),
                          height: 102.h,
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
                                  Navigator.of(context).pop();
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
                              Text(
                                "Pilih Rekening",
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
                        ),
                        const VerticalSpacer(height: 8),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 11.0, horizontal: 2.0),
                                        child: Text(
                                          "Cara Penarikan",
                                          style: TextStyling.w600bold16black,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            // bank_active = !bank_active!;
                                            // dompet_digital_active = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 11.0, horizontal: 2.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Bank",
                                                style:
                                                    TextStyling.w600bold14black,
                                              ),
                                              Icon(
                                                  // bank_active!
                                                  //   ?
                                                  Icons.arrow_drop_up_sharp
                                                  // : Icons.arrow_drop_down_sharp
                                                  )
                                            ],
                                          ),
                                        ),
                                      ),
                                      // bank_active!
                                      //     ?
                                      Column(
                                        children: data_va
                                            .map((e) => Row(
                                                  children: [
                                                    Radio(
                                                        activeColor:
                                                            const Color(
                                                                0xFF85014e),
                                                        value:
                                                            data_va.indexOf(e),
                                                        groupValue:
                                                            bank_group_val,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            debugPrint(
                                                                'RADIO: $value');
                                                            bank_group_val =
                                                                value as int?;
                                                          });
                                                        }),
                                                    SizedBox(
                                                      width: 24.w,
                                                      height: 24.h,
                                                      child: FittedBox(
                                                        fit: BoxFit.cover,
                                                        child: Image.asset(
                                                          e.imageAsset!,
                                                        ),
                                                      ),
                                                    ),
                                                    const HorizontalSpacer(
                                                        width: 8),
                                                    Text(
                                                      e.description!,
                                                      style: TextStyling
                                                          .w30013black,
                                                    ),
                                                  ],
                                                ))
                                            .toList(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // bank_active == true || dompet_digital_active == false

                              //     ?
                              v.dataMybank?.data?.isNotEmpty ?? false
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 24.w,
                                                  height: 24.h,
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child: Image.asset(
                                                      'assets/images/logo-bagi-resize.png',
                                                    ),
                                                  ),
                                                ),
                                                const HorizontalSpacer(
                                                    width: 8),
                                                Text(
                                                  'Bank Artha Graha Internasional',
                                                  style:
                                                      TextStyling.w50014black,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Nama Pemilik : ${v.dataMybank?.data?.first.name}',
                                              style: TextStyling.w50014black,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Nomor Rekening : ${v.dataMybank?.data?.first.number}',
                                              style: TextStyling.w50014black,
                                            ),
                                          ]),
                                    )
                                  : Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10.h, left: 4.w, right: 4.w),
                                          child: TextFormField(
                                            controller: nameUser,
                                            // keyboardType: TextInputType.none,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 13),
                                              prefixIcon: Icon(
                                                Icons.phone_android,
                                                size: 19,
                                              ),
                                              hintText: "Please Enter Name",
                                              hintStyle:
                                                  TextStyle(fontSize: 12.sp),
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (username) {
                                              if (username!.isEmpty) {
                                                return "Please Enter Name Bank";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10.h, left: 4.w, right: 4.w),
                                          child: TextFormField(
                                            controller: nomorBank,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 13),
                                              prefixIcon: Icon(
                                                Icons.phone_android,
                                                size: 19,
                                              ),
                                              hintText:
                                                  "Please Enter Number Bank",
                                              hintStyle:
                                                  TextStyle(fontSize: 12.sp),
                                              border: OutlineInputBorder(),
                                            ),
                                            validator: (username) {
                                              if (username!.isEmpty) {
                                                return "Please Enter Number Bank";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              _submitbank(nameUser.text,
                                                  nomorBank.text);
                                              setState(() {
                                                loadingaddbank = true;
                                              });
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) => OtpWithDraw()),
                                              // );
                                            },
                                            child: loadingaddbank == false
                                                ? Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    padding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            vertical: 15,
                                                            horizontal: 70),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: const Color(
                                                            0xFF85014e)),
                                                    child: const Text(
                                                      'Simpan Bank',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 15),
                                                    ))
                                                : Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 15,
                                                        horizontal: 70),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Colors.grey),
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )),
                                      ],
                                    ),
                              // : Container(
                              //     margin: EdgeInsets.only(
                              //         top: 10.h, left: 4.w, right: 4.w),
                              //     child: TextField(
                              //       readOnly: true,
                              //       enableInteractiveSelection: true,
                              //       showCursor: true,
                              //       enabled: false,
                              //       decoration: InputDecoration(
                              //         contentPadding:
                              //             EdgeInsets.symmetric(vertical: 13),
                              //         prefixIcon: Icon(
                              //           Icons.phone_android,
                              //           size: 19,
                              //         ),
                              //         hintText: "0902840284084",
                              //         hintStyle: TextStyle(fontSize: 12.sp),
                              //         border: OutlineInputBorder(),
                              //       ),
                              //     ),
                              //   ),
                              VerticalSpacer(height: 20.h),
                              v.dataMybank?.data?.isNotEmpty ?? false
                                  ? Container(
                                      margin: EdgeInsets.only(
                                          top: 10.h, left: 4.w, right: 4.w),
                                      child: Text(
                                        "Lörem ipsum endotos fara ahossa lare nenat. Anamani kesk intrabel. Reling jära, sperade. Vöbel metromatisk kohivuheten progåvis nitrede. l",
                                        style: TextStyling.normal15grey,
                                      ),
                                    )
                                  : Container(),
                              // Container(
                              //   // color: Colors.pink,
                              //   margin: EdgeInsets.only(
                              //     top: 10.h,
                              //   ),
                              //   child: CheckboxListTile(
                              //     contentPadding: EdgeInsets.zero,
                              //     title: Transform.translate(
                              //       offset: const Offset(-20, 0),
                              //       child: Text(
                              //         "Masukkan Nomor Tujuan",
                              //         style: TextStyling.normal15grey,
                              //       ),
                              //     ),
                              //     value: checkedValue,
                              //     onChanged: (newValue) {
                              //       setState(() {
                              //         checkedValue = newValue;
                              //       });
                              //     },

                              //     controlAffinity: ListTileControlAffinity.leading,
                              //     //  <-- leading Checkbox
                              //   ),
                              // ),
                              VerticalSpacer(height: 20.h),
                              v.dataMybank?.data?.isNotEmpty ?? false
                                  ? InkWell(
                                      onTap: () {
                                        _submit(
                                            v.dataMybank?.data?.first.id ?? 0);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) => OtpWithDraw()),
                                        // );
                                      },
                                      child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 70),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color(0xFF85014e)),
                                          child: const Text(
                                            'Lanjutkan',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          )),
                                    )
                                  : Container(),
                              const VerticalSpacer(height: 20),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
