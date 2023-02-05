import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackbar({String? type, String? title, String? text}) async {
  Get.snackbar(title ?? '', text ?? '',
      colorText: Colors.white,
      icon: Icon(getIcon(type), color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: getColor(type));
}

snackbarMenu() {
  Get.snackbar('Perhatian!', 'Menu ini tidak tersedia untuk role kamu',
      colorText: Colors.white,
      icon: const Icon(Icons.warning, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange);
}

Color getColor(type) {
  switch (type) {
    case 'success':
      return Colors.green;
    case 'warning':
      return Colors.orangeAccent;
    case 'error':
      return Colors.red;
  }
  return Colors.grey;
}

IconData getIcon(type) {
  switch (type) {
    case 'success':
      return Icons.check;
    case 'warning':
      return Icons.warning;
    case 'error':
      return Icons.error;
  }
  return Icons.timelapse;
}
