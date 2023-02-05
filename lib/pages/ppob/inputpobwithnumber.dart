import 'dart:async';
import 'package:contacts_service/contacts_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:kmp_togo_mobile/apis/repository.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/models/ppob/prepaid/PrePaidPhonePrefix.dart';
import 'package:kmp_togo_mobile/pages/ppob/listservices.dart';
import 'package:kmp_togo_mobile/pages/ppob/phonebook.dart';
import 'package:kmp_togo_mobile/pages/ppob/ppobPaymentPrepaid.dart';
import 'package:kmp_togo_mobile/pages/base.dart';
import 'package:kmp_togo_mobile/pages/common/buySuccessPage.dart';
import 'package:kmp_togo_mobile/pages/common/pinPage.dart';
import 'package:kmp_togo_mobile/pages/common/splashPage.dart';
import 'package:kmp_togo_mobile/pages/home.dart';
import 'package:kmp_togo_mobile/providers/ppob/provider_ppob_pre.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import '../../../models/ppob/prepaid/PrePaidProduct.dart';

class InputPPOBWithNumber extends StatefulWidget {
  String? title;
  final String product_type;

  InputPPOBWithNumber({required this.title, required this.product_type});

  @override
  State<InputPPOBWithNumber> createState() => _InputPPOBWithNumberState();
}

