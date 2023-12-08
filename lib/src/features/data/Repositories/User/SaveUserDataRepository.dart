import '../../../../Base/AppError/AppError.dart';
import '../../../../Base/Constants/ErrorMessages.dart';
import '../../../../Services/FirebaseServices/FirebaseRealTimeDatabaseService/Interfaces/Interfaces.dart';
import '../../../../Services/FirebaseServices/FirebaseRealTimeDatabaseService/Services/RealtimeDataBaseService.dart';
import '../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../Decodables/User/UserDecodable.dart';
import 'UserBodyParameters.dart';

abstract class _Paths {
  static String userCollection = "users/";
}

abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Failure>> saveUserData({ required UserBodyParameters params });
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository {
  
  // * Dependencies
  final RealtimeDataBaseService _realtimeDataBaseService;

  DefaultSaveUserDataRepository({ RealtimeDataBaseService? realtimeDataBaseService })
          : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> saveUserData({ required UserBodyParameters params }) async {

    if (params.localId == null) {
      return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
    }

    var path = _Paths.userCollection + params.localId!;

    try {
      final result = await _realtimeDataBaseService.putData(bodyParameters: params.toMap(), path: path);
      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
