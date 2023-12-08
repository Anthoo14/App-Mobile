import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import '../../../../Domain/UseCases/Auth/SignOutUseCase/SignOutUseCase.dart';


abstract class ProfileTabViewModelInput {
  late LoadingStateProvider loadingStatusState;
  Future<void> signOut();
  void initState({ required LoadingStateProvider loadingState });
}

// Crear ViewModel
abstract class ProfileTabViewModel extends ProfileTabViewModelInput {}

class DefaultProfileTabViewModel extends ProfileTabViewModel {
  
  // UseCases
  final SignOutUseCase _signOutUseCase;

  DefaultProfileTabViewModel({ SignOutUseCase? signOutUseCase })
      : _signOutUseCase = signOutUseCase ?? DefaultSignOutUseCase();

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<void> signOut() async {
    loadingStatusState.setLoadingState(isLoading: true);

    return _signOutUseCase.execute().then((_) {
      loadingStatusState.setLoadingState(isLoading: false);
    });
  }
}
