import 'package:flutter/material.dart';

Widget addHeight(dynamic data) {
  return SizedBox(
    height: double.parse(data.toString()),
  );
}

Widget addWidth(dynamic data) {
  return SizedBox(
    width: double.parse(data.toString()),
  );
}
