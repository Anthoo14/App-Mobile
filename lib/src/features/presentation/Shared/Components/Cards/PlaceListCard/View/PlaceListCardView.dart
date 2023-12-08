import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Utils/Helpers/DefaultImages/DefaultCardImageUrl.dart';
import 'package:flutter/material.dart';
import '../../../../../../../colors/colors.dart';
import '../../../Buttons/RoundedButton/View/RoundedButton.dart';

abstract class PlaceListCardViewDelegate {
  placeCardTapped({ required PlaceDetailEntity placeListDetailEntity });
}

class PlaceListCardView extends StatelessWidget with BaseView {
  final bool hasFreeDelivery;
  final PlaceDetailEntity placeListDetailEntity;


  PlaceListCardView({ required this.hasFreeDelivery,
                      required this.placeListDetailEntity });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          coordinator.showPlaceDetailPage(context: context,
                                          place: placeListDetailEntity);
        },
        child: Column(
          children: [
            Container(
              height: 125,
              child: SizedBox(
                height: 105,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LeftImagePlaceListCardView(imageUrl: placeListDetailEntity.imgs?.first ?? DefaultCardImageUrlHelper.defaultCardImageUrl),
                    RightContentPlaceListCardView(hasFreeDelivery: hasFreeDelivery,
                                                  placeListDetailEntity: placeListDetailEntity)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class LeftImagePlaceListCardView extends StatelessWidget {
  final String imageUrl;
  const LeftImagePlaceListCardView({ Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image(
          width: 80.0,
          height: 80.0,
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl)),
    );
  }
}

class RightContentPlaceListCardView extends StatelessWidget {
  final bool hasFreeDelivery;
  final PlaceDetailEntity placeListDetailEntity;

  RightContentPlaceListCardView({ required this.hasFreeDelivery,
                                        required this.placeListDetailEntity });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 5),
        height: 125,
        child:
        Column(
          children: [
            SizedBox(
              width: 270,
              child: Text(placeListDetailEntity.placeName,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0)),
            ),
            Container(
              margin: const EdgeInsets.only(top:5),
              width: 270,
              alignment: Alignment.centerLeft,
              child: Text(placeListDetailEntity.address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: greyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0)),
            ),
            Container(
              width: 270,
              margin: const EdgeInsets.only(top:5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.star, color: yellow, size: 16.0),
                  Text("${ placeListDetailEntity.ratingAverage }",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  const SizedBox(width: 5),
                  Text("(${ placeListDetailEntity.ratings } ratings)",
                      style: const TextStyle(
                          color: greyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0)),
                  Transform.translate(
                    offset: const Offset(50,-20),
                    child: SizedBox(
                      width: 100.0,
                      height: 39.0,
                      child: hasFreeDelivery
                          ? createElevatedButton(
                          func: () {},
                          labelButton: "Free Delivery",
                          labelFontSize: 9.0,
                          color: orange,
                          shape: const StadiumBorder())
                          : const Text(''),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}




