import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Carrousels/PlaceListCarrousel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';
import '../../../../../../Colors/colors.dart';

class FavouriteTabContentView extends StatelessWidget {

  List<PlaceDetailEntity> placeList;

  FavouriteTabContentView({ Key? key,
                            required this.placeList }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: const Text(''),
          backgroundColor: white,
          title: TextView(
              texto: 'My Favourites',
              color: const ColorScheme.dark().onSecondary,
              fontSize: 17,
              fontWeight: FontWeight.w600),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
              Transform.translate(
                offset: const Offset(0, -40),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PlaceListCarrousel(
                      placeList: placeList,
                      isShortedVisualization: false,
                      carrouselStyle: PlaceListCarrouselStyle.listCards),
                ),
              )
            ]))
      ],
    );
  }
}
