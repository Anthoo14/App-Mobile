import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Presentation/Error/ErrorView.dart';
import 'package:delivery/src/Features/Presentation/Search/SearchPage/ViewModel/SearchPageViewModel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Carrousels/PlaceListCarrousel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Carrousels/RecentSearchCarrousel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/DoubleTextView/View/DoubleTextView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';
import '../../../../../../Colors/colors.dart';

class SearchPageSuggestionsView extends StatefulWidget {
  final String textHeader;
  final String textAction;
  final Function()? textActionTapped;
  final bool isRecentSearchSuggestions;
  final SearchPageViewModel viewModel;

  SearchPageSuggestionsView({ Key? key,
                              required this.textHeader,
                              required this.textAction,
                              required this.isRecentSearchSuggestions,
                              required this.viewModel,
                              this.textActionTapped})
                              : super(key: key);

  @override
  State<SearchPageSuggestionsView> createState() => _SearchPageSuggestionsViewState();
}

class _SearchPageSuggestionsViewState extends State<SearchPageSuggestionsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: widget.isRecentSearchSuggestions
            ? SearchPageSuggestionsListView(
                textHeader: widget.textHeader,
                textAction: widget.textAction,
                viewModel: widget.viewModel,
                textActionTapped: () {
                  setState(() {
                    widget.viewModel.clearRecentSearchInLocalStorage();
                  });
                })
            : SearchPageSuggestionsPopularPlacesListView(
                textHeader: widget.textHeader,
                textAction: widget.textAction,
                viewModel: widget.viewModel));
  }
}

class SearchPageSuggestionsListView extends StatelessWidget with BaseView {
  final String textHeader;
  final String textAction;
  final Function()? textActionTapped;
  final SearchPageViewModel viewModel;

  SearchPageSuggestionsListView({ Key? key,
                                  required this.textHeader,
                                  required this.textAction,
                                  required this.viewModel,
                                  this.textActionTapped })
                                  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewModel.fetchPlacesListByRecentSearches(),
        builder:
            (BuildContext context, AsyncSnapshot<PlaceListEntity> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return loadingView;
            case ConnectionState.done:
              if (snapshot.hasError || !snapshot.hasData) {
                return ErrorView();
              }

              if (snapshot.data?.placeList?.isEmpty ?? false) {
                return Container();
              }

              return Column(
                children: [
                  const SizedBox(height: 20.0),
                  DoubleTextView(
                      textHeader: textHeader,
                      textAction: textAction,
                      textActionTapped: textActionTapped),
                  RecentSearchCarrouselView(placeList: snapshot.data?.placeList ?? [])
                ],
              );
            default:
              return loadingView;
          }
        });
  }
}

class SearchPageSuggestionsPopularPlacesListView extends StatelessWidget with BaseView {
  final String textHeader;
  final String textAction;
  final Function()? textActionTapped;
  final SearchPageViewModel viewModel;

  SearchPageSuggestionsPopularPlacesListView(
      { Key? key,
      required this.textHeader,
      required this.textAction,
      required this.viewModel,
      this.textActionTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewModel.fetchPopularPlacesList(),
        builder: (BuildContext context, AsyncSnapshot<PlaceListEntity> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return loadingView;
            case ConnectionState.done:
              if (snapshot.hasError || !snapshot.hasData) {
                return ErrorView();
              }
              return CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        children: [
                          const SizedBox(height: 20.0),
                          DoubleTextView(
                              textHeader: textHeader,
                              textAction: textAction,
                              textActionTapped: textActionTapped),
                          const SizedBox(height: 5.0),
                          const TextView(
                              texto: 'We cannot find the item you are searching for, maybe a little spelling mistake?. ',
                              color: greyColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.0),
                          const SizedBox(height: 20.0),
                          DoubleTextView(
                              textHeader: "Related search",
                              textAction: textAction,
                              textActionTapped: textActionTapped),
                          const SizedBox(height: 20.0),
                          PlaceListCarrousel(
                              placeList: snapshot.data?.placeList ?? [],
                              isShortedVisualization: false,
                              carrouselStyle: PlaceListCarrouselStyle.list)
                        ],
                      )
                    ]),
                  )
                ],
              );
            default:
              return loadingView;
          }
        });
  }
}
