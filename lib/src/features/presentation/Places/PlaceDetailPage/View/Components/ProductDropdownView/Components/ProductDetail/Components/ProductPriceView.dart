import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:delivery/src/Utils/Helpers/Checkout/CheckoutHelper.dart';
import 'package:flutter/material.dart';

class ProductPriceView extends StatelessWidget {
  PlaceProductEntity product;

  ProductPriceView({ super.key, required this.product });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // Precio del producto
      child: TextView(texto: CheckoutHelper.formatPriceInEuros(product.productPrice), fontSize: 18, fontWeight: FontWeight.w500),
    );
  }
}