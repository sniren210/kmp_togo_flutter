import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kmp_togo_mobile/helpers/injector.dart';
import 'package:kmp_togo_mobile/helpers/shared_pref_manager.dart';
import 'package:kmp_togo_mobile/providers/database/database.dart';

class UploadMachine {
  Future runCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    try {
      final pickedFile = await picker.pickImage(
        preferredCameraDevice: CameraDevice.front,
        source: ImageSource.camera,
        imageQuality: 30,
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width,
      );
      Uint8List bytes =
          Uint8List.fromList(File(pickedFile!.path).readAsBytesSync());
      String base64Image = base64Encode(bytes);

      return base64Image;
    } catch (e) {
      debugPrint('SOMETHING WENT WRONG WHEN TAKE A PICTURE: $e');
      return null;
    }
  }
}

mixin NumberFormatMachine {
  getNumberFormatSeparator(double number) {
    return NumberFormat('###,###,###,###').format(number).replaceAll(' ', '');
  }

  getNumberFormatSeparator3(double number) {
    return number.toStringAsFixed(3);
  }

  getNumberFormatSeparator4(double number) {
    return NumberFormat('#,##0.000').format(number).replaceAll(' ', '');
  }
}

abstract class ApiMachine {
  final SharedPreferencesManager sharedPreferencesManager =
      locator<SharedPreferencesManager>();

  headersApi(pinValue) {
    Map<String, String> headers = {'accept': '/', 'pin': getPinPref()};

    return headers;
  }

  checkStatusResponse(responseCode) {
    if (responseCode == '00') {
      return 'Success';
    } else if (responseCode == '05' ||
        responseCode == '39' ||
        responseCode == '201') {
      return 'Pending';
    } else {
      return 'Failed';
    }
  }

  getPinPref() {
    debugPrint(
        'pin: ${sharedPreferencesManager.getString(SharedPreferencesManager.pin)}');
    return sharedPreferencesManager.getString(SharedPreferencesManager.pin);
  }

  saveResponseGet(path, statusMessage, response) async {
    await AppDb().insertResponseAPI(ResponseFromAPIData(
      method: 'GET',
      status: statusMessage,
      path: path,
      responseBody: response,
    ));
  }

  saveResponseDelete(path, statusMessage, response) async {
    await AppDb().insertResponseAPI(ResponseFromAPIData(
      method: 'DELETE',
      status: statusMessage,
      path: path,
      responseBody: response,
    ));
  }

  saveResponsePost(path, statusMessage, response, data) async {
    await AppDb().insertResponseAPI(ResponseFromAPIData(
        method: 'POST',
        status: statusMessage,
        path: path,
        responseBody: response,
        data: data));
  }

  saveResponsePatch(path, statusMessage, response, data) async {
    await AppDb().insertResponseAPI(ResponseFromAPIData(
        method: 'PATCH',
        status: statusMessage,
        path: path,
        responseBody: response,
        data: data));
  }
}

final uploadMachine = UploadMachine();
