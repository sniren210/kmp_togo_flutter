import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/providers/cart/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/account/provider_account.dart';

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
        body: BaseWidget<ProviderAccountInfo>(
            model: ProviderAccountInfo(Repository()),
            onModelReady: (model) => model.fetchAccountInfo(),
            child: Container(),
            builder: (context, model, child) {
              return Consumer<CartProvider>(
                  builder: (BuildContext context, provider, widget) {
                return Container(
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
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  model.items!.user.currentMember.name,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  model.items!.user.email,
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
                                ListTile(
                                  title: Text('Gender'),
                                  subtitle: Text(model.items!.user.currentMember
                                          .meta?.ktp.gender ??
                                      ''),
                                ),
                                ListTile(
                                  title: const Text('Tempat, Tanggal lahir'),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(model
                                          .items!.user.currentMember.birthPlace
                                          .toString()),
                                      Text(model
                                          .items!.user.currentMember.birthDate
                                          .toString()),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: const Text('Agama'),
                                  subtitle: Text(model.items!.user.currentMember
                                          .meta?.ktp.religion ??
                                      ''),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('Status perkawinan'),
                                  subtitle: Text(model.items!.user.currentMember
                                          .meta?.ktp.maritalStatus ??
                                      ''),
                                ),
                                ListTile(
                                    title: Text('pekerjaan'),
                                    subtitle: Text(model.items!.user
                                            .currentMember.meta?.ktp.work ??
                                        '')),
                                ListTile(
                                  title: Text('Kewarganegaraan'),
                                  subtitle: Text(model.items!.user.currentMember
                                          .meta?.ktp.nationnality ??
                                      ''),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        title: Text('alamat'),
                        subtitle: Builder(builder: (context) {
                          String address =
                              '${model.items!.user.currentMember.meta?.ktp.address} ${model.items!.user.currentMember.meta?.ktp.rt} ${model.items!.user.currentMember.meta?.ktp.rw} ${model.items!.user.currentMember.meta?.ktp.village} ${model.items!.user.currentMember.meta?.ktp.district} ${model.items!.user.currentMember.meta?.ktp.city}';
                          return Text(address);
                        }),
                      ),
                      if (model.items!.user.currentMember.accountNumber != null)
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(model.items!.user.currentMember.otherBank
                                  .toString()),
                              Text(model.items!.user.currentMember.name),
                            ],
                          ),
                          subtitle: Text(nomorRekening.toString()),
                          trailing: InkWell(
                            onTap: () {
                              _showSimpleModalDialog(
                                  context, nomorRekening, true);
                            },
                            child: const Icon(Icons.edit),
                          ),
                        )
                      else
                        ListTile(
                          title: Text('Tambahkan akun bank'),
                          trailing: InkWell(
                            onTap: () {
                              _showSimpleModalDialog(
                                  context, nomorRekening, false);
                            },
                            child: const Icon(Icons.add),
                          ),
                        )
                    ],
                  ),
                );
              });
            }),
      ),
    );
  }
}

_showSimpleModalDialog(context, int bankAccount, bool isEdit) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.37,
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
                        readOnly: true,
                        controller: TextEditingController(
                          text: "Artha Graha Internasional",
                        ),
                        decoration: new InputDecoration(
                          enabled: false,
                          hintText: "pilih Bank",
                          labelText: "Pilih Bank anda",
                          icon: const Icon(Icons.note),
                        ),
                      ),
                      TextFormField(
                        controller: TextEditingController(
                            // text: "Inky Pramudira Ramdhani",
                            ),
                        decoration: new InputDecoration(
                          hintText: "Masukan Nama",
                          labelText: "Masukan Nama anda",
                          icon: const Icon(Icons.account_circle_rounded),
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
                        child: Text(isEdit ? 'Update' : 'Tambah'),
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
