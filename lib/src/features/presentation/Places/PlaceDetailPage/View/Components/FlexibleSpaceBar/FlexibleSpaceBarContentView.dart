import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/FlexibleSpaceBar/PlaceDetailInfoView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/FlexibleSpaceBar/PlaceDetailStatsInfoView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/Components/FlexibleSpaceBar/PromoPlaceDetailView.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:delivery/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:flutter/material.dart';

class FlexibleSpaceBarContentView extends StatelessWidget {
  PlaceDetailViewModel viewModel;
  
  FlexibleSpaceBarContentView({ Key? key, 
                                required this.viewModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        children: [
          Image(
              width: double.infinity,
              height: getScreenHeight(context: context, multiplier: 0.42),
              fit: BoxFit.fill,
              image: NetworkImage(viewModel.place.imgs.first)),
          Container(
              decoration:
              const BoxDecoration(color: Colors.black45),
              width: double.infinity,
              height: getScreenHeight(context: context, multiplier: 0.42)),
          Container(
            height: getScreenHeight(context: context, multiplier: 0.42),
            margin: EdgeInsets.only(top: getScreenHeight(context: context, multiplier: 0.10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PromoPlaceDetailView(), 
                PlaceDetailInfoView(viewModel: viewModel),
                PlaceDetailStatsInfoView(viewModel: viewModel),
              ],
            ),
          )
        ],
      ),
    );
  }
}
