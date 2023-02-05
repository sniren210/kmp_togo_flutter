import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';

class DialogAlertHelper {
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
                          children: const [
                            Text('Apakah Akan Membatalkan',
                                style: TextStyling.w50018black),
                            SizedBox(height: 18),
                            Image(
                              height: 100,
                              image: AssetImage('assets/images/logon.jpg'),
                            ),
                            SizedBox(height: 18),
                            Text(
                                'Lörem ipsum pseudonukronar dikede. Snippa. Trahud geongen tranav polygen som kas. Köttberg ende divös dess inte åsiktskorridor. Falos tins mansplaining rirtad.',
                                textAlign: TextAlign.center,
                                style: TextStyling.w30013black),
                            SizedBox(height: 18),
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
}

final dialogHelper = DialogAlertHelper();
