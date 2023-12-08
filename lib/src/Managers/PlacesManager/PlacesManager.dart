import 'package:flutter_vscode/src/Managers/Decodables/PlaceListDecodable.dart';
import 'package:flutter_vscode/src/Managers/Interfaces/PlacesManagerInterfaces.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/RealtimeDatabase/Interfaces/interfaces.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/RealtimeDatabase/Service/RealtimeDatabaseService.dart';
import 'package:flutter_vscode/src/Services/GeolocationService/Service/GeolocationServiceHelper.dart';
import 'package:flutter_vscode/src/Services/GeolocationService/Service/MockGeolocationService.dart';

import '../../Base/ApiService/appError.dart';
import '../../Services/GeolocationService/Interfaces/GeolocationServiceInterface.dart';

class DefaultPlacesManager extends PlacesManager {
  String placeListPath = "placeList";
  double distanceRange = 20.0;


  //Dependencies
final RealtimeDatabaseService _realtimeDatabaseService;
final GeolocationService _geolocationService;
final GeolocationServiceHelper _geolocationHelpersService;

DefaultPlacesManager({ RealtimeDatabaseService? realtimeDatabaseService,
  GeolocationService? geolocationService,
  GeolocationServiceHelper? geolocationHelpersService})
    : _realtimeDatabaseService = realtimeDatabaseService ?? DefaultRealtimeDatabaseService(),
      _geolocationService = geolocationService ?? MockGeolocationService(), // Bueno: DefaultGeolocationService() Mock: MockSuccessGeolocationService
      _geolocationHelpersService = geolocationHelpersService ?? DefaultGeolocationServiceHelper();
  @override
  Future<PlaceListDecodable> fetchNoveltyPlaceList() async {
    final fullPlaceList = await fetchPlaceList();
    fullPlaceList.placeList = _mapNoveltyPlaceList(placeList: fullPlaceList.placeList ?? []);
    return fullPlaceList;
  }

@override
  Future<PlaceListDecodable> fetchPlaceList() async{
  try {
    final response = await _realtimeDatabaseService.getData(path: placeListPath);
    final userPosition = await _geolocationService.getCurrentPosition();
    PlaceListDecodable decodable = _mapToPlaceListDecodable(response: response);
    decodable.placeList = _mapNearPlaceList(placeList: decodable.placeList ?? [],
        userLat: userPosition.value?.latitude ?? 0.0,
        userLng: userPosition.value?.longitude ?? 0.0);
    return decodable;
  } on Failure catch (f) {
    return Future.error(f);
  }
}

  @override
  Future<PlaceListDecodable> fetchPlacesListByCategory({required int categoryId}) async {
    final fullPlaceList = await fetchPlaceList();
    fullPlaceList.placeList = _mapPlaceListByCategory(placeList: fullPlaceList.placeList ?? [],
        categoryId: categoryId);
    return fullPlaceList;
  }

  @override
  Future<PlaceListDecodable> fetchPlacesListByQuery({required String query})  async {
    final fullPlaceList = await fetchPlaceList();
    fullPlaceList.placeList = _mapPlaceListByQuery(placeList: fullPlaceList.placeList ?? [],
        query: query);
    return fullPlaceList;
  }
  @override
  Future<PlaceListDecodable> fetchPlacesListByRecentSearches({required List<String> placeIds})  async {
    final fullPlaceList = await fetchPlaceList();
    fullPlaceList.placeList = _mapPlaceListByRecentSearches(placeList: fullPlaceList.placeList ?? [],
        placeIds: placeIds);
    return fullPlaceList;
  }


  @override
  Future<PlaceListDecodable> fetchPopularPlacesList()async {
    final fullPlaceList = await fetchPlaceList();
    fullPlaceList.placeList = _mapPopularPlaceList(placeList: fullPlaceList.placeList ?? []);
    return fullPlaceList;
  }


}


extension Mappers on DefaultPlacesManager {
  PlaceListDecodable _mapToPlaceListDecodable({ required Map<String, dynamic> response }) {
    List<PlaceList>? placeList = [];
    response.forEach((key, value) {
      placeList.add(PlaceList.fromMap(value));
    });
    return PlaceListDecodable(placeList: placeList);
  }

  List<PlaceList> _mapNearPlaceList({ required List<PlaceList> placeList,
    required double userLat,
    required double userLng }) {
    List<PlaceList> placeListFiltered = [];
    placeList.forEach( (place) {
      double distance = _geolocationHelpersService.getDistanceBetweenInKilometters(userLat, userLng, place.lat, place.long);
      // TODO: Puedes filtrar por los activos de esta manera -> && place.status == "active"
      // En mi caso no lo haré aquí, luego haremos otra feature 😉
      if (distance <= distanceRange) {
        placeListFiltered.add(place);
      }
    });
    return placeListFiltered;
  }

  List<PlaceList> _mapNoveltyPlaceList({ required List<PlaceList> placeList }) {
    List<PlaceList> placeListFiltered = [];
    placeList.forEach( (place) {
      if (place.isNovelty) {
        placeListFiltered.add(place);
      }
    });
    return placeListFiltered;
  }

  List<PlaceList> _mapPopularPlaceList({ required List<PlaceList> placeList }) {
    List<PlaceList> placeListFiltered = [];
    placeList.forEach( (place) {
      if (place.isPopularThisWeek) {
        placeListFiltered.add(place);
      }
    });
    return placeListFiltered;
  }

  List<PlaceList> _mapPlaceListByCategory({ required List<PlaceList> placeList,
    required int categoryId }) {
    List<PlaceList> placeListFiltered = [];
    placeList.forEach( (place) {
      if (place.collectionId == categoryId ) {
        placeListFiltered.add(place);
      }
    });
    return placeListFiltered;
  }

  List<PlaceList> _mapPlaceListByQuery({ required List<PlaceList> placeList,
    required String query }) {
    List<PlaceList> placeListFiltered = [];
    placeList.forEach((place) {
      if (query.isNotEmpty && place.placeName.toLowerCase().contains(query.toLowerCase()) ) {
        placeListFiltered.add(place);
      }
    });
    return placeListFiltered;
  }

  List<PlaceList> _mapPlaceListByRecentSearches({ required List<PlaceList> placeList,
    required List<String> placeIds }) {
    List<PlaceList> placeListFiltered = [];
    for (var placeId in placeIds) {
      placeList.forEach((place) {
        if (place.placeId == placeId) {
          placeListFiltered.add(place);
        }
      });
    }
    return placeListFiltered;
  }
}