import '../../../../Services/FirebaseServices/FirebaseRealTimeDatabaseService/Interfaces/Interfaces.dart';
import '../../../../Services/FirebaseServices/FirebaseRealTimeDatabaseService/Services/RealtimeDataBaseService.dart';
import '../../Decodables/Collections/CollectionsDecodable.dart';

abstract class CollectionsRepository {
  Future<CollectionsDecodable> fetchCollections();
}

class DefaultCollectionsRepository extends CollectionsRepository {

  String _path = "collections/";

  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;
  
  DefaultCollectionsRepository({ RealtimeDataBaseService? realtimeDataBaseService })
          : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<CollectionsDecodable> fetchCollections() async {
    final response = await _realtimeDataBaseService.getData(path: _path);
    CollectionsDecodable decodable = CollectionsDecodable.fromMap(response);
    return decodable;
  }
}
