import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Colors/colors.dart';

class PlaceDetailInfoView extends StatelessWidget {
  PlaceDetailViewModel viewModel;

  PlaceDetailInfoView({ Key? key, required this.viewModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          margin: const EdgeInsets.symmetric(vertical: 7.0),
          child: Text(viewModel.place.placeName, style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0
          ))
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              const Icon(Icons.location_on, color: greyColor),
              const SizedBox(width: 8),
              SizedBox(
                width: 250,
                child: TextView(
                    texto: viewModel.place.address,
                    color: greyColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
              ),
            ],
          ),
        )
      ],
    );
  }
}
