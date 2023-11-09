import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';
import 'package:flutter_vscode/src/utils/Styles/boxDecorationShadows.dart';

Widget favouritesCard({
  required BuildContext context,
  double marginTop = 15.0,
  double marginRight = 0.0,
  double marginBottom = 0.0,
  double marginLeft = 0.0,
  bool isFavourite = true,
  required String title,
  required String subTitle,
  required String review,
  required String rating,
  required bool hasActionButton,
  required String buttonText,
  required ImageProvider<Object> image,
}) {
  return Container(
    margin: EdgeInsets.only(
        top: marginTop,
        left: marginLeft,
        right: marginRight,
        bottom: marginBottom),
    padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
    width: double.infinity,
    decoration: createBoxDecorationWhitShadows(),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image(
            image: image,
            width: 90.0,
            height: 90.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 7.0),
                    child: header_text(
                        texto: title,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                  const SizedBox(
                    width: 25.0,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark,
                        size: 35.0,
                        color: isFavourite ? rosa : Colors.grey[300],
                      ))
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(bottom: 5.0),
                child: header_text(
                    texto: subTitle,
                    color: gris,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: amarillo,
                    size: 16,
                  ),
                  header_text(
                      texto: review,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                  header_text(
                      texto: rating,
                      color: gris,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    width: 100.0,
                    height: 20.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: naranja,
                          elevation: 0.5),
                      onPressed: () {},
                      child: const Text(
                        'Free Delivery',
                        style: TextStyle(color: Colors.white, fontSize: 11.0),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
