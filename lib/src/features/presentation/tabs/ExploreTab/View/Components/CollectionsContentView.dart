import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/Collections/CollectionsEntity.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Carrousels/CollectionsCarrousel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Headers/HeaderView.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:flutter/material.dart';

class CollectionsContentView extends StatelessWidget with BaseView {

  // Dependencies
  List<CollectionDetailEntity> collections = [];

  CollectionsContentView({ Key? key,
                           required this.collections }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return collections.isEmpty ?
    Container(
        height:20
    ) :
    Column(
      children: [
        GestureDetector(
            onTap: () {
              coordinator.showCollectionsPage(context: context, collections: collections);
            },
            child: HeaderView(textHeader:"Collections", textAction: "Show all")),
        CollectionsCarrousel(collections: collections)
      ],
    );
  }
}
