import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Base/Constants/ErrorMessage.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/RealtimeDatabase/Interfaces/interfaces.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/RealtimeDatabase/Service/RealtimeDatabaseService.dart';
import 'package:flutter_vscode/src/features/data/Decodables/User/UserDecodable.dart';
import 'package:flutter_vscode/src/features/data/Repositories/User/UserBodyParameters.dart';
import 'package:flutter_vscode/src/features/domain/Interfaces/Interfaces.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

abstract class _Paths {
  static String userCollection = "users/";
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository {
  //Dependencies
 final RealtimeDatabaseService _realtimeDatabaseService;

  DefaultSaveUserDataRepository(
      {RealtimeDatabaseService? realtimeDatabaseService})
      : _realtimeDatabaseService =
            realtimeDatabaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> saveUserData(
      {required UserBodyParameters parameters}) async {
    if (parameters.localId == null) {
      return Result.failure(Failure.fromMessage(
          message: AppFailureMessage.unExpectedErrrorMessage));
    }
    // Created Path
    var path = _Paths.userCollection + parameters.localId!;

    try {
      final result = await _realtimeDatabaseService.putData(
          bodyparameters: parameters.toMap(), path: path);
      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(f);
    }
  }
}
