import 'package:delivery/src/Features/Presentation/Filters/FilterPage/ViewModel/FilterPageViewModel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Buttons/RoundedButton/View/RoundedButton.dart';
import 'package:flutter/material.dart';
import '../../../../../../Colors/colors.dart';

class CuisinesFilter extends StatefulWidget {
  FilterPageViewModel viewModel;

  CuisinesFilter({ Key? key,
                   required this.viewModel }) : super(key: key);
  @override
  _CuisinesFilterState createState() => _CuisinesFilterState();
}

class _CuisinesFilterState extends State<CuisinesFilter> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: createCollectionsButtons(),
        )
      ],
    );
  }

  List<Widget> createCollectionsButtons() {
    List<Widget> childrens = [];
    widget.viewModel.collections.forEach( (collection) {
      childrens.add(_roundedButtonFilter(() {
        setState(() {
          widget.viewModel.filtersModel.collectionSelected = collection;
        });
      }, widget.viewModel.filtersModel.collectionSelected == collection, collection.name));
    });
    return childrens;
  }

  Widget _roundedButtonFilter(Function()? func,
                              bool isActive,
                              String labelText) {
    return Container(
      width: 160,
      height: 55,
      margin: const EdgeInsets.only(left: 5),
      child: createElevatedButton(
        labelButton: labelText,
        labelColor: isActive ? orange : greyColor,
        func: func,
        color: white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: isActive ? orange : greyColor)),
      ),
    );
  }
}


