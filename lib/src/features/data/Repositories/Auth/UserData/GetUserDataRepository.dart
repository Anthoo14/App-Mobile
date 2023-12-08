import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Interfaces/Interfaces.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Services/GetUserDataAuthService.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../../Decodables/Auth/UserAuthDataDecodable.dart';
import 'GetUserDataRepositoryParameters.dart';

abstract class GetAuthUserDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserData({ required GetUserDataBodyParameters params });
}

class DefaultGetAuthUserDataRepository extends GetAuthUserDataRepository {

  // * Dependencies
  final GetUserDataService _getUserDataService;

  DefaultGetAuthUserDataRepository({GetUserDataService? userDataService})
      : _getUserDataService = userDataService ?? DefaultGetUserDataService();

  @override
  Future<Result<UserAuthDataDecodable, Failure>> getUserData({ required GetUserDataBodyParameters params }) async {
    try {
      final result = await _getUserDataService.getUserData(bodyParameters: params.toMap());
      return Result.success(UserAuthDataDecodable.fromMap(result));
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
