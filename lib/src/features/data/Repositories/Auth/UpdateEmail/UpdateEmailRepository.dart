import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Interfaces/Interfaces.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Services/UpdateEmailAuthUserService.dart';

abstract class UpdateEmailRepository {
  Future<dynamic> updateEmail({ required String oldEmail, required String newEmail, required String password });
}

class DefaultUpdateEmailRepository extends UpdateEmailRepository {

  // * Dependencies
  final UpdateEmailUserService _updateEmailUserService;

  DefaultUpdateEmailRepository({ UpdateEmailUserService? updateEmailUserService })
       : _updateEmailUserService = updateEmailUserService ?? DefaultUpdateEmailUserService();

  @override
  Future<dynamic> updateEmail({ required String oldEmail,
                                required String newEmail,
                                required String password }) async {
    try {
      final result = await _updateEmailUserService.updateEmail(password: password,
                                                               oldEmail: oldEmail,
                                                               newEmail: newEmail);
      return result;
    } on Failure catch (f) {
      return Future.error(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}