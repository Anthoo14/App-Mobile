import '../../../../../Base/Constants/LocalStorageKeys.dart';
import '../../LocalStorage/FetchLocalStorage/LocalStorageUseCaseParameters.dart';
import '../../LocalStorage/RemoveLocalStorage/RemoveLocalStorageUseCase.dart';

abstract class SignOutUseCase {
  Future<void> execute();
}

class DefaultSignOutUseCase extends SignOutUseCase {

  // * Dependencies
  final RemoveLocalStorageUseCase _removeLocalStorageUseCase;

  DefaultSignOutUseCase({ RemoveLocalStorageUseCase? removeLocalStorageUseCase })
      : _removeLocalStorageUseCase =
            removeLocalStorageUseCase ?? DefaultRemoveLocalStorageUseCase();

  @override
  Future<void> execute() async {
    return _removeLocalStorageUseCase.execute(params: RemoveLocalStorageParameters(key: LocalStorageKeys.idToken));
  }
}
