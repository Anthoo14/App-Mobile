import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Base/Constants/ErrorMessages.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../../../Data/Repositories/User/FetchUserDataRepository.dart';
import '../../../Entities/User/UserEntity.dart';

abstract class FetchUserDataUseCase {
  Future<UserEntity> execute({required String localId});
}

class DefaultFetchUserDataUseCase extends FetchUserDataUseCase {

  // Dependencies
  final FetchUserDataRepository _fetchUserDataRepository;

  DefaultFetchUserDataUseCase({ FetchUserDataRepository? fetchUserDataRepository })
      : _fetchUserDataRepository = fetchUserDataRepository ?? DefaultFetchUserDataRepository();

  @override
  Future<UserEntity> execute({ required String localId }) {
    return _fetchUserDataRepository
        .fetchUserData(localId: localId)
        .then((result) {
              switch (result.status) {
                case ResultStatus.success:
                  if(result.value == null) {
                    return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
                  }
                  return UserEntity.fromMap(result.value!.toMap());
                case ResultStatus.error:
                  return Future.error(Failure.fromMessage(message: AppFailureMessages.unExpectedErrorMessage));
              }
    });
  }
}
