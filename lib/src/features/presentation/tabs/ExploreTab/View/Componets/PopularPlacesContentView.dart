import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/features/presentation/MainCoordinator/MainCoordinator.dart';

import '../../../../../../Base/Views/BaseView.dart';
import '../../../../../domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import '../../../../Shared/Components/Carrousels/PlaceListCarrousel.dart';
import '../../../../Shared/Components/Headers/HeaderView.dart';

class PopularPlacesContentView extends StatelessWidget with BaseView {

  List<PlaceListDetailEntity> popularPlaces = [];
  PopularPlacesContentView({ Key? key, required this.popularPlaces }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return popularPlaces.isEmpty ?
    Container(
        height: 20
    ) :
    Column(
      children: [
        GestureDetector(
            onTap: () => coordinator.showPlaceListPage(context: context,
                popularPlaces: popularPlaces),
            child: HeaderView(textHeader:"Popular this week",
                textAction: "Show all")),
        const SizedBox(
          height: 15.0,
        ),
        PlaceListCarrousel(placeList: popularPlaces,
            isShortedVisualization: true,
            carrouselStyle: PlaceListCarrouselStyle.list)
      ],
    );
  }
}