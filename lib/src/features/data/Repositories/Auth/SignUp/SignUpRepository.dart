import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Decodables/SignUpDecodable.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Interfaces/Interfaces.dart';
import '../../../../../Services/FirebaseServices/FirebaseAuthService/Services/SignUpAuthService.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import 'SignUpBodyParameters.dart';

abstract class SignUpRepository {
  Future<Result<SignUpDecodable, Failure>> signUp({ required SignUpBodyParameters params });
}

class DefaultSignUpRepository extends SignUpRepository {

  // * Dependencies
  final SignUpService _signUpService;

  DefaultSignUpRepository({ SignUpService? signUpService }) : _signUpService = signUpService ?? DefaultSignUpService();

  @override
  Future<Result<SignUpDecodable, Failure>> signUp({ required SignUpBodyParameters params }) async {
    try {
      final result = await _signUpService.signUp(bodyParameters: params.toMap());
      SignUpDecodable decodable = SignUpDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (f) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
