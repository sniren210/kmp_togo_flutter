import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/splashPage.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/pages/profile/address/tambahAlamatPage.dart';
import 'package:kmp_togo_mobile/providers/address/provider_addressBook.dart';
import 'package:sizer/sizer.dart';

class AlamatPage extends StatefulWidget {
  const AlamatPage({Key? key}) : super(key: key);

  @override
  State<AlamatPage> createState() => _AlamatPageState();
}

class _AlamatPageState extends State<AlamatPage> {
  // fetchAddressBook
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ProviderAddressBook>(
        model: ProviderAddressBook(Repository()),
        onModelReady: (model) => model.fetchAddressBook(),
        child: Container(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Alamat Marketplace',
              ),
            ),
            body: model.busy
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.items!.data.length,
                        itemBuilder: (_, int index) {
                          final itemAddress = model.items!.data[index];

                          return InkWell(
                            onTap: () {
                              showDialog(
                                  useSafeArea: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return dialogAddressWidget(
                                      id: itemAddress.id,
                                      name: itemAddress.name,
                                      contactName: itemAddress.contactName,
                                      phoneNumber: itemAddress.phoneNumber,
                                      detailAddress: itemAddress.detailAddress,
                                      provinceId: itemAddress.provinceId,
                                      cityId: itemAddress.cityId,
                                      subdistrictId: itemAddress.subdistrictId,
                                      postalCode: itemAddress.postalCode,
                                      latitude: itemAddress.latitude,
                                      longitude: itemAddress.longitude,
                                      geometry: itemAddress.geometry,
                                    );
                                  });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                    'Rendi Dwi kurniasandi',
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        overflow: TextOverflow
                                                            .ellipsis)),
                                              ),
                                              Text(' | '),
                                              Expanded(
                                                child: Text(
                                                  '0823237881628',
                                                  style: TextStyle(
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Consequat ex ut officia et ullamco.Voluptate ea eu officia non labore incididunt labore id ullamco officia sit aute. Pariatur labore laboris veniam irure culpa nisi veniam sint ullamco reprehenderit eu dolor reprehenderit et.',
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.edit),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text('Ubah'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const TambahAlamatPage();
                  }),
                );
              },
              child: const Icon(Icons.add),
            ),
          );
        });
  }

  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  Widget dialogAddressWidget(
      {required int id,
      required String name,
      required String contactName,
      required String phoneNumber,
      required String detailAddress,
      required int provinceId,
      required int cityId,
      required int subdistrictId,
      required String postalCode,
      required latitude,
      required longitude,
      required geometry}) {
    TextEditingController contactNameC =
        TextEditingController(text: contactName);
    TextEditingController phoneNumberC =
        TextEditingController(text: phoneNumber);
    TextEditingController detailAddressC =
        TextEditingController(text: detailAddress);

    return AlertDialog(
      scrollable: true,
      title: Text(name),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: contactNameC,
                maxLength: 50,
                minLines: 1,
                keyboardType: TextInputType.text,
                maxLines: 3,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                controller: phoneNumberC,
                maxLength: 13,
                minLines: 1,
                keyboardType: TextInputType.number,
                maxLines: 1,
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFormField(
                controller: detailAddressC,
                maxLength: 200,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              SizedBox(
                height: 2.h,
              ),
              // DropdownButtonFormField(
              //   isExpanded: true,
              //   icon: const Icon(Icons.arrow_drop_down),
              //   value: widget.dropdownValue,
              //   items: widget.dropList!.map((value) {
              //     return DropdownMenuItem(
              //       child: Text(value),
              //       value: value,
              //     );
              //   }).toList(),
              //   onChanged: (value) {
              //     setState(() {
              //       widget.dropdownValue = value.toString();
              //     });
              //   },
              // ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            child: const Text('Update'),
            onPressed: () {
              print('LEO: ${phoneNumberC.text}');
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SplashPage(
                          pinValue: sharedPreferencesManager
                                  .getString(SharedPreferencesManager.pin) ??
                              '',
                          title: 'Berhasil Menambahkan',
                          subtitle: '',
                          provRepo: 'addressNew',
                          nextPage: Home(selectedIndex: 3),
                          id: id,
                          isReplace: false,
                          isUpdate: true,
                          name: name,
                          contactName: contactNameC.text,
                          phoneNumber: phoneNumberC.text,
                          detailAddress: detailAddressC.text,
                          provinceId: provinceId,
                          cityId: cityId,
                          subdistrictId: subdistrictId,
                          postalCode: postalCode,
                        )),
              );
            })
      ],
    );
  }
}
