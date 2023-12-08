import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';
import '../../../../../../Colors/colors.dart';

class CardRatingView extends StatelessWidget {
  PlaceRatingEntity placeRating;
  
  CardRatingView({ Key? key, required this.placeRating }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                    width: 49.0,
                    height: 43.0,
                    fit: BoxFit.cover,
                    image: NetworkImage(placeRating.userAvatar)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                        texto: placeRating.userName,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    TextView(
                        texto: '${placeRating.userRatingsCount} Reviews',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: greyColor)
                  ],
                ),
              ),
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: orange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(
                          texto: "${placeRating.rating}",
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      const Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: TextView(
                texto: placeRating.comment,
                color: greyColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left),
          )
        ],
      ),
    );
  }
}