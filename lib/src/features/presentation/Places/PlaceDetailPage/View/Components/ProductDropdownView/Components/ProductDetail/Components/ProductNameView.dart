import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';


class ProductNameView extends StatelessWidget {
  PlaceProductEntity product;
  
  ProductNameView({super.key, required this.product });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // Nombre del producto
      child: TextView(texto: product.productName, fontSize: 18),
    );
  }
}