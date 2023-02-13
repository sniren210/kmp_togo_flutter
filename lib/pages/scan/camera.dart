import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_camera_overlay/flutter_camera_overlay.dart';
import 'package:flutter_camera_overlay/model.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerNewAccountPage.dart';
import 'package:kmp_togo_mobile/pages/common/splashPage.dart';
import 'package:kmp_togo_mobile/pages/common/takePictures.dart';
import 'package:kmp_togo_mobile/providers/auth/provider_register.dart';
import 'package:provider/provider.dart';

class CameraIDCardOverlay extends StatefulWidget {
  const CameraIDCardOverlay({Key? key}) : super(key: key);

  @override
  _CameraIDCardOverlayState createState() => _CameraIDCardOverlayState();
}

class _CameraIDCardOverlayState extends State<CameraIDCardOverlay> {
  int tab = 0;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white,
            body: FutureBuilder<List<CameraDescription>?>(
              future: availableCameras(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data == null) {
                    return const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'No camera found',
                          style: TextStyle(color: Colors.black),
                        ));
                  }
                  return CameraOverlay(
                      snapshot.data!.first,
                      CardOverlay.byFormat(OverlayFormat.cardID3),
                      (XFile file) => showDialog(
                            context: context,
                            barrierColor: Colors.black,
                            builder: (context) {
                              CardOverlay overlay =
                                  CardOverlay.byFormat(OverlayFormat.cardID3);
                              return StatefulBuilder(
                                  builder: (context, _satset) {
                                return AlertDialog(
                                    actionsAlignment: MainAxisAlignment.center,
                                    backgroundColor: Colors.black,
                                    title: const Text('Capture',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center),
                                    actions: [
                                      OutlinedButton(
                                          onPressed: () {
                                            _satset(() {
                                              isLoading = false;
                                            });

                                            Navigator.of(context).pop();
                                          },
                                          child: const Icon(Icons.close)),
                                      isLoading
                                          ? OutlinedButton(
                                              onPressed: () {},
                                              child: const SizedBox(
                                                  width: 14,
                                                  height: 14,
                                                  child:
                                                      CircularProgressIndicator(
                                                          strokeWidth: 2.0)))
                                          : OutlinedButton(
                                              onPressed: () async {
                                                _satset(() {
                                                  isLoading = true;
                                                });
                                                await Provider.of<
                                                            ProviderRegister>(
                                                        context,
                                                        listen: false)
                                                    .validate_ocrktp(context,
                                                        File(file.path));
                                                _satset(() {
                                                  isLoading = false;
                                                });
                                              },
                                              child: const Icon(Icons.check)),
                                    ],
                                    content: SizedBox(
                                        width: double.infinity,
                                        child: AspectRatio(
                                          aspectRatio: overlay.ratio!,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              fit: BoxFit.cover,
                                              alignment:
                                                  FractionalOffset.center,
                                              image: FileImage(File(file.path),
                                                  scale: 1.5),
                                            )),
                                          ),
                                        )));
                              });
                            },
                          ),
                      info:
                          'Posisikan Kartu KTP Anda berada di dalam kotak dan pastikan agar gambar tidak blur',
                      label: 'Scanning Foto KTP');
                } else {
                  return const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Fetching cameras',
                        style: TextStyle(color: Colors.black),
                      ));
                }
              },
            ),
          )),
    );
  }
}
