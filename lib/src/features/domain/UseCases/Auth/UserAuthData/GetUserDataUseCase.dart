import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Base/Constants/ErrorMessages.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../../../Data/Repositories/Auth/UserData/GetUserDataRepository.dart';
import '../../../../Data/Repositories/Auth/UserData/GetUserDataRepositoryParameters.dart';
import '../../../Entities/Auth/UserAuthData/UserAuthDataEntity.dart';
import 'GetUserDataUseCaseParameters.dart';

abstract class GetUserAuthDataUseCase {
  Future<Result<UserAuthDataEntity, Failure>> execute({ required GetUserDataUseCaseParameters params });
}

class DefaultGetUserAuthDataUseCase extends GetUserAuthDataUseCase {
  
  // * Dependencies
  final GetAuthUserDataRepository _getAuthUserDataRepository;

  DefaultGetUserAuthDataUseCase(
      { GetAuthUserDataRepository? getAuthUserDataRepository })
      : _getAuthUserDataRepository = getAuthUserDataRepository ?? DefaultGetAuthUserDataRepository();

  @override
  Future<Result<UserAuthDataEntity, Failure>> execute(
      {required GetUserDataUseCaseParameters params}) {
    return _getAuthUserDataRepository
        .getUserData(params: GetUserDataBodyParameters(idToken: params.idToken))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserAuthDataEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
