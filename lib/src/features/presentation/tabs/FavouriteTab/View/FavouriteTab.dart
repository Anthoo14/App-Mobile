import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Error/ErrorView.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/UserStateProvider.dart';
import 'package:delivery/src/Features/Presentation/Tabs/FavouriteTab/View/Components/FavouriteTabContentView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Colors/Colors.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({ Key? key }) : super(key: key);

  @override
  _FavouriteTabState createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> with BaseView, FavouritePageChangeStateDelegate {

  @override
  Widget build(BuildContext context) {

    Provider.of<DefaultUserStateProvider>(context).favouritePageChangeStateDelegate = this;

    return Scaffold(
      backgroundColor: bgGreyPage,
      body: FutureBuilder(
          future: Provider.of<DefaultUserStateProvider>(context).fetchUserFavouritePlaces(),
          builder: (BuildContext context, AsyncSnapshot<List<PlaceDetailEntity>> snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.waiting:
                return loadingView;
              case ConnectionState.done:
                if (snapshot.hasError || !snapshot.hasData) {
                  return ErrorView();
                }
                if (snapshot.hasData) {
                  return FavouriteTabContentView(placeList:snapshot.data ?? []);
                } else {
                  return Container();
                }
              default:
                return loadingView;
            }
          })
    );
  }

  @override
  placeFromFavouritesRemoved() {
   setState(() {});
  }
}
