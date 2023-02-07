import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/models/payment_method.dart';
import 'package:kmp_togo_mobile/pages/auth/register/payments/registerPaymentsProcess.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerIdValidationPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kmp_togo_mobile/pages/common/buttons.dart';
// import 'package:size_config/size_config.dart';

class BeforePayments extends StatefulWidget {
  final bool isRegister;
  final Widget nextPage;

  const BeforePayments(
      {Key? key, required this.isRegister, required this.nextPage})
      : super(key: key);

  @override
  State<BeforePayments> createState() => _BeforePaymentsState();
}

class _BeforePaymentsState extends State<BeforePayments> {
  List<PaymentMethodVA> data_va = [];
  List<PaymentMethodCC> data_cc = [];
  List<PaymentMethodOT> data_ot = [];

  bool? va_active = true, credit_active = false, others_active = false;
  int? va_group_val = 1, credit_group_val = 1, others_group_val = 1;

  @override
  void initState() {
    data_va.add(PaymentMethodVA(
        val: 0,
        description: 'Bank Artha Graha Internasional',
        imageAsset: 'assets/images/logo-bagi-resize.png'));

    // data_cc.add(PaymentMethodCC(
    //     val: 0,
    //     description: 'BRI Credit Card',
    //     imageAsset: 'assets/images/logon.jpg'));
    // data_cc.add(PaymentMethodCC(
    //     val: 0,
    //     description: 'Mandiri Credit Card',
    //     imageAsset: 'assets/images/logon.jpg'));
    //
    // data_ot.add(PaymentMethodOT(
    //     val: 0, description: 'Go Pay', imageAsset: 'assets/images/logon.jpg'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // SizeConfig().init(
          //     context: context,
          //     safeAreaBox: constraints,
          //     referenceHeight: 800,
          //     referenceWidth: 360);
          return SingleChildScrollView(
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
                        "Pilih cara pembayaran",
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 11.0, horizontal: 2.0),
                                child: Text(
                                  "Cara Pembayaran",
                                  style: TextStyling.w600bold16black,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    va_active = !va_active!;
                                    credit_active = false;
                                    others_active = false;
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
                                        "Virtual Account",
                                        style: TextStyling.w600bold14black,
                                      ),
                                      Icon(va_active!
                                          ? Icons.arrow_drop_up_sharp
                                          : Icons.arrow_drop_down_sharp)
                                    ],
                                  ),
                                ),
                              ),
                              va_active!
                                  ? Column(
                                      children: data_va
                                          .map((e) => Row(
                                                children: [
                                                  Radio(
                                                      activeColor: const Color(
                                                          0xFF85014e),
                                                      value: data_va.indexOf(e),
                                                      groupValue: va_group_val,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          debugPrint(
                                                              'RADIO: $value');
                                                          va_group_val =
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
                                                    style:
                                                        TextStyling.w30013black,
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    )
                                  : Container(),
                              const VerticalSpacer(height: 5),
                              const Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              const VerticalSpacer(height: 5),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    va_active = false;
                                    credit_active = !credit_active!;
                                    others_active = false;
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
                                        "Kartu Kredit",
                                        style: TextStyling.w600bold14black,
                                      ),
                                      Icon(credit_active!
                                          ? Icons.arrow_drop_up_sharp
                                          : Icons.arrow_drop_down_sharp)
                                    ],
                                  ),
                                ),
                              ),
                              credit_active!
                                  ? Column(
                                      children: data_cc
                                          .map((e) => Row(
                                                children: [
                                                  Radio(
                                                      activeColor: const Color(
                                                          0xFF85014e),
                                                      value: data_cc.indexOf(e),
                                                      groupValue:
                                                          credit_group_val,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          credit_group_val =
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
                                                    style:
                                                        TextStyling.w30013black,
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    )
                                  : Container(),
                              const VerticalSpacer(height: 5),
                              const Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              const VerticalSpacer(height: 5),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    va_active = false;
                                    credit_active = false;
                                    others_active = !others_active!;
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
                                        "Pembayaran Lainnya",
                                        style: TextStyling.w600bold14black,
                                      ),
                                      Icon(others_active!
                                          ? Icons.arrow_drop_up_sharp
                                          : Icons.arrow_drop_down_sharp)
                                    ],
                                  ),
                                ),
                              ),
                              others_active!
                                  ? Column(
                                      children: data_ot
                                          .map((e) => Row(
                                                children: [
                                                  Radio(
                                                      activeColor: const Color(
                                                          0xFF85014e),
                                                      value: data_ot.indexOf(e),
                                                      groupValue:
                                                          others_group_val,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          others_group_val =
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
                                                    style:
                                                        TextStyling.w30013black,
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      const VerticalSpacer(height: 8),
                      widget.isRegister
                          ? Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 11.0, horizontal: 2.0),
                                      child: Text(
                                        "Kode Promo",
                                        style: TextStyling.w600bold16black,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: SizedBox(
                                            child: TextField(
                                              keyboardType: TextInputType.text,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              cursorColor: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              decoration: InputDecoration(
                                                hintText: "Masukkan Kode Promo",
                                                hintStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: const Color(0xFF1A1A1A)
                                                      .withOpacity(0.2494),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.w),
                                                  borderSide: BorderSide(
                                                    color:
                                                        const Color(0xFF1A1A1A)
                                                            .withOpacity(0.1),
                                                    width: 1.sp,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.w),
                                                  borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    width: 1.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const HorizontalSpacer(width: 15),
                                        Container(
                                          height: 49.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color(0xFF85014e)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Terapkan",
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const VerticalSpacer(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 11.0, horizontal: 2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Total Promo",
                                            style: TextStyling.w30013black,
                                          ),
                                          Text(
                                            "Rp.0",
                                            style: TextStyling.bold13black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      widget.isRegister
                          ? const VerticalSpacer(height: 10)
                          : Container(),
                      widget.isRegister
                          ? Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 11.0, horizontal: 2.0),
                                      child: Text(
                                        "Ringkasan Biaya",
                                        style: TextStyling.w600bold16black,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7.0, horizontal: 2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Iuran Pokok",
                                            style: TextStyling.w30013black,
                                          ),
                                          Text(
                                            "Rp.99.000",
                                            style: TextStyling.bold13black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7.0, horizontal: 2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Iuran Wajib",
                                            style: TextStyling.w30013black,
                                          ),
                                          Text(
                                            "Rp.199.000",
                                            style: TextStyling.bold13black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7.0, horizontal: 2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Promo",
                                            style: TextStyling.w30013black,
                                          ),
                                          Text(
                                            "Rp.0",
                                            style: TextStyling.bold13black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      child: Divider(
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 2.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Text(
                                            "Total Biaya",
                                            style: TextStyling.w30016black,
                                          ),
                                          Text(
                                            "Rp.298.000",
                                            style: TextStyling.w600bold16black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                      widget.isRegister
                          ? const VerticalSpacer(height: 20)
                          : Container(),
                      const VerticalSpacer(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => widget.nextPage),
                          );
                        },
                        child: const ButtonLanjutkan(),
                      ),
                      const VerticalSpacer(height: 20),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
