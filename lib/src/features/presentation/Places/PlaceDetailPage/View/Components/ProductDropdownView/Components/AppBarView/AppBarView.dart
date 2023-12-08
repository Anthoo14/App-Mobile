import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/BookMarkView/BookMarkView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/FlexibleSpaceBar/FlexibleSpaceBarContentView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/ShareIconView/ShareIconView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import 'package:delivery/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../Colors/Colors.dart';

class AppBarView extends StatelessWidget {
  PlaceDetailViewModel viewModel;

  AppBarView({ Key? key, required this.viewModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
            backgroundColor: orange,
            expandedHeight: getScreenHeight(context: context, multiplier: 0.35),
            flexibleSpace: FlexibleSpaceBarContentView(viewModel: viewModel),
            leading: Builder(builder: (BuildContext context) {
              return const BackButtonView(color: Colors.white);
            }),
            actions: [
              ShareIconView(viewModel: viewModel),
              BookMarkView(viewModel: viewModel)
            ],
          );
  }
}