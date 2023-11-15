import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Base/Constants/ErrorMessage.dart';
import 'package:flutter_vscode/src/features/data/Repositories/Auth/SingUpRepository/SingUpRepository.dart';
import 'package:flutter_vscode/src/features/data/Repositories/Auth/SingUpRepository/SingUpRepositoryParameters.dart';
import 'package:flutter_vscode/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:flutter_vscode/src/features/domain/Entities/User/UserEntity.dart';
import 'package:flutter_vscode/src/features/domain/Interfaces/Interfaces.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:flutter_vscode/src/utils/Helpers/Dates/DateHelpers.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

import '../../../../../utils/Helpers/UserPhoto/UserPhotoHelper.dart';
import '../../User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import '../../User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Failure>> execute(
      {required SignUpUseCaseParameters parameters});
}

class DefaultSignUpUseCase extends SignUpUseCase {

  //Dependencies
 final SingUpRepository _singUpRepository;
 final   SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCase({SingUpRepository? singUpRepository, SaveUserDataUseCase? saveUserDataUseCase})
      : _singUpRepository = singUpRepository ?? DefaultSingUpRepository(),
      _saveUserDataUseCase=saveUserDataUseCase ?? DefaultSaveUserDataUseCase();


  @override
  Future<Result<SignUpEntity, Failure>> execute(
      {required SignUpUseCaseParameters parameters}) {
    return _singUpRepository
        .singUp(
            parameters: SingUpRepositoryParameters(
                email: parameters.email, password: parameters.password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          //NullCheck
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessage.unExpectedErrrorMessage));
          }
          //SAVED NEW USER
          return saveUserDataInDatabase(parameters:parameters, entity: SignUpEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}


extension on DefaultSignUpUseCase{
  Future<Result<SignUpEntity, Failure>> saveUserDataInDatabase({required SignUpUseCaseParameters parameters,required SignUpEntity entity})  {

    SaveUserDataUseCaseParameters _parameters = SaveUserDataUseCaseParameters(
        localId:entity.localId,
        role:UserRole.user,
        username:parameters.username,
        email:parameters.email,
        phone:parameters.phone,
        dateOfBirth:parameters.date,
        startDate:DateHelpers.getStartDate(),
        photo:UserPhotoHelper.defaultUserPhoto,
        shippingAddress:'',
        billingAddress:'',
        idToken: entity.idToken
    );
    return _saveUserDataUseCase.execute(parameters: _parameters).then((result) {
      switch(result.status){
        case ResultStatus.success:
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
  }
