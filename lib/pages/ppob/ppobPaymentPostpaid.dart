import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/models/ppob/PPOBCheckOut.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/buySuccessPage.dart';
import 'package:kmp_togo_mobile/pages/common/pinPage.dart';
import 'package:kmp_togo_mobile/pages/common/splashPage.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/account/provider_account.dart';
import 'package:kmp_togo_mobile/providers/ppob/provider_ppob_post.dart';

class PPOBPaymentPostPaid extends StatefulWidget {
  final String code;
  final String product;
  final String customer_id;

  const PPOBPaymentPostPaid(
      {Key? key,
      required this.code,
      required this.product,
      required this.customer_id})
      : super(key: key);

  @override
  State<PPOBPaymentPostPaid> createState() => _PPOBPaymentPostPaidState();
}

class _PPOBPaymentPostPaidState extends State<PPOBPaymentPostPaid>
    with NumberFormatMachine {
  int? groupValue = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProviderPostpaidInquery>(
      model: ProviderPostpaidInquery(Repository()),
      onModelReady: (model) =>
          model.fetchPostPaidInquery(widget.code, widget.customer_id),
      child: Container(),
      builder: (context, model, child) => BaseWidget<ProviderAccountInfo>(
        model: ProviderAccountInfo(Repository()),
        onModelReady: (model) => model.fetchAccountInfo(),
        child: Container(),
        builder: (context, model2, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF85014e),
            title: Text('${widget.product.toUpperCase()} Inquery'),
          ),
          body: model.busy || model2.busy
              ? const Center(child: CircularProgressIndicator())
              : LayoutBuilder(
                  builder: (context, constraints) {
                    final dataInquery = model.items!.data;

                    if (dataInquery.responseCode == '00') {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 80,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/logon.jpg'),
                                        fit: BoxFit.fitHeight,
                                      )),
                                      alignment: Alignment.center,
                                    ),
                                    const HorizontalSpacer(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(dataInquery.trName!,
                                            style: TextStyling.w600bold16black),
                                        const VerticalSpacer(height: 7),
                                        Text(
                                            model.items.runtimeType
                                                        .toString() ==
                                                    'ItemModelPostPaidInquery'
                                                ? dataInquery.desc.pdamName
                                                : dataInquery.desc!.bill.detail
                                                    .first.period,
                                            style: TextStyling.w40014black),
                                        // const VerticalSpacer(height: 7),
                                        // Row(
                                        //   children: [
                                        //     const Icon(Icons.currency_bitcoin,
                                        //         size: 14),
                                        //     const Text(' Poin',
                                        //         style: TextStyling.w40014black),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const VerticalSpacer(height: 8),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Detail Pembayaran",
                                          style: TextStyling.w600bold16black,
                                        ),
                                      ],
                                    ),
                                    const VerticalSpacer(height: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 7.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Biaya",
                                                style: TextStyling.w30013black,
                                              ),
                                              Text(
                                                "${getNumberFormatSeparator(dataInquery.nominal!.toDouble())} Poin",
                                                style: TextStyling.bold13black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 7.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Biaya Admin",
                                                style: TextStyling.w30013black,
                                              ),
                                              Text(
                                                "${getNumberFormatSeparator(dataInquery.admin!.toDouble())} Poin",
                                                style: TextStyling.bold13black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.0),
                                          child: Divider(
                                            height: 1,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Total Biaya",
                                                style: TextStyling.w50015black,
                                              ),
                                              Text(
                                                "${getNumberFormatSeparator(dataInquery.price!.toDouble())} Poin",
                                                style:
                                                    TextStyling.w600bold16black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const VerticalSpacer(height: 8),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const VerticalSpacer(height: 8),
                                    const Text('Metode Pembayaran NFT',
                                        style: TextStyling.w600bold16black),
                                    const VerticalSpacer(height: 18),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Radio(
                                            value: 0,
                                            groupValue: groupValue,
                                            onChanged: (value) {
                                              setState(() {
                                                groupValue = value as int?;
                                              });
                                            }),
                                        const HorizontalSpacer(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text('Poin Kamu',
                                                style: TextStyling.w40014black),
                                            const VerticalSpacer(height: 12),
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons.currency_exchange,
                                                    size: 16),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                      '${getNumberFormatSeparator(0)} Poin Kamu',
                                                      // '${getNumberFormatSeparator(model2.items!.data.tokenWallet.token)} Poin Kamu',
                                                      style: TextStyling
                                                          .w40014black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const VerticalSpacer(height: 30),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color(
                                                            0xFF85014e)),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        const EdgeInsets
                                                                .symmetric(
                                                            vertical: 15,
                                                            horizontal: 70)),
                                              ),
                                              child: const Text("Beli Sekarang",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white)),
                                              onPressed: () {
                                                final SharedPreferencesManager
                                                    sharedPreferencesManager =
                                                    locator<
                                                        SharedPreferencesManager>();

                                                CheckOutBody(
                                                  code: model.items!.data.code,
                                                  tipe: widget.product,
                                                  customerId:
                                                      widget.customer_id,
                                                );

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                    return EnterPinPage(
                                                        isAllowBack: true,
                                                        nextPage: SplashPage(
                                                            pinValue: sharedPreferencesManager
                                                                    .getString(
                                                                        SharedPreferencesManager
                                                                            .pin) ??
                                                                '',
                                                            ppob_code: model
                                                                .items!.data.code,
                                                            ppob_tipe:
                                                                widget.product,
                                                            ppob_customer_id:
                                                                widget
                                                                    .customer_id,
                                                            nextPage:
                                                                BuySuccessPage(
                                                              nextPage: Home(),
                                                              title:
                                                                  'Berhasil Membayar',
                                                              subtitle: '',
                                                            ),
                                                            title:
                                                                'Berhasil Membayar',
                                                            subtitle: '',
                                                            provRepo:
                                                                'postpaid_checkout',
                                                            model: null,
                                                            isReplace: false),
                                                        isContainFunctionBack:
                                                            true,
                                                        title:
                                                            'Konfirmasi Pembelian');
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(dataInquery.message!),
                      );
                    }
                  },
                ),
        ),
      ),
    );
  }
}
