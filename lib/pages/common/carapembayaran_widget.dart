import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';

class CaraPembayaranWidget extends StatelessWidget {
  const CaraPembayaranWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Cara Pembayaran', style: TextStyling.w50018black),
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    const Text('Melalui ATM', style: TextStyling.w50015black),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('1.', style: TextStyling.w30013black),
                                HorizontalSpacer(width: 4),
                                Flexible(
                                  child: Text(
                                      'Lörem ipsum spemybelt tick, gödeskapet om lavaktig',
                                      style: TextStyling.w30013black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('2.', style: TextStyling.w30013black),
                                HorizontalSpacer(width: 4),
                                Flexible(
                                  child: Text(
                                      'Lörem ipsum spemybelt tick, gödeskapet om lavaktig',
                                      style: TextStyling.w30013black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('3.', style: TextStyling.w30013black),
                                HorizontalSpacer(width: 4),
                                Flexible(
                                  child: Text('Lörem ipsum ',
                                      style: TextStyling.w30013black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('4.', style: TextStyling.w30013black),
                                HorizontalSpacer(width: 4),
                                Flexible(
                                  child: Text(
                                      'Lörem ipsum spemybelt tick, gödeskapet om',
                                      style: TextStyling.w30013black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('5.', style: TextStyling.w30013black),
                                HorizontalSpacer(width: 4),
                                Flexible(
                                  child: Text('Lörem ipsum spemybelt tick',
                                      style: TextStyling.w30013black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Melalui M-Banking',
                        style: TextStyling.w50015black),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('1.', style: TextStyling.w30013black),
                                HorizontalSpacer(width: 4),
                                Flexible(
                                  child: Text(
                                      'Lörem ipsum spemybelt tick, gödeskapet om lavaktig',
                                      style: TextStyling.w30013black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('2.', style: TextStyling.w30013black),
                                HorizontalSpacer(width: 4),
                                Flexible(
                                  child: Text(
                                      'Lörem ipsum spemybelt tick, gödeskapet om lavaktig',
                                      style: TextStyling.w30013black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('4.', style: TextStyling.w30013black),
                                HorizontalSpacer(width: 4),
                                Flexible(
                                  child: Text('Lörem ipsum ',
                                      style: TextStyling.w30013black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('3.', style: TextStyling.w30013black),
                                HorizontalSpacer(width: 4),
                                Flexible(
                                  child: Text(
                                      'Lörem ipsum spemybelt tick, gödeskapet om',
                                      style: TextStyling.w30013black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('4.', style: TextStyling.w30013black),
                                HorizontalSpacer(width: 4),
                                Flexible(
                                  child: Text('Lörem ipsum spemybelt tick',
                                      style: TextStyling.w30013black),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ));
  }
}
