import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/headers.dart';

Widget headerDoubleText(
    {required String textHeader, required String textAction, Function? func}) {
  return Container(
    child: Row(children: [
      header_text(texto: textHeader, fontSize: 20.0),
      Spacer(),
      GestureDetector(
        onTap: () => func,
        child: header_text(
            texto: textAction,
            color: naranja,
            fontWeight: FontWeight.w500,
            fontSize: 15.0),
      )
    ]),
  );
}
