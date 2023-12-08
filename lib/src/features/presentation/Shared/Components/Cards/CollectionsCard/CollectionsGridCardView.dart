import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/Collections/CollectionsEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:flutter/material.dart';

class CollectionGridCardView extends StatelessWidget with BaseView {

  // Dependencies
  CollectionDetailEntity collection;

  CollectionGridCardView({ Key? key,
                            required this.collection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          coordinator.showCollectionsDetailPage(context: context,
                                                collection: collection);
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                  width: 165,
                  height: 190,
                  fit: BoxFit.cover,
                  image: NetworkImage(collection.img)),
            ),
            Container(
              width: 165,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Center(
              child: TextView(
                  texto: collection.name ?? "",
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
