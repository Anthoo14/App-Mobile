import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Base/Constants/ErrorMessage.dart';
import 'package:flutter_vscode/src/features/data/Repositories/Auth/SingUpRepository/SingUpRepository.dart';
import 'package:flutter_vscode/src/features/data/Repositories/Auth/SingUpRepository/SingUpRepositoryParameters.dart';
import 'package:flutter_vscode/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:flutter_vscode/src/features/domain/Interfaces/Interfaces.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Failure>> execute(
      {required SignUpUseCaseParameters parameters});
}

class DefaultSignUpUseCase extends SignUpUseCase {
  SingUpRepository _singUpRepository;

  DefaultSignUpUseCase({SingUpRepository? singUpRepository})
      : _singUpRepository = singUpRepository ?? DefaultSingUpRepository();

  @override
  Future<Result<SignUpEntity, Failure>> execute(
      {required SignUpUseCaseParameters parameters}) {
    return _singUpRepository
        .singUp(
            parameters: SingUpRepositoryParameters(
                email: parameters.email, password: parameters.password))
        .then((result)  {switch (result.status) {
          case ResultStatus.success:
           //NullCheck
            if(result.value==null){
              return Result.failure(Failure.fromMessage(message: AppFailureMessage.unExpectedErrrorMessage));
            }
            SignUpEntity  entity= SignUpEntity.fromMap(result.value!.toMap());

            //SAVED NEW USER
            return Result.success(entity);
      case ResultStatus.error:
        return Result.failure(result.error);
    }});
  }
}
