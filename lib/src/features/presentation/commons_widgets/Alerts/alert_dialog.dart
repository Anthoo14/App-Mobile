import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';

Future ShowAlertDialog(BuildContext context, ImageProvider<Object> imagePath,
    String headerTitle, String headerSTitle, Widget doneBtn) async {
  await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          content: Container(
            height: 350,
            child: Column(
              children: [
                Image(image: imagePath, width: 130, height: 130),
                Container(
                    margin: const EdgeInsets.all(15.0),
                    child: header_text(
                        texto: headerTitle,
                        color: primaryColor,
                        fontSize: 20.0)),
                Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Text(headerSTitle,
                        style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.0))),
                doneBtn
              ],
            ),
          ),
        );
      });
}
