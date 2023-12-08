import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Managers/Places/Decodables/PlaceList/PlaceListDecodable.dart';
import 'package:delivery/src/Services/FirebaseServices/FirebaseRealTimeDatabaseService/Interfaces/Interfaces.dart';
import 'package:delivery/src/Services/FirebaseServices/FirebaseRealTimeDatabaseService/Services/RealtimeDataBaseService.dart';

abstract class PlaceDetailRepository {
  Future<void> savePlaceDetail({required PlaceDetailDecodable placeDetail});
  Future<PlaceDetailDecodable> fetchPlaceDetail({required String placeId});
}

class DefaultPlaceDetailRepository extends PlaceDetailRepository {
  final String _path = "placeList/";

  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultPlaceDetailRepository({ RealtimeDataBaseService? realtimeDataBaseService })
      : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<PlaceDetailDecodable> fetchPlaceDetail({ required String placeId }) async {
    try {
      final response = await _realtimeDataBaseService.getData(
          path: _path + placeId);
      return PlaceDetailDecodable.fromMap(response);
    } on Failure catch (f) {
      return Future.error(f);
    }
  }

  @override
  Future<void> savePlaceDetail({ required PlaceDetailDecodable placeDetail })  {
    return _realtimeDataBaseService.putData(bodyParameters: placeDetail.toMap(), path: _path + placeDetail.placeId);
  }

  
}
