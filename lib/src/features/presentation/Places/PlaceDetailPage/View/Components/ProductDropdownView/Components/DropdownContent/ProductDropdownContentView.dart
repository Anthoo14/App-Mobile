import 'package:delivery/src/Features/Domain/Entities/Order/OrderEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import '../../../ProductCardView/ProductCardView.dart';

class ProductDropdownContentView extends StatefulWidget {
  PlaceDetailViewModel viewModel;
  List<PlaceProductEntity> products;

  ProductDropdownContentView({ Key? key, 
                               required this.viewModel, 
                               required this.products }) : super(key: key);

  @override
  State<ProductDropdownContentView> createState() => _ProductDropdownContentViewState();
}

class _ProductDropdownContentViewState extends State<ProductDropdownContentView> {
  bool isItemInOrderList = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: SizedBox(
        width: getScreenWidth(context: context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
        children: _getProductCardsViews()),
      )
    );
  }

  List<Widget> _getProductCardsViews() {
    return widget.products.map((product) {
        return ProductCardView(isSelected: widget.viewModel.isProductInOrder(productId: product.id), 
                               product: product, 
                               viewModel: widget.viewModel);
    }).toList();
  }
}



