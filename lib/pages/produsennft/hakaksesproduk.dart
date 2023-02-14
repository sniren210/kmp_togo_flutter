import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:provider/provider.dart';

class HakAksesProduk extends StatefulWidget {
  int? storeId;
  HakAksesProduk({super.key, this.storeId});

  @override
  State<HakAksesProduk> createState() => _HakAksesProdukState();
}

class _HakAksesProdukState extends State<HakAksesProduk> {
  final _formKey = GlobalKey<FormState>();
  bool passhide = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool? isLoading = false;

  submitHakAksesNFT(String? username, String? password) async {
    if (username == '') {
      isLoading = false;
      await customSnackbar(type: 'error', title: 'nama belum diisi', text: '');
    } else if (password == '') {
      isLoading = false;
      await customSnackbar(
          type: 'error', title: 'deskripsi belum diisi', text: '');
    } else {
      await Provider.of<ProviderNft>(context, listen: false).submitHakAkses(
        context,
        widget.storeId,
        username,
        password,
      );
      setState(() {
        isLoading = Provider.of<ProviderNft>(context, listen: false)
            .loadinggethakasesnft;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40, top: 70),
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/logon.jpg'))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      padding: const EdgeInsets.only(top: 70, left: 20),
                      decoration: const BoxDecoration(),
                      child: const Text(
                        'Kelola Hak Akses',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18),
                      )),
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    child: const Text(
                      'Lörem ipsum putinas eurobävning, pohöpas trev. Odade global hektar rere i biohögån ultras. ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 20.0, left: 20),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Please Enter Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (username) {
                    if (username!.isEmpty) {
                      return "You must enter username";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                margin: const EdgeInsets.only(right: 20.0, left: 20),
                child: TextFormField(
                  obscureText: passhide,
                  controller: passcontroller,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Please Enter Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          icon: Icon(passhide
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              passhide = !passhide;
                            });
                          })),
                  validator: (password) {
                    if (password!.isEmpty) {
                      return "You must enter password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              isLoading == false
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isLoading = true;
                        });
                        submitHakAksesNFT(
                          nameController.text,
                          passcontroller.text,
                        );
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              right: 20.0, left: 20.0, top: 40),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 70),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF85014e)),
                          child: const Text(
                            'Simpan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          right: 20.0, left: 20.0, top: 40),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 70),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF85014e)),
                      child: const Text(
                        'Waiting...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
