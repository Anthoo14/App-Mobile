import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Colors/Colors.dart';

class ShareIconView extends StatelessWidget {
  PlaceDetailViewModel viewModel;

  ShareIconView({ super.key, required this.viewModel });

  @override
  Widget build(BuildContext context) {
    return IconButton(
              icon: const Icon(
                Icons.ios_share,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
               // TODO: Add user action
              });
  }
}