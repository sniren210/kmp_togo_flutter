import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RpFormat {
  static String idr(dynamic number) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 0,
    );
    return currencyFormatter.format(number);
  }

  static int inputText(dynamic val, dynamic controller) {
    if (val.length > 3) {
      final priceFix = int.parse(val.replaceAll('Rp ', '').replaceAll('.', ''));
      controller.text = RpFormat.idr(priceFix).toString();
      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
      return priceFix;
    } else {
      controller.text = RpFormat.idr(0).toString();
      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
      return 0;
    }
  }
}
