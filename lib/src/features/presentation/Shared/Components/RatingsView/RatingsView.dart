import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Cards/CardRatingView/CardRatingView.dart';
import 'package:flutter/material.dart';

class RatingsView extends StatelessWidget {
  List<PlaceRatingEntity> placeRatings;

  RatingsView({Key? key, required this.placeRatings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: _getPlaceRatingsViews(),
        )
      ],
    );
  }

  List<Widget> _getPlaceRatingsViews() {
    return placeRatings.map((placeRating) => CardRatingView(placeRating: placeRating)).toList();
  }
}
