import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/RatingsView/RatingsView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';
import '../../../../Colors/colors.dart';
import '../../Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';

class PlaceRatingsPage extends StatelessWidget {
  List<PlaceRatingEntity> placeRatings;

  PlaceRatingsPage({ Key? key, required this.placeRatings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        leading: Builder(
          builder: (BuildContext context) {
            return const BackButtonView(color: Colors.black);
          },
        ),
        backgroundColor: white,
        title: const TextView(
            texto: 'Ratings',
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RatingsView(placeRatings: placeRatings)),
    );
  }
}
