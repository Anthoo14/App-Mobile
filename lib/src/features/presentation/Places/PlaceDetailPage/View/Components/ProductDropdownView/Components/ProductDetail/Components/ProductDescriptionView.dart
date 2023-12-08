import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:flutter/material.dart';

class ProductDescriptionView extends StatelessWidget {
  PlaceProductEntity product;

  ProductDescriptionView({ Key? key, required this.product }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: getScreenWidth(context: context, multiplier: 0.79),
                child: Text(
                    product.productDescription,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                ),
            );
  }
}