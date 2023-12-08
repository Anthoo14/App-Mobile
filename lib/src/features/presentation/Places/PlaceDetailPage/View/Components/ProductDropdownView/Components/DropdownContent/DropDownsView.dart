import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/DropdownContent/ProductDropdownView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:flutter/material.dart';

class DropDownsView extends StatelessWidget {
  PlaceDetailViewModel viewModel;

  DropDownsView({ super.key, required this.viewModel });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: _getProductDropdownViews(),
      ),
    );
  }

  List<Widget> _getProductDropdownViews() {
    return viewModel.place.categories.map((category) {
        return ProductDropdownView(category: category, viewModel: viewModel);
    }).toList();
  }
}