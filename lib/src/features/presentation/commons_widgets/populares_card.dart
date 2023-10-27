import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/headers.dart';

Widget popularesCard({
  required BuildContext context,
  double marginTop = 0.0,
  double marginRight = 0.0,
  double marginBottom = 0.0,
  double marginLeft = 10.0,
  required String title,
  required String subTitle,
  required String review,
  required String rating,
  required bool hasActionButton,
  required String buttonText,
  required ImageProvider<Object> image,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(
              top: marginTop,
              left: marginLeft,
              right: marginRight,
              bottom: marginBottom),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                    width: 80, height: 80, fit: BoxFit.cover, image: image),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 7.0),
                        child: header_text(
                            texto: title, color: Colors.black, fontSize: 17.0)),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        subTitle,
                        style: TextStyle(
                            color: gris,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: amarillo, size: 16.0),
                        Text(review,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0,
                            )),
                        Container(
                          margin: const EdgeInsets.only(left: 5.0),
                          child: Text(rating,
                              style: TextStyle(
                                color: gris,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 45.0),
                          width: 110.0,
                          height: 18.0,
                          child: hasActionButton
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      backgroundColor: naranja,
                                      elevation: 0.5),
                                  onPressed: () {},
                                  child: header_text(
                                      texto: buttonText,
                                      color: Colors.white,
                                      fontSize: 11.0),
                                )
                              : Text(''),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}
