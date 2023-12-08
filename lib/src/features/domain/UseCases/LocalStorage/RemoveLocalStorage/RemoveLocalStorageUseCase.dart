import '../../../../Data/Repositories/LocalStorage/RemoveLocalStorageRepository.dart';
import '../FetchLocalStorage/LocalStorageUseCaseParameters.dart';

abstract class RemoveLocalStorageUseCase {
  Future<void> execute({required RemoveLocalStorageParameters params});
}

class DefaultRemoveLocalStorageUseCase extends RemoveLocalStorageUseCase {

  // * Dependencies
  final RemoveLocalStorageRepository _defaultRemoveLocalStorageRepository;

  DefaultRemoveLocalStorageUseCase({ RemoveLocalStorageRepository? defaultRemoveLocalStorageRepository }) : _defaultRemoveLocalStorageRepository = defaultRemoveLocalStorageRepository ?? DefaultRemoveLocalStorageRepository();

  @override
  Future<void> execute({required RemoveLocalStorageParameters params}) {
    return _defaultRemoveLocalStorageRepository.removeInLocalStorage(
        key: params.key);
  }
}
