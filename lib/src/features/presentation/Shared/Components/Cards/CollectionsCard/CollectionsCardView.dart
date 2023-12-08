import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/Collections/CollectionsEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Utils/Helpers/DefaultImages/DefaultCardImageUrl.dart';
import 'package:flutter/material.dart';

class CollectionCardView extends StatelessWidget with BaseView {

  // Dependencies
  CollectionDetailEntity collection;

  CollectionCardView({ Key? key,
                       required this.collection }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              coordinator.showCollectionsDetailPage(context: context,
                                                    collection: collection);
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image(
                    width: 300,
                    height: 150,
                    fit: BoxFit.cover,
                    image: NetworkImage(collection?.img ?? DefaultCardImageUrlHelper.defaultCardImageUrl),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    width: 300,
                    height: 150,
                    child: Center(
                        child: Text(collection.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700
                                    ))
                    ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
