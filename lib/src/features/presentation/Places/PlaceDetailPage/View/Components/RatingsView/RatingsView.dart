import 'package:delivery/src/Features/Presentation/Shared/Components/Cards/CardRatingView/CardRatingView.dart';
import 'package:flutter/material.dart';

class RatingsView extends StatelessWidget {
  List<int> ratingsList;

  RatingsView({ Key? key,
                required this.ratingsList }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: getChildrenCards(),
        )
      ],
    );
  }

  List<Widget> getChildrenCards() {
    return ratingsList.map((e) => CardRatingView()).toList();
  }
}


