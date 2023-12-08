import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Base/Constants/ErrorMessages.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../../../Data/Repositories/Auth/SignIn/SignInBodyParameters.dart';
import '../../../../Data/Repositories/Auth/SignIn/SignInRepository.dart';
import '../../../Entities/Auth/SignIn/SignInEntity.dart';
import 'SignInUseCaseParameters.dart';

abstract class SignInUseCase {
  Future<Result<SignInEntity, Failure>> execute({ required SignInUseCaseParameters params });
}

class DefaultSignInUseCase extends SignInUseCase {
   
  // * Dependencies
  final SignInRepository _signInRepository;

  DefaultSignInUseCase({ SignInRepository? signInRepository }) : _signInRepository = signInRepository ?? DefaultSignInRepository();

  @override
  Future<Result<SignInEntity, Failure>> execute({ required SignInUseCaseParameters params }) {
    return _signInRepository
        .signIn(params: SignInBodyParameters(email: params.email, password: params.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          // Null Check
          if (result.value == null) {
            return Result.failure(
                Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(SignInEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
