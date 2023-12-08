import 'package:delivery/src/Features/Domain/Entities/Collections/CollectionsEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Cards/CollectionsCard/CollectionsCardView.dart';
import 'package:flutter/material.dart';

class CollectionsCarrousel extends StatelessWidget {

  // Dependencies
  List<CollectionDetailEntity> collections;
  CollectionsCarrousel({ Key? key,
                         required this.collections }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180.0,
        child: ListView.builder(
            itemCount: collections.length < 5 ? collections.length : 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return CollectionCardView(collection: collections[index]);
            }));
  }
}
