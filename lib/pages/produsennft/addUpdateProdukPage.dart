import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/custom_snackbar.dart';
import 'package:kmp_togo_mobile/providers/nft/provider_nft.dart';
import 'package:kmp_togo_mobile/utils/layarmax.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AddUpdateProductPage extends StatefulWidget {
  // ProviderProduct product;
  bool isUpdate;
  int? storeId;
  // Datum? data;

  AddUpdateProductPage({
    super.key,
    //  required this.product,
    required this.isUpdate,
    required this.storeId,

    // this.data
  });

  @override
  State<AddUpdateProductPage> createState() => _AddUpdateProductPageState();
}

class _AddUpdateProductPageState extends State<AddUpdateProductPage>
    with NumberFormatMachine {
  List<String> statusSelling = [
    "online",
    "offline",
  ];

  var currentSelectedValuekategori;

  File? image;

  TextEditingController namaProdukC = TextEditingController(text: '');
  TextEditingController descProdukC = TextEditingController(text: '');
  TextEditingController hargaProdukC = TextEditingController(text: '');

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  bool? isLoading = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final _getkategoriProvider =
          Provider.of<ProviderNft>(context, listen: false);
      await _getkategoriProvider.getMyNFTCategories(context);
    });
    super.initState();
  }

  submitAddItemNFT(String? namaP, String? desc, String? price) async {
    if (namaP == '') {
      setState(() {
        isLoading = false;
      });
      await customSnackbar(type: 'error', title: 'nama belum diisi', text: '');
    } else if (desc == '') {
      setState(() {
        isLoading = false;
      });
      await customSnackbar(
          type: 'error', title: 'deskripsi belum diisi', text: '');
    } else if (price == '') {
      setState(() {
        isLoading = false;
      });
      await customSnackbar(type: 'error', title: 'harga belum diisi', text: '');
    } else if (currentSelectedValuekategori == null) {
      setState(() {
        isLoading = false;
      });
      await customSnackbar(
          type: 'error', title: 'Kategori belum diisi', text: '');
    } else {
      int? priceA = int.parse(price ?? "");
      await Provider.of<ProviderNft>(context, listen: false).submitItemMyNFT(
          context,
          widget.storeId,
          namaProdukC.text,
          descProdukC.text,
          currentSelectedValuekategori,
          priceA,
          image);
      setState(() {
        isLoading =
            Provider.of<ProviderNft>(context, listen: false).loadinggetaddnft;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderNft>(
        builder: (BuildContext context, v, Widget? child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF85014e),
            elevation: 0,
            title: Text(widget.isUpdate ? "Edit Produk" : "Tambah Produk"),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: namaProdukC,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 2.h),
                              prefixIcon: Icon(
                                Icons.shopping_bag,
                                size: 4.w,
                              ),
                              hintStyle: TextStyle(fontSize: 10.sp),
                              hintText: 'Nama Produk',
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: descProdukC,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 2.h),
                              prefixIcon: Icon(
                                Icons.shopping_bag,
                                size: 4.w,
                              ),
                              hintStyle: TextStyle(fontSize: 10.sp),
                              hintText: 'Deskripsi',
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              top: 6.w,
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border:
                                      Border.all(color: Colors.grey.shade500),
                                ),
                                child: Row(children: <Widget>[
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 1.5.w),
                                      padding: const EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.offline_share,
                                        color: Colors.grey.shade500,
                                        size: 4.w,
                                      )),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        hint: Text(
                                          "Category",
                                          style: TextStyle(fontSize: 10.sp),
                                        ),
                                        icon: const Visibility(
                                            visible: true,
                                            child: Icon(Icons
                                                .keyboard_arrow_down_rounded)),
                                        isExpanded: true,
                                        items: v.dataMCategoriesMyNFT?.data
                                            ?.map((val) {
                                          return DropdownMenuItem(
                                            value: val.id,
                                            child: Text(val.name ?? ""),
                                          );
                                        }).toList(),
                                        value: currentSelectedValuekategori,
                                        onChanged: (value) {
                                          setState(() {
                                            currentSelectedValuekategori =
                                                value;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ]))),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            controller: hargaProdukC,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 2.h),
                              prefixIcon: Icon(
                                Icons.monetization_on,
                                size: 4.w,
                              ),
                              hintStyle: TextStyle(fontSize: 10.sp),
                              hintText: 'Harga',
                              border: const OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 3.h),
                          child: Text('Foto Produk',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Container(
                          //show captured image
                          child: image == null
                              ? InkWell(
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade500,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 3.w),
                                      margin:
                                          EdgeInsets.symmetric(vertical: 2.h),
                                      child: const Text("Add image captured")))
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2.h,
                                  ),
                                  child: Image.file(
                                    File(image!.path),
                                    height: 12.h,
                                  ),
                                ),
                          //display captured image
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        width: context.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                if (image != null) {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  // await Provider.of<ProviderCreateProduct>(
                                  //         context,
                                  //         listen: false)
                                  //     .createProduct(
                                  //         widget.isUpdate,
                                  //         widget.isUpdate ? 0 : 0,
                                  //         sharedPreferencesManager
                                  //             .getInt('ownerId'),
                                  //         namaProdukC.text,
                                  //         descProdukC.text,
                                  //         hargaProdukC.text,
                                  //         null,
                                  //         selectedProductSelling,
                                  //         image!.path);
                                }
                              },
                              child: Container(
                                  width: context.width,
                                  margin:
                                      EdgeInsets.only(left: 2.h, right: 2.w),
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: isLoading == true
                                          ? Colors.grey
                                          : Theme.of(context).primaryColor),
                                  child: isLoading == true
                                      ? const Center(
                                          child: Text(
                                            'waiting....',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              isLoading = true;
                                            });
                                            submitAddItemNFT(
                                                namaProdukC.text,
                                                descProdukC.text,
                                                hargaProdukC.text);
                                          },
                                          child: const Text(
                                            'Simpan',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                        )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
