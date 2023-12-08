import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/FiltersModelEntity.dart';
import 'package:delivery/src/Features/Presentation/Error/ErrorView.dart';
import 'package:delivery/src/Features/Presentation/Filters/FilterPage/View/Components/FilterPageContentView.dart';
import 'package:delivery/src/Features/Presentation/Filters/FilterPage/ViewModel/FilterPageViewModel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';
import '../../../../../Colors/colors.dart';

mixin FilterPageDelegate {
  applyFilters({ required FiltersModelEntity filters });
}

class FilterPage extends StatefulWidget {

  final FilterPageDelegate? delegate;

  FilterPage({ Key? key, this.delegate }) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> with BaseView {

  FilterPageViewModel viewModel;

  _FilterPageState({ FilterPageViewModel? filterPageViewModel }) : viewModel = filterPageViewModel ?? DefaultFilterPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: const TextView(texto: 'Filters', fontWeight: FontWeight.w600),
        leading: Container(
            padding: const EdgeInsets.only(top: 20, left: 9.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  viewModel.filtersModel.resetFilters();
                });
              },
              child: const TextView(
                  texto: 'Reset',
                  fontWeight: FontWeight.w500,
                  fontSize: 17.0),
            )),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              widget.delegate?.applyFilters(filters: viewModel.filtersModel);
            },
            child: Container(
                padding: const EdgeInsets.only(top: 20, right: 10.0),
                child: const TextView(
                    texto: 'Done',
                    color: orange,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0)),
          )
        ],
      ),
      body: FutureBuilder(
          future: viewModel.viewInitState(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
                return loadingView;
              case ConnectionState.done:
                switch(snapshot.data) {
                  case FilterPageViewModelState.viewLoadedState:
                    return FilterPageContentView(viewModel: viewModel);
                  default:
                    return ErrorView();
                }
              default:
                return loadingView;
            }
          }),
    );
  }
}
