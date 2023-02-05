import 'package:flutter/material.dart';

Widget corner({corner, child}) {
  return ClipRRect(
    child: child,
    borderRadius:
        BorderRadius.all(Radius.circular(double.parse(corner.toString()))),
  );
}
