import 'package:flutter/material.dart';

abstract class TextStyling {
  static const titleStyle =
      TextStyle(fontSize: 23.0, fontWeight: FontWeight.w500);

  static const bold24grey =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 24);

  static const w60020black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20);

  static const w50018black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18);

  static const w600bold16grey =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16);

  static const w600bold16black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16);

  static const w30015black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 15);

  static const w30016black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16);

  static const w50015black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15);

  static const bold15grey =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15);

  static const bold15black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15);

  static const normal15grey = TextStyle(
      color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 15);

  static const w600bold14white =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14);
  static const w600bold14grey =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14);
  static const w600bold14black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14);

  static const w50014black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14);

  static const normal14black = TextStyle(
      color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14);

  static const w40014grey =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14);

  static const w40014white =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14);

  static const w40014black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14);

  static const w40014blue =
      TextStyle(color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 14);

  static const bold13black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13);

  static const w30013black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 13);

  static const w600bold12black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12);

  static const w40012black =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12);

  static const w30013black_underlined = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w300,
    fontSize: 13,
    decoration: TextDecoration.underline,
  );
}
