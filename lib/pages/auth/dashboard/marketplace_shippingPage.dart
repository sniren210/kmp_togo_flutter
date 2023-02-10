import 'dart:async';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:kmp_togo_mobile/helpers/api_helper.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/spacer.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/models/address/addressBook.dart';
import 'package:kmp_togo_mobile/models/shipping/shipping_model.dart';
import 'package:kmp_togo_mobile/pages/auth/dashboard/marketplace_inquiryPage.dart';

class MarketplaceShippingPage extends StatefulWidget {
  final String productName;
  final String variantName;
  final int skuId;
  final int qty;
  final int storeId;

  const MarketplaceShippingPage({
    Key? key,
    required this.productName,
    required this.variantName,
    required this.skuId,
    required this.qty,
    required this.storeId,
  }) : super(key: key);

  @override
  State<MarketplaceShippingPage> createState() =>
      _MarketplaceShippingPageState();
}

class _MarketplaceShippingPageState extends State<MarketplaceShippingPage>
    with ApiMachine {
  final _dio = Helper().dio;

  ItemModelShipping? shippingData;
  ItemModelUserAddressBook? addressData;

  int? addressBookId;
  String contactName = '';
  String phoneNumber = '';
  String detailAddress = '';

  String shipping_code = '';
  String shipping_name = '';

  bool isLoading = true;

  startShippingPage() async {
    var duration = const Duration(milliseconds: 1200);
    return Timer(duration, fetchData);
  }

  fetchData() async {
    await getShipping();
    await getAddressBook();

    setState(() {
      isLoading = false;
    });
  }

  Future<ItemModelShipping?> getShipping() async {
    shippingData = ItemModelShipping.dummy();
    return ItemModelShipping.dummy();
    // final res = await _dio.get(
    //   '/v1/shipping/courier',
    // );

    // await saveResponseGet(
    //     res.requestOptions.path, res.statusMessage, res.data.toString());

    // if (res.statusCode == 200) {
    //   setState(() {
    //     shippingData = ItemModelShipping.fromJson(res.data);
    //   });
    //   return ItemModelShipping.fromJson(res.data);
    // } else if (res.statusCode == 401) {
    //   throw Exception('Unauthorized: Failed to load Shipping');
    // } else {
    //   throw Exception('Failed to load Shipping');
    // }
  }

  Future<ItemModelUserAddressBook?> getAddressBook() async {
    addressData = ItemModelUserAddressBook.dummy();
    return ItemModelUserAddressBook.dummy();
    // final res = await _dio.get(
    //   '/v1/user/address',
    // );

    // await saveResponseGet(
    //     res.requestOptions.path, res.statusMessage, res.data.toString());

    // if (res.statusCode == 200) {
    //   setState(() {
    //     addressData = ItemModelUserAddressBook.fromJson(res.data);
    //   });
    //   return ItemModelUserAddressBook.fromJson(res.data);
    // } else if (res.statusCode == 401) {
    //   throw Exception('Unauthorized: Failed to load Address');
    // } else {
    //   throw Exception('Failed to load Address');
    // }
  }

  @override
  void initState() {
    startShippingPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF85014e),
        title: const Text('Product Shipping'),
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 80.0),
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VerticalSpacer(height: 30),
                          const Text('Pilih Alamat',
                              style: TextStyling.w600bold16black),
                          const VerticalSpacer(height: 18),
                          DropdownSearch(
                            items: addressData!.data.map((value) {
                              return DropdownMenuItem(
                                value: value.detailAddress,
                                child: Text(value.name.toString()),
                              ).value.toString();
                            }).toList(),
                            onChanged: (value) {
                              addressBookId = addressData!.data
                                  .where((element) =>
                                      element.detailAddress == value)
                                  .first
                                  .id;
                              contactName = addressData!.data
                                  .where((element) =>
                                      element.detailAddress == value)
                                  .first
                                  .contactName;
                              phoneNumber = addressData!.data
                                  .where((element) =>
                                      element.detailAddress == value)
                                  .first
                                  .phoneNumber;
                              detailAddress = addressData!.data
                                  .where((element) =>
                                      element.detailAddress == value)
                                  .first
                                  .detailAddress;
                            },
                          ),
                          const VerticalSpacer(height: 30),
                          const Text('Pilih Kurir',
                              style: TextStyling.w600bold16black),
                          const VerticalSpacer(height: 18),
                          DropdownSearch(
                            items: shippingData!.data.map((value) {
                              return DropdownMenuItem(
                                value: value.name,
                                child: Text(value.name.toString()),
                              ).value.toString();
                            }).toList(),
                            onChanged: (value) {
                              shipping_code = shippingData!.data
                                  .where((element) => element.name == value)
                                  .first
                                  .code;
                              shipping_name = value.toString();
                            },
                          ),
                          const VerticalSpacer(height: 30),
                          Row(
                            children: [
                              Flexible(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFF85014e)),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 70)),
                                    ),
                                    child: const Text("Lanjutkan",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white)),
                                    onPressed: () {
                                      if (addressBookId == null) {
                                        customSnackbar(
                                            type: 'error',
                                            title: 'Alamat belum dipilih',
                                            text:
                                                'Silahkan pilih alamat terlebih dahulu');
                                      } else {
                                        if (shipping_code == '') {
                                          customSnackbar(
                                              type: 'error',
                                              title: 'Kurir belum dipilih',
                                              text:
                                                  'Silahkan pilih kurir terlebih dahulu');
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return MarketplaceInquiryPage(
                                                productName: widget.productName,
                                                variantName: widget.variantName,
                                                skuId: widget.skuId,
                                                qty: widget.qty,
                                                storeId: widget.storeId,
                                                addressBookId: addressBookId!,
                                                code: shipping_code,
                                                shippingName: shipping_name,
                                                contactName: contactName,
                                                phoneNumber: phoneNumber,
                                                detailAddress: detailAddress,
                                                isFromCart: false,
                                              );
                                            }),
                                          );
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
