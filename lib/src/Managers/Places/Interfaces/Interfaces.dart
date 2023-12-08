import 'package:delivery/src/Managers/Places/Decodables/PlaceList/PlaceListDecodable.dart';

abstract class PlacesManager {
    Future<PlaceListDecodable> fetchPlaceList(); 
    Future<PlaceListDecodable> fetchNoveltyPlaceList();
    Future<PlaceListDecodable> fetchPopularPlacesList();
    Future<PlaceListDecodable> fetchPlacesListByCategory({ required int categoryId});
    Future<PlaceListDecodable> fetchPlacesListByQuery({ required String query});
    Future<PlaceListDecodable> fetchPlacesListByRecentSearches({ required List<String> placeIds });
}