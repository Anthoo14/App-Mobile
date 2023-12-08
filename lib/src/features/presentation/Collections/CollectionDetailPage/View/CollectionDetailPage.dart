import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Presentation/Collections/CollectionDetailPage/View/Components/CollectionDetailPageContentView.dart';
import 'package:delivery/src/Features/Presentation/Collections/CollectionDetailPage/ViewModel/CollectionDetailPageViewModel.dart';
import 'package:delivery/src/Features/Presentation/Error/ErrorView.dart';
import 'package:flutter/material.dart';

class CollectionDetailPage extends StatefulWidget {
  CollectionDetailPageViewModel viewModel;

  CollectionDetailPage({ required CollectionDetailPageViewModel collectionDetailPageViewModel })
   : viewModel = collectionDetailPageViewModel;

  @override
  State<CollectionDetailPage> createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage> with BaseView {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: widget.viewModel.viewInitState(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
                return loadingView;
              case ConnectionState.done:
                if (snapshot.hasError || !snapshot.hasData) {
                  return ErrorView();
                }
                switch(snapshot.data) {
                  case CollectionDetailPageViewState.viewLoadedState:
                    return CollectionDetailPageContentView(collection: widget.viewModel.getCollection(),
                                                           filteredPlacesByCategory: widget.viewModel.filteredPlacesByCategory);
                  default:
                    return ErrorView();
                }
              default:
                return loadingView;
            }
          }),
    );
  }
}
