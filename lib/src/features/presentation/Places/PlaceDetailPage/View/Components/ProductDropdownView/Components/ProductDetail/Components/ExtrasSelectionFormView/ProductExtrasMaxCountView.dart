import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../Colors/Colors.dart';

class ProductExtraMaxCountView extends StatelessWidget {
  PlaceProductExtrasEntity extra;

  ProductExtraMaxCountView({super.key, required this.extra});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          // Elige + cantidad de elementos a elegir + producto
          child: TextView(
              texto: _getTitleText(),
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: greyColor),
        ),
        const SizedBox(width: 8),
        extra.isRequired ?
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 80,
            height: 18,
            color: orange,
            child: const Center(
              child: TextView(
                  texto: 'Necesario',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ),
          )
        ) : Container(),
        const Spacer(),
      ],
    );
  }

  _getTitleText() {
    return extra.maxExtras > 1
        ? "Elige ${extra.maxExtras} productos -"
        : "Elige ${extra.maxExtras} producto -";
  }
}
