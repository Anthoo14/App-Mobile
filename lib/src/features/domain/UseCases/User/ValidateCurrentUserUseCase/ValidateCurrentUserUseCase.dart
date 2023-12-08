

import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../Auth/UserAuthData/GetUserDataUseCase.dart';
import '../../Auth/UserAuthData/GetUserDataUseCaseParameters.dart';

abstract class ValidateCurrentUserCase {
  Future<bool> execute({required String idToken});
}

class DefaultValidateCurrentUserCase extends ValidateCurrentUserCase {
  
  // * Dependencies
  final GetUserAuthDataUseCase _getUserAuthDataUseCase;

  DefaultValidateCurrentUserCase({ GetUserAuthDataUseCase? getUserAuthDataUseCase })
          : _getUserAuthDataUseCase =
            getUserAuthDataUseCase ?? DefaultGetUserAuthDataUseCase();

  @override
  Future<bool> execute({required String idToken}) async {
    try {
      return _getUserAuthDataUseCase
                    .execute(params: GetUserDataUseCaseParameters(idToken: idToken))
                    .then((result) {
                          switch (result.status) {
                            case ResultStatus.success:
                              return true;
                            case ResultStatus.error:
                              return false;
                          }
                    });
    } on Failure {
      return false;
    }
  }
}
