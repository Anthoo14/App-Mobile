import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Base/Constants/ErrorMessage.dart';
import 'package:flutter_vscode/src/features/data/Repositories/User/SaveUserDataRepository.dart';
import 'package:flutter_vscode/src/features/data/Repositories/User/UserBodyParameters.dart';
import 'package:flutter_vscode/src/features/domain/Entities/User/UserEntity.dart';
import 'package:flutter_vscode/src/features/domain/Interfaces/Interfaces.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';

import '../../../../../utils/Helpers/ResultType/ResultType.dart';

abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute(
      {required SaveUserDataUseCaseParameters parameters});
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {
  //Dependencies
  final SaveUserDataRepository _saveUserDataRepository;

  DefaultSaveUserDataUseCase({SaveUserDataRepository? saveUserDataRepository})
      : _saveUserDataRepository =
            saveUserDataRepository ?? DefaultSaveUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute(
      {required SaveUserDataUseCaseParameters parameters}) {
    UserBodyParameters _parameters = UserBodyParameters(
        localId: parameters.localId,
        role: parameters.role?.toShortString(),
        username: parameters.username,
        email: parameters.email,
        phone: parameters.phone,
        dateOfBirth: parameters.dateOfBirth,
        startDate: parameters.startDate,
        photo: parameters.photo,
        shippingAddress: parameters.shippingAddress,
        billingAddress: parameters.billingAddress,
        idToken: parameters.idToken);

    return _saveUserDataRepository
        .saveUserData(parameters: _parameters)
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: AppFailureMessage.unExpectedErrrorMessage));
          }
          var _entity = UserEntity.fromMap(result.value!.toMap());
          return Result.success(_entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
