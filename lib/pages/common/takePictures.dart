import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/machines.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/helpers/ui_helper/textStyling.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerIdValidationPage.dart';
import 'package:kmp_togo_mobile/pages/common/splashPage.dart';
import 'package:kmp_togo_mobile/pages/scan/camera.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../providers/auth/provider_register.dart';

class TakePicturePage extends StatefulWidget {
  String title;

  TakePicturePage({Key? key, required this.title}) : super(key: key);

  @override
  State<TakePicturePage> createState() => _TakePicturePageState();
}

class _TakePicturePageState extends State<TakePicturePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 5.h),
                height: 25.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/images/logon.jpg'))),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyling.titleStyle,
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: const Text(
                  'Lörem ipsum putinas eurobävning, pohöpas trev. Odade global hektar rere i biohögån ultras. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CameraIDCardOverlay()),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 20.0, left: 20.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 70),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFF85014e),
                    ),
                    child: const Text(
                      'Pilih Foto',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TakePictureConfPage extends StatefulWidget {
  String title;
  Widget nextPage;
  File? images;

  TakePictureConfPage(
      {Key? key,
      required this.title,
      required this.nextPage,
      required this.images})
      : super(key: key);

  @override
  State<TakePictureConfPage> createState() => _TakePictureConfPageState();
}

class _TakePictureConfPageState extends State<TakePictureConfPage> {
  GlobalKey? _formKey;

  @override
  void initState() {
    super.initState();
  }

  Future cameraImage() async {
    final ImagePicker picker = ImagePicker();
    final image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      if (image != null) {
        widget.images = File(image.path);
        // String fileName = _image!.path.split('/').last;
        print('opopo : ${widget.images}');
      } else {
        // print("No Image selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 4.w, right: 4.w, top: 5.h),
              height: 25.h,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/logon.jpg'))),
            ),
            const SizedBox(
              height: 70,
            ),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyling.titleStyle,
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text(
                'Lörem ipsum putinas eurobävning, pohöpas trev. Odade global hektar rere i biohögån ultras. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(widget.images!), fit: BoxFit.cover),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    await cameraImage();
                  },
                  child: Container(
                      margin: const EdgeInsets.only(right: 10.0, left: 20.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 45),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent),
                      child: const Text(
                        'Pilih Lagi',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15),
                      )),
                ),
                loading == false
                    ? InkWell(
                        onTap: () async {
                          setState(() {
                            loading = true;
                          });
                          await Provider.of<ProviderRegister>(context,
                                  listen: false)
                              .validate_ocrktp(context, widget.images!);
                          setState(() {
                            loading = Provider.of<ProviderRegister>(context,
                                    listen: false)
                                .loadingOcrKtp;
                          });
                        },
                        child: Container(
                            margin:
                                const EdgeInsets.only(right: 20.0, left: 10.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 45),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFF85014e),
                            ),
                            child: const Text(
                              'Lanjutkan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                            )),
                      )
                    : Container(
                        margin: const EdgeInsets.only(right: 20.0, left: 0.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 65),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey),
                        child: Center(
                          child: SizedBox(
                            height: 2.h,
                            width: 4.w,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )),
              ],
            ),
            // Container(
            //   child: Image.file(widget.images!),
            // ),
          ],
        ),
      ),
    );
  }

  bool? loading = false;
}
