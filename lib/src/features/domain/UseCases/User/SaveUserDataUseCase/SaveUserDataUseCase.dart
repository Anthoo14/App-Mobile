import 'package:delivery/src/Features/Domain/Entities/User/UserEntity.dart';
import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Base/Constants/ErrorMessages.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../../../Data/Repositories/User/SaveUserDataRepository.dart';
import '../../../../Data/Repositories/User/UserBodyParameters.dart';
import 'SaveUserDataUseCaseParameters.dart';

abstract class SaveUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute({ required SaveUserDataUseCaseParameters params });
}

class DefaultSaveUserDataUseCase extends SaveUserDataUseCase {

  // * Dependencies
  final SaveUserDataRepository _saveUserDataRepository;
    
  DefaultSaveUserDataUseCase({ SaveUserDataRepository? saveUserDataRepository }) 
               : _saveUserDataRepository = saveUserDataRepository ?? DefaultSaveUserDataRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({ required SaveUserDataUseCaseParameters params }) {

    UserBodyParameters _parameters = UserBodyParameters(
        localId: params.localId,
        role: params.role?.toShortString(),
        username: params.username,
        email: params.email,
        phone: params.phone,
        dateOfBirth: params.dateOfBirth,
        startDate: params.startDate,
        photo: params.photo,
        shippingAddress: params.shippingAddress,
        billingAddress: params.billingAddress,
        idToken: params.idToken,
        provider: params.provider
    );

    return _saveUserDataRepository.saveUserData(params: _parameters)
        .then((result) {
              switch (result.status) {
                case ResultStatus.success:
                  if(result.value == null) {
                    return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
                  }
                  return Result.success(UserEntity.fromMap(result.value!.toMap()));
                case ResultStatus.error:
                  return Result.failure(result.error);
              }
        });
  }
}
