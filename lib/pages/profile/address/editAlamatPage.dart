import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/ui_helper/formInputField.dart';

class editAlamatPage extends StatefulWidget {
  const editAlamatPage({super.key});

  @override
  State<editAlamatPage> createState() => _editAlamatPageState();
}

TextEditingController? placeNameC,
    contactNameC,
    phoneNumberC,
    postalCodeNumberC,
    cityC,
    provinceC,
    subdisticC,
    addressC;

class _editAlamatPageState extends State<editAlamatPage> {
  @override
  void initState() {
    placeNameC = TextEditingController();
    contactNameC = TextEditingController();
    phoneNumberC = TextEditingController();
    postalCodeNumberC = TextEditingController();
    cityC = TextEditingController();
    provinceC = TextEditingController();
    subdisticC = TextEditingController();
    addressC = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Edit Alamat'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ElevatedButton(
              //   onPressed: () async {
              //     // print(geoPoint);

              //     GeoPoint? p = await showSimplePickerLocation(
              //       context: context,
              //       isDismissible: true,
              //       title: "Title dialog",
              //       textConfirmPicker: "pick",
              //       initCurrentUserPosition: true,
              //       initZoom: 15,
              //     );

              //     if (p != null) {
              //       List<Placemark> placemarks =
              //           await placemarkFromCoordinates(p.latitude, p.longitude);

              //       placeNameC!.text = placemarks.first.locality ?? '';
              //       postalCodeNumberC!.text = placemarks.first.postalCode ?? '';
              //       cityC!.text = placemarks.first.country ?? '';
              //       subdisticC!.text =
              //           placemarks.first.subAdministrativeArea ?? '';
              //       addressC!.text = placemarks.first.street ?? '';
              //     }
              //   },
              //   child: Text('Pilih lokasi'),
              // ),
              const SizedBox(
                height: 8,
              ),
              FormInput(
                  controller: placeNameC!,
                  inputType: TextInputType.text,
                  hintText: 'Nama Tempat',
                  icon: Icons.home),
              const SizedBox(
                height: 8,
              ),
              FormInput(
                  controller: contactNameC!,
                  inputType: TextInputType.text,
                  hintText: 'Nama Kontak',
                  icon: Icons.person),
              const SizedBox(
                height: 8,
              ),
              FormInput(
                  controller: phoneNumberC!,
                  inputType: TextInputType.number,
                  hintText: 'Nomer Telepon / HP',
                  icon: Icons.contact_phone),
              const SizedBox(
                height: 8,
              ),
              FormInputLongText(
                controller: provinceC!,
                hintText: 'Provinsi',
                icon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 8,
              ),
              FormInputLongText(
                controller: cityC!,
                hintText: 'Kabupaten / kota',
                icon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 8,
              ),
              FormInputLongText(
                controller: subdisticC!,
                hintText: 'Kecamatan / Desa',
                icon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 8,
              ),
              FormInputLongText(
                  controller: addressC!,
                  hintText: 'Alamat',
                  icon: Icons.email_outlined),
              const SizedBox(
                height: 8,
              ),
              FormInput(
                controller: postalCodeNumberC!,
                inputType: TextInputType.number,
                hintText: 'Kode Pos',
                maxInputLength: 6,
                icon: Icons.location_city,
              ),
              const SizedBox(
                height: 70,
              ),
              KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
                if (isKeyboardVisible) {
                  return SizedBox(
                    height: 20.h,
                  );
                }
                return SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(right: 20.0, left: 20.0),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFF85014e),
            ),
            child: const Text(
              'Update',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            )),
      ),
    );
  }
}
