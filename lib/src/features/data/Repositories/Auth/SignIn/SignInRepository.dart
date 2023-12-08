import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Decodables/SignInDecodable.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Interfaces/Interfaces.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Services/SignInAuthService.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import 'SignInBodyParameters.dart';

abstract class SignInRepository {
  Future<Result<SignInDecodable, Failure>> signIn({required SignInBodyParameters params});
}

class DefaultSignInRepository extends SignInRepository {

  // * Dependencies
  final SignInService _signInService;

  DefaultSignInRepository({ SignInService? signInService }) : _signInService = signInService ?? DefaultSignInService();

  @override
  Future<Result<SignInDecodable, Failure>> signIn({ required SignInBodyParameters params }) async {
    try {
      final result = await _signInService.signIn(bodyParameters: params.toMap());
      return Result.success(SignInDecodable.fromMap(result));
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
