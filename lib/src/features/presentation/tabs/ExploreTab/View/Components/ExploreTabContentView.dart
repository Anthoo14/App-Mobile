import 'package:delivery/src/Features/Presentation/Tabs/ExploreTab/View/Components/CollectionsContentView.dart';
import 'package:delivery/src/Features/Presentation/Tabs/ExploreTab/View/Components/NoveltyPlacesContentView.dart';
import 'package:delivery/src/Features/Presentation/Tabs/ExploreTab/View/Components/PopularPlacesContentView.dart';
import 'package:delivery/src/Features/Presentation/Tabs/ExploreTab/View/Components/SearchTopBar.dart';
import 'package:delivery/src/Features/Presentation/Tabs/ExploreTab/ViewModel/ExploreTabViewModel.dart';
import 'package:flutter/material.dart';

class ExploreTabContentView extends StatelessWidget {

  final ExploreViewModel viewModel;

  const ExploreTabContentView({ Key? key, required this.viewModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildListDelegate([
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SearchTopBar(),
                    NoveltyPlacesContentView(noveltyPlaces: viewModel.noveltyPlaces),
                    const SizedBox(
                      height: 10.0,
                    ),
                    PopularPlacesContentView(popularPlaces: viewModel.popularPlaces),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CollectionsContentView(collections: viewModel.collections)
                  ],
                ))
          ]))
    ]);
  }
}


