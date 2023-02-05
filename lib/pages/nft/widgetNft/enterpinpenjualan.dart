import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/dialog_alert.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/providers/ppob/provider_ppob_post.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../providers/nft/provider_nft.dart';

class EnterPinPejualanNFT extends StatefulWidget {
  Widget nextPage;
  bool isRegister, isAllowBack, isContainFunctionBack;
  String? title;
  String? nftSerialId;
  String? priceCoin;

  EnterPinPejualanNFT(
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
  State<EnterPinPejualanNFT> createState() => _EnterPinPejualanNFTState();
}

class _EnterPinPejualanNFTState extends State<EnterPinPejualanNFT> {
  String _pinValue = '';

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return dialogWidget(context) ?? false;
  }

  dialogWidget(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
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
                    const Divider(
                      color: Color.fromRGBO(88, 93, 93, 1),
                      height: 20,
                      thickness: 7,
                      indent: 140,
                      endIndent: 140,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Apakah Akan Membatalkan ',
                                style: TextStyling.w50018black),
                            const SizedBox(height: 18),
                            Image(
                              height: 100,
                              image: AssetImage('assets/images/logon.jpg'),
                            ),
                            const SizedBox(height: 18),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(
                                      text:
                                          'Lörem ipsum spemybelt tick, gödeskapet om lavaktig.Lörem ipsum spemybelt tick, gödeskapet om lavaktig.'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                          ],
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
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
                          child: const Text(
                            'Tetap Disini',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () {
                        int count = 0;
                        Navigator.popUntil(context, (route) {
                          return count++ == 2;
                        });
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              const EdgeInsets.only(right: 20.0, left: 20.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 70),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: const Text(
                            'Kembali',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
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
  }

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  bool? loading = false;

  submit(String _pinValue) async {
    final _getkategoriProvider =
        Provider.of<ProviderNft>(context, listen: false);
    await _getkategoriProvider.sellNft(
        context, widget.nftSerialId, widget.priceCoin, _pinValue);
    bool? statusSell = _getkategoriProvider.statusSell;
    print(statusSell);
    if (statusSell == true) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget.nextPage),
      );
    } else if (statusSell == false) {
      setState(() {
        loading = false;
        print('aa');
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
              const Text(
                'Masukkan PIN Kamu',
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
