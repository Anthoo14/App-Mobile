import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Colors/Colors.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Error/ErrorView.dart';
import 'package:delivery/src/Features/Presentation/Search/SearchPage/View/Components/SearchPageResultsView.dart';
import 'package:delivery/src/Features/Presentation/Search/SearchPage/View/Components/SearchPageSuggestions.dart';
import 'package:delivery/src/Features/Presentation/Search/SearchPage/ViewModel/SearchPageViewModel.dart';
import 'package:flutter/material.dart';

class SearchPage extends SearchDelegate with BaseView {

  final SearchPageViewModel viewModel;

  SearchPage({ SearchPageViewModel? searchPageViewModel })
   : viewModel = searchPageViewModel ?? DefaultSearchPageViewModel();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: const TextTheme(
        // Use this to change the query's text style
        headline6: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: orange,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        // Use this change the placeholder's text style
        hintStyle: TextStyle(fontSize: 18.0),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: viewModel.fetchPlacesListByQuery(query: query),
        builder: (BuildContext context, AsyncSnapshot<PlaceListEntity> snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting:
              return loadingView;
            case ConnectionState.done:
              if (snapshot.hasError || !snapshot.hasData) {
                return ErrorView();
              }
              if (snapshot.data?.placeList?.isEmpty ?? true) {
                return SearchPageSuggestionsView(textHeader: 'No results found',
                                                 textAction: '',
                                                 isRecentSearchSuggestions: false,
                                                 viewModel: viewModel);
              } else {
                return SearchPageBuildResultsView(places: snapshot.data?.placeList ?? []);
              }
            default:
              return loadingView;
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return SearchPageSuggestionsView(textHeader: 'Recently viewed',
                                       textAction: 'Clear All',
                                       isRecentSearchSuggestions: true,
                                       viewModel: viewModel);
    } else {
      // TODO: Implementar sugerencias de búsqueda en base a la query
      return Container();
    }
  }
}




