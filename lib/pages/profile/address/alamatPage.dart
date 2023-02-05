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
                'Alamat Saya',
              ),
            ),
            body: model.busy
                ? Container()
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.items!.data.length,
                    itemBuilder: (_, int index) {
                      final itemAddress = model.items!.data[index];

                      return Slidable(
                        key: const ValueKey(0),
                        enabled: false,
                        startActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),

                          // A pane can dismiss the Slidable.
                          dismissible: DismissiblePane(onDismissed: () {
                            print('LEO::');
                          }),

                          // All actions are defined in the children parameter.
                          children: [
                            // A SlidableAction can have an icon and/or a label.
                            // SlidableAction(
                            //   onPressed: (_) {},
                            //   backgroundColor: Color(0xFFFE4A49),
                            //   foregroundColor: Colors.white,
                            //   icon: Icons.delete,
                            //   label: 'Delete',
                            // ),
                            // SlidableAction(
                            //   onPressed: (_) {},
                            //   backgroundColor: Color(0xFF21B7CA),
                            //   foregroundColor: Colors.white,
                            //   icon: Icons.share,
                            //   label: 'Share',
                            // ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InkWell(
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
                              height: 90,
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(itemAddress.name,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: 300,
                                            alignment: Alignment.topLeft,
                                            child: Text(itemAddress.name),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Icon(Icons.location_on_outlined)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
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
                decoration: const InputDecoration(
                  icon: Icon(Icons.contact_phone),
                ),
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
                decoration: const InputDecoration(
                  icon: Icon(Icons.house),
                ),
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
