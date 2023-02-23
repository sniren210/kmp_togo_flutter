import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReferalPage extends StatefulWidget {
  const ReferalPage({super.key});

  @override
  State<ReferalPage> createState() => _ReferalPageState();
}

class _ReferalPageState extends State<ReferalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pendapatan referal'),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total: Rp. 200.000',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: const [
          // Card(
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.monetization_on_outlined,
          //       size: 40,
          //     ),
          //     title: Text('Pendaftaran: 094082380'),
          //     subtitle: Text('Rp. 50.000'),
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.monetization_on_outlined,
          //       size: 40,
          //     ),
          //     title: Text('Transaksi: 308390489'),
          //     subtitle: Text('Rp. 50.000'),
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.monetization_on_outlined,
          //       size: 40,
          //     ),
          //     title: Text('Pendaftaran: 3049839'),
          //     subtitle: Text('Rp. 50.000'),
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.monetization_on_outlined,
          //       size: 40,
          //     ),
          //     title: Text('Transaksi: 09384209'),
          //     subtitle: Text('Rp. 50.000'),
          //   ),
          // )
        ],
      ),
    );
  }
}
