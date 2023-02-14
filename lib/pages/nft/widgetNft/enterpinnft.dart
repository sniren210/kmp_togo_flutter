import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/dialog_alert.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/providers/ppob/provider_ppob_post.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../providers/nft/provider_nft.dart';

class EnterPinNFT extends StatefulWidget {
  Widget nextPage;
  bool isRegister, isAllowBack, isContainFunctionBack;
  String? title;
  String? nftSerialId;
  String? priceCoin;

  EnterPinNFT(
      {Key? key,
      required this.nextPage,
      required this.isRegister,
      required this.isAllowBack,
      required this.nftSerialId,
      required this.priceCoin,
      required this.isContainFunctionBack,
      this.title})
      : super(key: key);

  @override
  State<EnterPinNFT> createState() => _EnterPinNFTState();
}

class _EnterPinNFTState extends State<EnterPinNFT> {
  String _pinValue = '';
  bool? loading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return dialogHelper.dialogWidget(context) ?? false;
  }

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  submit(String _pinValue) async {
    final _getkategoriProvider =
        Provider.of<ProviderNft>(context, listen: false);
    await _getkategoriProvider.sendPaymentNft(
        context, widget.nftSerialId, widget.priceCoin, _pinValue);
    bool? statuspayment = _getkategoriProvider.statusPayment;
    if (statuspayment == true) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget.nextPage),
      );
    } else if (statuspayment == false) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.isContainFunctionBack ? _onWillPop : () async => true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 5.h),
                height: 25.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/logon.jpg'))),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                widget.title != null
                    ? widget.title!
                    : '${widget.isRegister ? 'Buat' : 'Masukkan'} Pin Akunmu',
                textAlign: TextAlign.center,
                style: TextStyling.titleStyle,
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: const Text(
                    'Pin ini digunakan untuk, Lörem ipsum mar hälsolitteracitet i nirat. Gijånade homosm.',
                    textAlign: TextAlign.center,
                    style: TextStyling.normal15grey),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Pinput(
                  length: 6,
                  obscureText: true,
                  onChanged: (pin) async {
                    await sharedPreferencesManager.setString(
                        SharedPreferencesManager.pin, pin);

                    setState(() {
                      _pinValue = pin;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              loading == false
                  ? InkWell(
                      onTap: () async {
                        submit(_pinValue);
                        setState(() {
                          loading = true;
                        });
                        // } else {
                        //   await customSnackbar(
                        //       type: 'error',
                        //       title: 'error',
                        //       text: 'PIN Salah, silahkan coba lagi');
                        // }
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              const EdgeInsets.only(right: 20.0, left: 20.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 70),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFF85014e)),
                          child: Text(
                            widget.title != null
                                ? widget.title!
                                : '${widget.isRegister ? 'Buat' : 'Masukkan'} Pin',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 70),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey),
                      child: Center(
                        child: SizedBox(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          height: 2.h,
                          width: 4.w,
                        ),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
