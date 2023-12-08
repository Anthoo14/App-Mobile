import 'package:delivery/src/Features/Domain/Entities/Order/OrderEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/ExtrasSelectionFormView/ExtrasListView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/ExtrasSelectionFormView/ProductExtrasMaxCountView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:flutter/material.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/ProductDetail/Components/ExtrasSelectionFormView/ExtraDescriptionView.dart';

mixin ExtraSelectionFormViewDelegate {
  updateProductForOrder({ required ProductOrderEntity product});
}

class OptionsSelectionFormView extends StatelessWidget {
  PlaceDetailViewModel viewModel;
  ProductOrderEntity product;
  PlaceProductExtrasEntity extra;
  ExtraSelectionFormViewDelegate delegate;

  OptionsSelectionFormView(
      {Key? key,
      required this.extra,
      required this.viewModel,
      required this.product, 
      required this.delegate })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExtraDescriptionView(extra: extra),
        const SizedBox(height: 8),
        ProductExtraMaxCountView(extra: extra),
        const SizedBox(height: 16),
        ExtrasListView(viewModel: viewModel, extra: extra, product: product, delegate: delegate)
      ],
    );
  }
}
