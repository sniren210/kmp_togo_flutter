import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/pages/wallet/topup/topupPayment.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';

class TopUpPage extends StatefulWidget {
  TopUpPage({Key? key}) : super(key: key);

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  TextEditingController nominal = TextEditingController();
  bool saldokosong = false;

  checkSaldo(nominalA) {
    if (nominalA == '') {
      setState(() {
        saldokosong = true;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProsesPembayaranTopUp(
                isTopup: true,
                popContext: 1,
                nominal: int.parse(nominal.text))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
          child: Row(
            children: [
              Icon(
                Icons.monetization_on,
                size: 7.w,
              ),
              Container(
                margin: EdgeInsets.only(left: 2.w),
                child: Text(
                  'Top Up Saldo',
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          height: context.height,
          width: context.width,
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: const Color(0xFF85014e))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 3.w),
                            child: Text(
                              "Nominal",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 138, 111, 111),
                                  fontSize: 9.sp),
                            )),
                        Container(
                          margin: EdgeInsets.only(
                            left: 3.w,
                          ),
                          child: TextFormField(
                            controller: nominal,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                prefixIconConstraints:
                                    BoxConstraints(minWidth: 3.w),
                                prefixIcon: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Rp. ',
                                      style: TextStyle(fontSize: 13.sp),
                                    )
                                  ],
                                ),
                                border: InputBorder.none,
                                // contentPadding:
                                //     const EdgeInsets.symmetric(vertical: 20),
                                suffixIcon: Icon(
                                  Icons.monetization_on,
                                  size: 7.w,
                                )),
                          ),
                        ),
                        saldokosong == false
                            ? Container()
                            : Container(
                                margin: EdgeInsets.only(
                                  left: 3.w,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 3.w),
                                        child: Text(
                                          "Saldo tidak boleh kosong!",
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 138, 111, 111),
                                              fontSize: 9.sp),
                                        )),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  checkSaldo(nominal.text);
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 4.h),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 70),
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
      ),
    );
  }
}
