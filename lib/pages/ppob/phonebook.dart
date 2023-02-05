import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PhoneBook extends StatefulWidget {
  var contact;
  PhoneBook({this.contact});

  @override
  State<PhoneBook> createState() => _PhoneBookState();
}

class _PhoneBookState extends State<PhoneBook> {
  bool? loading = true;
  Future<void> _askPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      final snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      final snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  List<Contact>? contactsA;
  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      contactsA = await ContactsService.getContacts();
      if (contactsA != null) {
        setState(() {
          loading = false;
        });
      } else {
        setState(() {
          loading = false;
        });
      }
      setState(() {});
      return permission;
    }
  }

  getList() async {
    contactsA = await ContactsService.getContacts();
    if (contactsA != null) {
      setState(() {
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _askPermissions();
    _getContactPermission();
    getList();
  }

  TextEditingController _cariC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Phonebook'),
        ),
        body: loading == false
            ? Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 12),
                    child: TextField(
                      controller: _cariC,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                        ),
                        hintText: 'Cari Kontak...',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  // for (var i = 0; i < contactsA!.length; i++)
                  Expanded(
                    child: ListView.builder(
                        itemCount: contactsA!.length,
                        itemBuilder: (context, int i) {
                          if (_cariC.text.isNotEmpty) {
                            if (contactsA![i]
                                .displayName!
                                .toLowerCase()
                                .contains(_cariC.text.toLowerCase())) {
                              return Card(
                                margin: EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10),
                                child: InkWell(
                                  onTap: () {
                                    if (contactsA![i].phones!.isNotEmpty) {
                                      Navigator.pop(context,
                                          contactsA?[i].phones?.first.value);
                                    } else {
                                      print('nothing');
                                    }
                                  },
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.phone,
                                      color: const Color(0xFF85014e),
                                    ),
                                    title:
                                        Text(contactsA?[i].displayName ?? ""),
                                    subtitle: contactsA![i].phones!.isNotEmpty
                                        ? Text(
                                            contactsA?[i].phones?.first.value ??
                                                "")
                                        : Text('-'),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          } else {
                            return Card(
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
                              child: InkWell(
                                onTap: () {
                                  if (contactsA![i].phones!.isNotEmpty) {
                                    Navigator.pop(context,
                                        contactsA?[i].phones?.first.value);
                                  } else {
                                    print('nothing');
                                  }
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.phone,
                                    color: const Color(0xFF85014e),
                                  ),
                                  title: Text(contactsA?[i].displayName ?? ""),
                                  subtitle: contactsA![i].phones!.isNotEmpty
                                      ? Text(
                                          contactsA?[i].phones?.first.value ??
                                              "")
                                      : Text('-'),
                                ),
                              ),
                            );
                          }
                        }),
                  )

                  // Card(
                  //   margin:
                  //       EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  //   child: InkWell(
                  //     onTap: () {
                  //       if (contactsA![i].phones!.isNotEmpty) {
                  //         Navigator.pop(
                  //             context, contactsA?[i].phones?.first.value);
                  //       } else {
                  //         print('nothing');
                  //       }
                  //     },
                  //     child: ListTile(
                  //       leading: Icon(
                  //         Icons.phone,
                  //         color: const Color(0xFF85014e),
                  //       ),
                  //       title: Text(contactsA?[i].displayName ?? ""),
                  //       subtitle: contactsA![i].phones!.isNotEmpty
                  //           ? Text(contactsA?[i].phones?.first.value ?? "")
                  //           : Text('-'),
                  //     ),
                  //   ),
                  // ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
