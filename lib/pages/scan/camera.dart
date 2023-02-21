import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_camera_overlay/flutter_camera_overlay.dart';
import 'package:flutter_camera_overlay/model.dart';
import 'package:flutter_camera_overlay/overlay_shape.dart';
import 'package:kmp_togo_mobile/pages/auth/register/registerIdValidationPage.dart';
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
      onWillPop: () async => true,
      child: Scaffold(
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
              return CameraOverlayTogo(
                  camera: snapshot.data![0],
                  model: CardOverlay.byFormat(OverlayFormat.cardID3),
                  onCapture: (XFile file, CameraController controller) {
                    showDialog(
                      context: context,
                      barrierColor: Colors.black,
                      builder: (context) {
                        CardOverlay overlay =
                            CardOverlay.byFormat(OverlayFormat.cardID3);
                        return StatefulBuilder(builder: (context, _satset) {
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

                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Icon(Icons.close)),
                                isLoading
                                    ? OutlinedButton(
                                        onPressed: () {},
                                        child: const SizedBox(
                                            width: 14,
                                            height: 14,
                                            child: CircularProgressIndicator(
                                                strokeWidth: 2.0)))
                                    : OutlinedButton(
                                        onPressed: () async {
                                          _satset(() {
                                            isLoading = true;
                                          });

                                          final rs = await Provider.of<
                                                      ProviderRegister>(context,
                                                  listen: false)
                                              .validate_ocrktp(
                                                  context, File(file.path));
                                          _satset(() {
                                            isLoading = false;
                                          });
                                          if (rs) {
                                            controller.dispose();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const RegisterIdValidationPage()),
                                            );
                                          }
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
                                        alignment: FractionalOffset.center,
                                        image: FileImage(File(file.path),
                                            scale: 1.5),
                                      )),
                                    ),
                                  )));
                        });
                      },
                    );
                  },
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
      ),
    );
  }
}

class CameraOverlayTogo extends StatefulWidget {
  final CameraDescription camera;
  final void Function(XFile, CameraController) onCapture;
  final OverlayModel model;
  final String? label;
  final String? info;

  const CameraOverlayTogo({
    super.key,
    required this.camera,
    required this.model,
    required this.label,
    required this.info,
    required this.onCapture,
  });

  @override
  State<CameraOverlayTogo> createState() => _CameraOverlayTogoState();
}

class _CameraOverlayTogoState extends State<CameraOverlayTogo> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    // controller = widget.controller;
    controller = CameraController(widget.camera, ResolutionPreset.max,
        enableAudio: false);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text('Kamera tidak bisa mendapatkan izin di ponsel Anda'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 40),
              child: InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterIdValidationPage()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: const Color(0xFF85014e)),
                  child: const Text(
                    'Selanjutnya',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    controller.setFlashMode(FlashMode.off);
    return Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.expand,
      children: [
        CameraPreview(controller),
        OverlayShape(widget.model),
        if (widget.label != null || widget.info != null)
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.label != null)
                      Text(
                        widget.label!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    if (widget.info != null)
                      Flexible(
                        child: Text(
                          widget.info!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                )),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
              color: Colors.transparent,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle,
                  ),
                  margin: const EdgeInsets.all(25),
                  child: IconButton(
                    enableFeedback: true,
                    color: Colors.white,
                    onPressed: () async {
                      for (int i = 10; i > 0; i--) {
                        await HapticFeedback.vibrate();
                      }

                      XFile file = await controller.takePicture();
                      widget.onCapture(file, controller);
                    },
                    icon: const Icon(
                      Icons.camera,
                    ),
                    iconSize: 72,
                  ))),
        )
      ],
    );
  }
}
