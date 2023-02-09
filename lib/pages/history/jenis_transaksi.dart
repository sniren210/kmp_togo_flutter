import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/src/widgets/framework.dart';

import 'history.dart';

class jenisTransaksi extends StatefulWidget {
  const jenisTransaksi({super.key});

  @override
  State<jenisTransaksi> createState() => _jenisTransaksiState();
}

class _jenisTransaksiState extends State<jenisTransaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                SizedBox(height: 20),
                listJenisProduct(
                  title: 'ppob',
                ),
                listJenisProduct(
                  title: 'marketplace',
                ),
                listJenisProduct(
                  title: 'poin',
                ),
                listJenisProduct(
                  title: 'nft',
                ),
                listJenisProduct(
                  title: 'ppm',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class listJenisProduct extends StatelessWidget {
  const listJenisProduct({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              'P',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => History()),
            );
          },
        ),
      ),
    );
  }
}
