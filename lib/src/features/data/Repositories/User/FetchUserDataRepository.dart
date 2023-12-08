import '../../../../Base/AppError/AppError.dart';
import '../../../../Services/FirebaseServices/FirebaseRealTimeDatabaseService/Interfaces/Interfaces.dart';
import '../../../../Services/FirebaseServices/FirebaseRealTimeDatabaseService/Services/RealtimeDataBaseService.dart';
import '../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../Decodables/User/UserDecodable.dart';

abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData({ required String localId });
}

class DefaultFetchUserDataRepository extends FetchUserDataRepository {
  final String _path = "users/";

  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultFetchUserDataRepository({ RealtimeDataBaseService? realtimeDataBaseService }) : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> fetchUserData({ required String localId }) async {
    var fullpath = _path + localId;
    try {
      final result = await _realtimeDataBaseService.getData(path: fullpath);
      return Result.success(UserDecodable.fromMap(result));
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
