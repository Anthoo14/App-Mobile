
import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/features/presentation/MainCoordinator/MainCoordinator.dart';

import '../../../../../../Base/Views/BaseView.dart';
import '../../../../../domain/Entities/Collections/CollectionsEntity.dart';
import '../../../../Shared/Components/Carrousels/CollectionsCarrousel.dart';
import '../../../../Shared/Components/Headers/HeaderView.dart';

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
