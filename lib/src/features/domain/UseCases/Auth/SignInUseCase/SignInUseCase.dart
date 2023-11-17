

import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Base/Constants/ErrorMessage.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Interfaces/AuthFirebase.dart';
import 'package:flutter_vscode/src/features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:flutter_vscode/src/features/data/Repositories/Auth/SignInRepository/SignInRepository.dart';
import 'package:flutter_vscode/src/features/domain/Entities/Auth/SignInEntity/SignInEntity.dart';
import 'package:flutter_vscode/src/features/domain/Interfaces/Interfaces.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/Auth/SignInUseCase/SignInUseCaseParameters.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

abstract class SignInUseCase{
  Future<Result<SignInEntity,Failure>> execute({ required SignInUseCaseBodyParameters parameters});
}
class DefaultSignInUseCase extends SignInUseCase{

  //Dependencie
  final SignInRepository _signInRepository;
  DefaultSignInUseCase({ SignInRepository? signInRepository})
      : _signInRepository = signInRepository ?? DefaultSignInRepository();


  @override
  Future<Result<SignInEntity, Failure>> execute({required SignInUseCaseBodyParameters parameters}) {
 return _signInRepository.SignIn(parameters: SignInBodyParameters(email: parameters.email, password: parameters.password)).then((result) {
   switch(result.status){
     case ResultStatus.success:
      if (result.value == null){
        return Result.failure(Failure.fromMessage(message: AppFailureMessage.unExpectedErrrorMessage));
      }
      return Result.success(SignInEntity.fromMap(result.value!.toMap()));
     case ResultStatus.error:
     return Result.failure(result.error);
   }


 });
  }

}