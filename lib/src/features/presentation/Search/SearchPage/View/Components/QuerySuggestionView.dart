import 'package:delivery/src/Features/Presentation/Search/SearchPage/ViewModel/SearchPageViewModel.dart';
import 'package:flutter/material.dart';

class QuerySuggestionView extends StatelessWidget {

  final String suggestion;
  final SearchPageViewModel viewModel;

  QuerySuggestionView({ Key? key,
                        required this.suggestion,
                        required this.viewModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          const Icon(Icons.search),
          SizedBox(width: 6),
          Text(suggestion)
        ],
      ),
    );
  }

}