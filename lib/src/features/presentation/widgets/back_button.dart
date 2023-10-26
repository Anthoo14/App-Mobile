import 'package:flutter/material.dart';

Widget backButtton(BuildContext context, Color color) {
  return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: color,
        size: 28.0,
      ));
}
