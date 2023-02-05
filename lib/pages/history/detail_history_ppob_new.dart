import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/components/addspace.dart';
import 'package:kmp_togo_mobile/helpers/rupiah_format.dart';

class DetailHistoryPpobPage extends StatefulWidget {
  String? customerId, total, subTotal, gasfee, title, noPesanan, date, status;
  DetailHistoryPpobPage(
      {this.customerId,
      this.total,
      this.subTotal,
      this.gasfee,
      this.title,
      this.date,
      this.status,
      this.noPesanan});

  @override
  State<DetailHistoryPpobPage> createState() => _DetailHistoryPpobPageState();
}

class _DetailHistoryPpobPageState extends State<DetailHistoryPpobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Rincian Pesanan')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.green,
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.status.toString().toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        addHeight(5),
                        Text(
                          'Pesanan ${widget.status}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.white),
                        ),
                      ],
                    ),
                    // const Icon(
                    //   Icons.thumb_up_alt_outlined,
                    //   color: Colors.white,
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        children: [
                          // SizedBox(
                          //   // color: Colors.red,
                          //   width: 30,
                          //   height: 30,
                          //   child: Image.network(
                          //     'https://upload.wikimedia.org/wikipedia/id/thumb/5/55/XL_logo_2016.svg/640px-XL_logo_2016.svg.png',
                          //     fit: BoxFit.contain,
                          //   ),
                          // ),
                          // addWidth(20),
                          Expanded(child: Text(widget.title.toString()))
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Customer Id'),
                          Text(widget.customerId!)
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Harga'),
                          Text(
                            '${RpFormat.idr(int.parse(widget.subTotal.toString()))} Poin',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF85014e),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              Divider(
                height: 0,
                color: Colors.grey[300],
                thickness: 10,
              ),
              addHeight(10),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('No. Pesanan'),
                          Text(
                            widget.noPesanan.toString(),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: const [
              //             Text('No. Serial'),
              //             Text(
              //               '7827384728734972973499234',
              //             )
              //           ],
              //         ),
              //       ),
              //       const Divider(),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Waktu Pesanan'),
                          Text(
                            DateTime.parse(widget.date.toString())
                                .toLocal()
                                .toString(),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              Divider(
                height: 0,
                color: Colors.grey[300],
                thickness: 10,
              ),
              addHeight(10),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.attach_money,
                            color: Color(0xFF85014e),
                          ),
                          addWidth(20),
                          const Expanded(
                              child: Text(
                            'Informasi Pembayaran',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Harga'),
                          Text(
                            '${RpFormat.idr(int.parse(widget.subTotal.toString()))} Poin',
                            // getNumberFormatSeparator(
                            //     widget.subTotal.toString()),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('GasFee'),
                          Text(
                            widget.gasfee.toString(),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Pembayaran'),
                          Text(
                            widget.total.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF85014e),
                            ),
                          )
                        ],
                      ),
                    ),
                    addHeight(20),
                  ],
                ),
              ),
              Divider(
                height: 0,
                color: Colors.grey[300],
                thickness: 10,
              ),
              addHeight(10),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.credit_card,
                            color: Color(0xFF85014e),
                          ),
                          addWidth(20),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Metode Pembayaran',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              addHeight(5),
                              const Text(
                                'Poin',
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
