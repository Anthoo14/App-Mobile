import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/FiltersModelEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Domain/UseCases/Places/PlaceListUseCase/PlaceListUseCase.dart';
import 'package:delivery/src/Features/Presentation/Filters/FilterPage/View/FilterPage.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Carrousels/PlaceListCarrousel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/DoubleTextView/View/DoubleTextView.dart';
import 'package:flutter/material.dart';

class SearchPageBuildResultsView extends StatefulWidget {

  // Dependencies
  List<PlaceDetailEntity> places = [];

  SearchPageBuildResultsView({ Key? key,
                               required this.places }) : super(key: key);

  @override
  State<SearchPageBuildResultsView> createState() => _SearchPageBuildResultsViewState();
}

class _SearchPageBuildResultsViewState extends State<SearchPageBuildResultsView> with BaseView, FilterPageDelegate {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  const DoubleTextView(textHeader: 'Resultados',
                                       textAction: ''),
                  const SizedBox(height: 20.0),
                  PlaceListCarrousel(placeList: widget.places,
                                     isShortedVisualization: false,
                                     carrouselStyle: PlaceListCarrouselStyle.list)
                ],
              ),
            )
          ]),
        )
      ],
    );
  }

  // TODO: Por implementar
  @override
  applyFilters({ required FiltersModelEntity filters }) {
    setState(() {
      // TODO: Para cuando vayamos a meter feature de filtros
     // widget.places = DefaultPlaceListUseCase.filterPlaceList(places: widget.places, filters: filters);
    });
  }
}
