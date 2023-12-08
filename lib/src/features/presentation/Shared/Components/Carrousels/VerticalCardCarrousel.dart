import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Cards/VerticalCards/NoveltyPlacesVerticalCardView/NoveltyPlacesVerticalCardView.dart';
import 'package:flutter/material.dart';

class VerticalCardCarrousel extends StatelessWidget {

  final List<PlaceDetailEntity> placeList;

  const VerticalCardCarrousel({ Key? key, required this.placeList }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350.0,
        child: ListView.builder(
            itemCount: placeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return NoveltyPlacesVerticalCardView(placeListDetailEntity: placeList[index]);
            }));
  }
}




