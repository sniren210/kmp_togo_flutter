import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profileDetail extends StatelessWidget {
  const profileDetail({super.key});

  final int nomorRekening = 353636;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        // appBar: AppBar(
        //   title: Text("Nama gue nih bro"),
        //   centerTitle: true,
        //   backgroundColor: Theme.of(context).primaryColor,
        // ),
        body: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(120),
                        bottomRight: Radius.circular(120),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Inky Pramudia Ramdhani',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'id: 97867674354',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.account_circle,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text('Gender'),
                          subtitle: Text('laki"'),
                        ),
                        ListTile(
                          title: const Text('Tempat, Tanggal lahir'),
                          subtitle: Row(
                            children: const [
                              Text('Majalengka'),
                              Text('20-11-2003'),
                            ],
                          ),
                        ),
                        const ListTile(
                          title: Text('Agama'),
                          subtitle: Text('ISLAM"'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        ListTile(
                          title: Text('Status perkawinan'),
                          subtitle: Text('jomblo'),
                        ),
                        ListTile(
                            title: Text('pekerjaan'), subtitle: Text('PNS')),
                        ListTile(
                          title: Text('Kewarganegaraan'),
                          subtitle: Text('WNI'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const ListTile(
                title: Text('alamat'),
                subtitle: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
              ),
              ListTile(
                title: const Text('-nama bank- a/n Inky ddaaa jdkd'),
                subtitle: Text(nomorRekening.toString()),
                trailing: InkWell(
                  onTap: () {
                    _showSimpleModalDialog(context, nomorRekening);
                  },
                  child: const Icon(Icons.edit),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

_showSimpleModalDialog(context, int bankAccount) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: Text(
                          'Edit Your bank account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: TextEditingController(
                          text: "nama bank",
                        ),
                        decoration: new InputDecoration(
                          hintText: "pilih Bank",
                          labelText: "Pilih Bank anda",
                          icon: const Icon(Icons.note),
                        ),
                      ),
                      TextFormField(
                        controller: TextEditingController(
                          text: bankAccount.toString(),
                        ),
                        decoration: new InputDecoration(
                          hintText: "Nomor Rekengin",
                          labelText: "Masukan Nomor Rekening anda",
                          icon: const Icon(Icons.numbers),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Update'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
