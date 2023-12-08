import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Colors/Colors.dart';

class BookMarkView extends StatelessWidget {
  PlaceDetailViewModel viewModel;

  BookMarkView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: viewModel.isUserFavouritePlaceStream,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          bool isUserFavourite = snapshot.data ?? false;

          return IconButton(
              icon: Icon(
                isUserFavourite ? Icons.bookmark : Icons.bookmark_border,
                color: isUserFavourite ? pink : Colors.white,
                size: 30,
              ),
              onPressed: () {
                viewModel.favouriteIconTapped(!isUserFavourite);
              });
        });
  }
}