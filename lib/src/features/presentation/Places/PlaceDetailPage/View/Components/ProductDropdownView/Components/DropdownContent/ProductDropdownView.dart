import 'package:delivery/src/Features/Domain/Entities/Order/OrderEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ProductDropdownView/Components/DropdownContent/ProductDropdownContentView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/DoubleTextView/View/DoubleTextDropdownView.dart';
import 'package:flutter/material.dart';

class ProductDropdownView extends StatefulWidget {
  final PlaceCategoryEntity category;
  PlaceDetailViewModel viewModel;
  bool isExpanded = true;

  ProductDropdownView({ Key? key,
                        required this.category, 
                        required this.viewModel });

  @override
  State<ProductDropdownView> createState() => _ProductDropdownViewState();
}

class _ProductDropdownViewState extends State<ProductDropdownView> with DoubleTextDropdownViewDelegate {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      DoubleTextDropdownView(header: widget.category.categoryName,
                             delegate: this,
                             isExpanded: widget.isExpanded, 
                             dropdownRightText: "${widget.category.products.length}",),
      widget.isExpanded ? Transform.translate(
                                   offset: const Offset(0, -20), 
                                   child: ProductDropdownContentView(viewModel: widget.viewModel, 
                                                                     products: widget.category.products))
                        : Container(),
    ]);
  }

  @override
  dropDownTapped({ required bool isExpanded }) {
    setState(() {
      widget.isExpanded = isExpanded; 
    });
  }
}



