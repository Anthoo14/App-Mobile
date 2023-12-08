import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Utils/Helpers/DefaultImages/DefaultCardImageUrl.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Utils/Styles/BoxShadowDecoration.dart';
import '../../../../../../../colors/colors.dart';
import '../../../Texts/TextView/View/TextView.dart';

mixin FavouritesCardViewDelegate {
  favouriteIconTapped(bool isTapped, String placeId);
}

class FavouritesCardView extends StatefulWidget {

  bool isFavourite;
  final PlaceDetailEntity placeListDetailEntity;
  final FavouritesCardViewDelegate? delegate;

  FavouritesCardView({ required this.isFavourite,
                       required this.placeListDetailEntity,
                       this.delegate });

  @override
  State<FavouritesCardView> createState() => _FavouritesCardViewState();
}

class _FavouritesCardViewState extends State<FavouritesCardView> with BaseView {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        coordinator.showPlaceDetailPage(context: context,
                                        place: widget.placeListDetailEntity);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        height: 125,
        padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
        decoration: getBoxDecorationWithShadows(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeftImageView(
                imageUrl: widget.placeListDetailEntity.imgs?.first ??
                    DefaultCardImageUrlHelper.defaultCardImageUrl),
            PlaceContentDetailView(placeListDetailEntity: widget.placeListDetailEntity),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: IconButton(
                  icon: Icon(
                    Icons.bookmark,
                    size: 35.0,
                    color: widget.isFavourite ? pink : Colors.grey[300],
                  ),
                  onPressed: () {
                     setState(() {
                       widget.isFavourite = !widget.isFavourite;
                       widget.delegate?.favouriteIconTapped(widget.isFavourite, widget.placeListDetailEntity.placeId);
                     });
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class LeftImageView extends StatelessWidget {
  final String imageUrl;

  const LeftImageView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image(
            width: 90.0,
            height: 90.0,
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl)),
      ),
    );
  }
}

class PlaceContentDetailView extends StatelessWidget {
  final PlaceDetailEntity placeListDetailEntity;
  const PlaceContentDetailView({Key? key, required this.placeListDetailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 8),
              width: 150,
              child: Text(
                placeListDetailEntity.placeName,
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              )),
          Container(
            width: 190,
            margin: const EdgeInsets.only(top: 5.0),
            child: Text(
              placeListDetailEntity.address,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                  color: greyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.0),
            ),
          ),
          const SizedBox(height: 5),
          Transform.translate(
            offset: const Offset(-5, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.star, color: yellow, size: 16),
                TextView(
                    texto: " ${placeListDetailEntity.ratingAverage}",
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0),
                TextView(
                    texto: "  (${placeListDetailEntity.ratings} ratings)",
                    color: greyColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0)
              ],
            ),
          )
        ],
      ),
    );
  }
}
