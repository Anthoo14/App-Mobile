import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Decodables/UpdatePasswordDecodable.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Interfaces/Interfaces.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Services/UpdatePasswordAuthUserService.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';

abstract class UpdatePasswordRepository {
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({ required String email });
}

class DefaultUpdatePasswordRepository extends UpdatePasswordRepository {
  
  // * Dependencies
  final UpdatePasswordUserService _updatePasswordUserService;

  DefaultUpdatePasswordRepository(
      {UpdatePasswordUserService? updatePasswordUserService})
      : _updatePasswordUserService =
            updatePasswordUserService ?? DefaultUpdatePasswordUserService();

  @override
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({ required String email }) async {
    try {
      final result = await _updatePasswordUserService.updatePassword(email: email);
      UpdatePasswordDecodable decodable = UpdatePasswordDecodable.fromMap(result);
      return Result.success(decodable);

    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
