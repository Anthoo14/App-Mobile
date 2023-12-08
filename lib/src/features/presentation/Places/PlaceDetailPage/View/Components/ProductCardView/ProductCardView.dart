import 'package:delivery/src/Features/Domain/Entities/Order/OrderEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/DropdownContent/RowsViews/ProductSelectedRowView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/DropdownContent/RowsViews/ProductUnSelectedRowView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';

class ProductCardView extends StatelessWidget {
  bool isSelected;
  PlaceProductEntity product;
  PlaceDetailViewModel viewModel;

  ProductCardView({ Key? key, 
                    required this.product, 
                    required this.isSelected, 
                    required this.viewModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
                width: getScreenWidth(context: context),
                height: 50.0,
                fit: BoxFit.cover,
                image: NetworkImage(product.imgs.first)),
          ),
          isSelected ? ProductSelectedRowView(viewModel: viewModel, product: product) 
                     : ProductUnSelectedRowView(viewModel: viewModel, product: product),
          Divider(color: Colors.black.withOpacity(0.5))
      ],
    );
  }
}


