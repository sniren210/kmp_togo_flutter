import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/ppob/pinppob.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:sizer/sizer.dart';

class ScanPagePembayaran extends StatefulWidget {
  ScanPagePembayaran({Key? key}) : super(key: key);

  @override
  State<ScanPagePembayaran> createState() => _ScanPagePembayaranState();
}

class _ScanPagePembayaranState extends State<ScanPagePembayaran> {
  TextEditingController nominal = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool validate = false;
  TextEditingController token = TextEditingController();

  _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        validate = true;
      });
      debugPrint(validate.toString());
    } else {
      debugPrint(validate.toString());
    }
  }

//
  nextpage() {
    if (validate == true) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PinPpob(isScan: true)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          height: context.height,
          width: context.width,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacer(height: 1.5.h),
                    Padding(
                      padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
                      child: Text(
                        'Nominal',
                        style: TextStyling.w600bold16grey,
                      ),
                    ),
                    TextFormField(
                      controller: token,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        print(value);
                        if (value!.isEmpty) {
                          return 'Field wajib diisi';
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
                          Icons.monetization_on,
                        ),
                        hintText: 'Poin',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    VerticalSpacer(height: 3.0.h),
                    Text('Walet Tujuan', style: TextStyling.w600bold14grey),
                    VerticalSpacer(height: 1.5.h),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: Text('SF', style: TextStyling.w600bold14white),
                        ),
                        HorizontalSpacer(width: 3.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sofana Furniture',
                                style: TextStyling.w600bold14black),
                            Text('(A91JIJA291)',
                                style: TextStyling.w600bold14grey),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: InkWell(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PinPpob(isScan: true)));
                      // await _submit();
                      // nextpage();
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
                            fontSize: 15,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
