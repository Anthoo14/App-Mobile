import 'dart:ffi';

import 'package:flutter/material.dart';

Widget header_text(
    {String texto = "",
    TextAlign textAlign = TextAlign.justify,
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.bold,
    double? fontSize}) {
  return Text(
    texto,
    textAlign: textAlign,
    style: TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize),
  );
}



//'DELIVERED FAST FOOD TO YOUR DOOR' Colors.white 45.0