class _InputPPOBWithNumberState extends State<InputPPOBWithNumber>
    with NumberFormatMachine, ApiMachine {
  final _dio = Helper().dio;

  String? providerPulsa = 'Pilih Layanan Provider';
  TextEditingController numbersC = TextEditingController();

  String phoneOperator = '';

  late ItemModelPhonePrefix prefixData;

  String provider_pulsa_img = '';

  FutureOr? onGoBack(dynamic value) {
    setState(() {
      providerPulsa = value;
    });
  }

  final _formKey = GlobalKey<FormState>();
  int? _selectedIndex;
  bool? validate = false;

  _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        validate = true;
      });
      debugPrint(validate.toString());
    } else {
      debugPrint(validate.toString());
    }
  }

  _nextPage(String code, String customer_id, String operator,
      PrepaidProduct product) {
    final SharedPreferencesManager sharedPreferencesManager =
        locator<SharedPreferencesManager>();

    if (validate == true) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        if (widget.product_type == 'pulsa' || widget.product_type == 'data') {
          return EnterPinPage(
              isAllowBack: true,
              nextPage: SplashPage(
                  pinValue: sharedPreferencesManager
                          .getString(SharedPreferencesManager.pin) ??
                      '',
                  ppob_code: code,
                  ppob_tipe: widget.product_type,
                  ppob_customer_id: customer_id,
                  ppob_operator: operator,
                  nextPage: BuySuccessPage(
                    nextPage: Home(),
                    title: 'Berhasil Membayar',
                    subtitle: '',
                  ),
                  title: 'Berhasil Membayar',
                  subtitle: '',
                  provRepo: 'prepaid_checkout',
                  product: product,
                  model: null,
                  isReplace: false),
              isContainFunctionBack: true,
              title: 'Konfirmasi Pembelian');
        } else {
          return PPOBPaymentPrePaid(
            code: code,
            product_type: widget.product_type,
            customer_id: customer_id,
            product: product,
          );
        }
      }));
    }
  }

  List<PrepaidProduct> visibleWidgets = [];

  @override
  void initState() {
    super.initState();
  }

  // Contact? numberAA;
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

  // List<Contact>? contactsA;
  PhoneContact? _phoneContact;
  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      final PhoneContact contact =
          await FlutterContactPicker.pickPhoneContact();

      setState(() {
        _phoneContact = contact;
        print('haloasdsad ${_phoneContact!.phoneNumber!.number}');

        numbersC.text = _phoneContact!.phoneNumber!.number.toString();
      });
      // numberAA = await ContactsService.openExistingContact(numberAA!);
      // if (contactsA != null) {
      //   setState(() {});
      // } else {
      //   setState(() {});
      // }
      // setState(() {});

      return permission;
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(numbersC.text);
    return BaseWidget<ProviderPrepaidProduct>(
      model: ProviderPrepaidProduct(Repository()),
      onModelReady: (model) => model.fetchPrePaidProduct(),
      child: Container(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF85014e),
            elevation: 0,
            title: Text(widget.title!),
          ),
          body: Form(
            key: _formKey,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 2.h),
                            child: Text(
                              'Pembayaran ${widget.title}',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.shade600),
                            )),
                        widget.product_type == 'pulsa' ||
                                widget.product_type == 'data' ||
                                widget.product_type == 'pln'
                            ? Container()
                            : Container(
                                padding: const EdgeInsets.only(top: 20),
                                child: TextField(
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ListServiceWNumber()),
                                    ).then((value) {
                                      onGoBack(value);
                                    });
                                  },
                                  readOnly: true,
                                  enableInteractiveSelection: false,
                                  showCursor: true,
                                  focusNode: AlwaysDisabledFocusNode(),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    prefixIcon: Icon(
                                      Icons.phone_android_rounded,
                                      size: 4.w,
                                    ),
                                    hintText: providerPulsa != null &&
                                            providerPulsa != ''
                                        ? providerPulsa
                                        : 'Pilih Layanan Provider',
                                    border: const OutlineInputBorder(),
                                    suffixIcon:
                                        const Icon(Icons.arrow_drop_down_sharp),
                                  ),
                                ),
                              ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: TextFormField(
                                  controller: numbersC,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(15)
                                  ],
                                  validator: (value) {
                                    debugPrint(value);
                                    if (value!.isEmpty) {
                                      return 'Nomor telepon tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    prefixIcon: phoneOperator.isEmpty
                                        ? Icon(
                                            Icons.phone_android_rounded,
                                            size: 4.w,
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1, horizontal: 4),
                                            child: Image(
                                              image: AssetImage(
                                                  provider_pulsa_img),
                                              height: 2.h,
                                              width: 2.w,
                                            ),
                                          ),
                                    hintText:
                                        'Masukkan Nomor ${getProductType()}',
                                    border: const OutlineInputBorder(),
                                  ),
                                  onChanged: (value) async {
                                    if (value.length == 4) {
                                      if (widget.product_type == 'pulsa' ||
                                          widget.product_type == 'data') {
                                        prefixData =
                                            await _checkNumberPrefix(value);

                                        phoneOperator =
                                            prefixData.data.dataOperator;

                                        switch (phoneOperator) {
                                          case 'indosat':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/Indosat.png';
                                            });
                                            break;
                                          case 'XL':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/XL.png';
                                            });
                                            break;
                                          case 'AXIS':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/AXis.png';
                                            });
                                            break;
                                          case 'telkomsel':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/Telkomsel.png';
                                            });
                                            break;
                                          case 'SMART':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/Smartfreen.png';
                                            });
                                            break;
                                          case 'THREE':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/Three.png';
                                            });
                                            break;
                                          case 'by.u':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/logo.png';
                                            });
                                            break;
                                        }

                                        setState(() {
                                          visibleWidgets = model.items!.data
                                              .where((element) =>
                                                  element.productType ==
                                                      widget.product_type &&
                                                  element.productCode
                                                      .toLowerCase()
                                                      .contains(prefixData
                                                          .data.dataOperator
                                                          .toLowerCase()))
                                              .toList();
                                        });
                                      } else {
                                        setState(() {
                                          visibleWidgets = model.items!.data
                                              .where((element) =>
                                                  element.productType ==
                                                  widget.product_type)
                                              .toList();
                                        });
                                      }

                                      visibleWidgets.sort((status1, status2) {
                                        var toString1 = status1.productPrice;
                                        var toString2 = status2.productPrice;

                                        return toString1.compareTo(toString2);
                                      });
                                    }
                                  },
                                  onFieldSubmitted: (value) async {
                                    if (value.length > 6) {
                                      if (widget.product_type == 'pulsa' ||
                                          widget.product_type == 'data') {
                                        prefixData =
                                            await _checkNumberPrefix(value);

                                        phoneOperator =
                                            prefixData.data.dataOperator;

                                        switch (phoneOperator) {
                                          case 'indosat':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/Indosat.png';
                                            });
                                            break;
                                          case 'XL':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/XL.png';
                                            });
                                            break;
                                          case 'AXIS':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/AXis.png';
                                            });
                                            break;
                                          case 'telkomsel':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/Telkomsel.png';
                                            });
                                            break;
                                          case 'SMART':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/Smartfreen.png';
                                            });
                                            break;
                                          case 'THREE':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/provider_pulsa/Three.png';
                                            });
                                            break;
                                          case 'by.u':
                                            setState(() {
                                              provider_pulsa_img =
                                                  'assets/images/logo.png';
                                            });
                                            break;
                                        }

                                        setState(() {
                                          visibleWidgets = model.items!.data
                                              .where((element) =>
                                                  element.productType ==
                                                      widget.product_type &&
                                                  element.productCode
                                                      .toLowerCase()
                                                      .contains(prefixData
                                                          .data.dataOperator
                                                          .toLowerCase()))
                                              .toList();
                                        });
                                      } else {
                                        setState(() {
                                          visibleWidgets = model.items!.data
                                              .where((element) =>
                                                  element.productType ==
                                                  widget.product_type)
                                              .toList();
                                        });
                                      }
                                    }

                                    visibleWidgets.sort((status1, status2) {
                                      var toString1 = status1.productPrice;
                                      var toString2 = status2.productPrice;

                                      return toString1.compareTo(toString2);
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                  child: widget.product_type == 'pulsa' ||
                                          widget.product_type == 'data'
                                      ? InkWell(
                                          onTap: () async {
                                            await _getContactPermission();
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         PhoneBook(),
                                            //   ),
                                            // ).then((val) async {
                                            // var result = val;
                                            String resultA = _phoneContact!
                                                .phoneNumber!.number
                                                .toString();
                                            String resultB =
                                                resultA.replaceAll('+62', '0');
                                            String resultD =
                                                resultB.replaceAll(' ', '');
                                            String resultE =
                                                resultD.replaceAll('-', '');

                                            debugPrint(
                                                int.parse(resultE).toString());
                                            debugPrint(resultE);
                                            numbersC = TextEditingController(
                                                text: resultE);
                                            setState(() {});
                                            if (widget.product_type ==
                                                    'pulsa' ||
                                                widget.product_type == 'data') {
                                              prefixData =
                                                  await _checkNumberPrefix(
                                                      resultE);

                                              phoneOperator =
                                                  prefixData.data.dataOperator;

                                              switch (phoneOperator) {
                                                case 'indosat':
                                                  setState(() {
                                                    provider_pulsa_img =
                                                        'assets/images/provider_pulsa/Indosat.png';
                                                  });
                                                  break;
                                                case 'XL':
                                                  setState(() {
                                                    provider_pulsa_img =
                                                        'assets/images/provider_pulsa/XL.png';
                                                  });
                                                  break;
                                                case 'AXIS':
                                                  setState(() {
                                                    provider_pulsa_img =
                                                        'assets/images/provider_pulsa/AXis.png';
                                                  });
                                                  break;
                                                case 'telkomsel':
                                                  setState(() {
                                                    provider_pulsa_img =
                                                        'assets/images/provider_pulsa/Telkomsel.png';
                                                  });
                                                  break;
                                                case 'SMART':
                                                  setState(() {
                                                    provider_pulsa_img =
                                                        'assets/images/provider_pulsa/Smartfreen.png';
                                                  });
                                                  break;
                                                case 'THREE':
                                                  setState(() {
                                                    provider_pulsa_img =
                                                        'assets/images/provider_pulsa/Three.png';
                                                  });
                                                  break;
                                                case 'by.u':
                                                  setState(() {
                                                    provider_pulsa_img =
                                                        'assets/images/logo.png';
                                                  });
                                                  break;
                                              }
                                            }
                                            if (widget.product_type ==
                                                    'pulsa' ||
                                                widget.product_type == 'data') {
                                              setState(() {
                                                visibleWidgets = model
                                                    .items!.data
                                                    .where((element) =>
                                                        element.productType ==
                                                            widget
                                                                .product_type &&
                                                        element.productCode
                                                            .toLowerCase()
                                                            .contains(prefixData
                                                                .data
                                                                .dataOperator
                                                                .toLowerCase()))
                                                    .toList();
                                              });
                                            } else {
                                              setState(() {
                                                visibleWidgets = model
                                                    .items!.data
                                                    .where((element) =>
                                                        element.productType ==
                                                        widget.product_type)
                                                    .toList();
                                              });
                                            }

                                            visibleWidgets
                                                .sort((status1, status2) {
                                              var toString1 =
                                                  status1.productPrice;
                                              var toString2 =
                                                  status2.productPrice;

                                              return toString1
                                                  .compareTo(toString2);
                                              // });
                                            });
                                          },
                                          child: const Card(
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4,
                                                    vertical: 11),
                                                child: Icon(
                                                  Icons.contact_phone,
                                                  color: Color(0xFF85014e),
                                                )),
                                          ),
                                        )
                                      : Container())
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: model.busy
                              ? const Center(child: CircularProgressIndicator())
                              : StaggeredGrid.count(
                                  crossAxisCount: 2,

                                  //Here is the place that we are getting flexible/ dynamic card for various images
                                  // staggeredTiles: snapshot.data
                                  //     .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                                  //     .toList(),
                                  mainAxisSpacing: 3.0,
                                  crossAxisSpacing:
                                      4.0, // I only need two card horizontally
                                  // padding: const EdgeInsets.all(2.0),
                                  children: visibleWidgets
                                      .map((e) => buildListProduct(e))
                                      .toList(), // add some space
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildListProduct(PrepaidProduct e) {
    return InkWell(
        onTap: () async {
          if (numbersC.text.length > 8) {
            await _submit();
            _nextPage(e.productCode, numbersC.text, phoneOperator, e);
          } else {
            await customSnackbar(
                type: 'error',
                title: 'Kesalahan',
                text: 'Masukkan minimal 8 angka');
          }
        },
        child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 3.w, right: 3.w, top: 2.5.h, bottom: 2.5.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Html(data: e.productDescription),
                  Row(
                    children: [
                      // Icon(
                      //   Icons.token,
                      //   size: 5.w,
                      // ),
                      Flexible(child: Text(e.productNominal)),
                    ],
                  ),
                  const VerticalSpacer(height: 18),
                  Text(getNumberFormatSeparator(e.productPrice.toDouble())),
                ],
              ),
            )));
  }

  _checkNumberPrefix(phoneNumber) async {
    return await fetchPrePaidPhonePrefix(phoneNumber);
  }

  Future<ItemModelPhonePrefix> fetchPrePaidPhonePrefix(number) async {
    try {
      Map<String, dynamic> data = {
        "phoneNumber": number,
      };

      debugPrint('RES: $data');

      final res = await _dio.post('/v1/ppob/prepaid/phoneprefix', data: data);

      await saveResponsePost(res.requestOptions.path, res.statusMessage,
          res.data.toString(), data.toString());

      debugPrint('RES: ${res.data}');

      return ItemModelPhonePrefix.fromJson(res.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  getProductType() {
    switch (widget.product_type) {
      case 'pulsa':
        return 'Telepon';
      case 'data':
        return 'Telepon';
      case 'pln':
        return 'Meter';
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
