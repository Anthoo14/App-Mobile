import 'package:delivery/src/Features/Domain/Entities/Collections/CollectionsEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Domain/UseCases/Places/FavouritesPlacesUseCase/FavouritesPlacesUseCase.dart';
import 'package:delivery/src/Features/Domain/UseCases/Places/PlaceListUseCase/PlaceListUseCase.dart';

enum CollectionDetailPageViewState { viewLoadedState }

abstract class CollectionDetailPageViewModelInput {
  Future<CollectionDetailPageViewState> viewInitState();
  CollectionDetailEntity getCollection();
  List<PlaceDetailEntity> filteredPlacesByCategory = [];
}

abstract class CollectionDetailPageViewModel extends CollectionDetailPageViewModelInput {}

class DefaultCollectionDetailPageViewModel extends CollectionDetailPageViewModel {
  // Dependencies
  CollectionDetailEntity collection;
  final PlaceListUseCase _placeListUseCase;
  final FavouritesPlacesUseCase _favouritesPlacesUseCase;

  DefaultCollectionDetailPageViewModel({ required this.collection,
                                         PlaceListUseCase? placeListUseCase,
                                         FavouritesPlacesUseCase? favouritesPlacesUseCase })
      : _placeListUseCase = placeListUseCase ?? DefaultPlaceListUseCase(),
        _favouritesPlacesUseCase = favouritesPlacesUseCase ?? DefaultFavouritesPlacesUseCase();

  @override
  Future<CollectionDetailPageViewState> viewInitState() async {
    final placesResult = await _placeListUseCase.fetchPlacesListByCategory(
        categoryId: collection.id);
    filteredPlacesByCategory = placesResult.placeList ?? [];
    return CollectionDetailPageViewState.viewLoadedState;
  }

  CollectionDetailEntity getCollection() {
    return collection;
  }
}
