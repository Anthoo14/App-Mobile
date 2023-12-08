import 'package:delivery/src/Utils/Helpers/DefaultImages/DefaultUserPhotoHelper.dart';
import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Base/Constants/ErrorMessages.dart';
import '../../../../../Utils/Helpers/Date/DateHelpers.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../../../Data/Repositories/Auth/SignUp/SignUpBodyParameters.dart';
import '../../../../Data/Repositories/Auth/SignUp/SignUpRepository.dart';
import '../../../Entities/Auth/SignUp/SignUpEntity.dart';
import '../../../Entities/User/UserEntity.dart';
import '../../User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import '../../User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'SignUpUseCaseParameters.dart';

abstract class SignUpUseCase {
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUseCaseParameters params});
}

class DefaultSignUpUseCase extends SignUpUseCase {

  // * Dependencies
  final SignUpRepository _signUpRepository;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultSignUpUseCase({ SignUpRepository? signUpRepository,
                         SaveUserDataUseCase? saveUserDataUseCase})
      : _signUpRepository = signUpRepository ?? DefaultSignUpRepository(),
        _saveUserDataUseCase =
            saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUseCaseParameters params}) {
    return _signUpRepository
        .signUp(params: SignUpBodyParameters(email: params.email,
                                             password: params.password))
        .then((result) {
                switch (result.status) {
                      case ResultStatus.success:
                        // Null Check
                        if (result.value == null) {
                          return Result.failure(
                              Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
                        }
                        return saveUserDataInDataBase(params: params, entity: SignUpEntity.fromMap(result.value!.toMap()));
                      case ResultStatus.error:
                        return Result.failure(result.error);
                }
    });
  }
}

extension on DefaultSignUpUseCase {
  Future<Result<SignUpEntity, Failure>> saveUserDataInDataBase({required SignUpUseCaseParameters params,
                                                                required SignUpEntity entity }) {
    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
        localId: entity.localId,
        role: UserRole.user,
        username: params.username,
        email: entity.email,
        phone: params.phone,
        dateOfBirth: params.date,
        startDate: DateHelpers.getStartDate(),
        photo: DefaultUserPhotoHelper.defaultUserPhoto,
        shippingAddress: '',
        billingAddress: '',
        idToken: entity.idToken,
        provider: UserAuthProvider.emailAndPassword
    );

    return _saveUserDataUseCase.execute(params: _params).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
