import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';

class ExtraDescriptionView extends StatelessWidget {
  PlaceProductExtrasEntity extra;

  ExtraDescriptionView({ super.key, required this.extra });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // Texto elegido por el admin + nombre del producto
      child: TextView(
          texto: extra.title,
          fontSize: 16,
          fontWeight: FontWeight.w700),
    );
  }
}