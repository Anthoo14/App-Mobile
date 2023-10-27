import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/headers.dart';

Widget cardVertical(
    {required BuildContext context,
    required double width,
    required double height,
    required ImageProvider<Object> image,
    required String title,
    required String subTitle}) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            image: image,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: header_text(
                  texto: title, fontWeight: FontWeight.w500, fontSize: 17.0),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: header_text(
                  texto: subTitle,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: gris),
            )
          ],
        )
      ],
    ),
  );
}
