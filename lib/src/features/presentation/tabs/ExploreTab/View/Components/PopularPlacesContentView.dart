import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Carrousels/PlaceListCarrousel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Headers/HeaderView.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:flutter/material.dart';

class PopularPlacesContentView extends StatelessWidget with BaseView {

  List<PlaceDetailEntity> popularPlaces = [];
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