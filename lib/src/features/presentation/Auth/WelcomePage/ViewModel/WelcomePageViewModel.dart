import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/User/UserEntity.dart';
import 'package:delivery/src/Features/Domain/UseCases/Auth/GoogleSignInUseCase/GoogleSignInUseCase.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';

abstract class WelcomePageViewModelInput {
  Future<Result<UserEntity,Failure>> signInWithGoogle();
}

abstract class WelcomePageViewModel extends WelcomePageViewModelInput with BaseViewModel {}

class DefaultWelcomePageViewModel extends WelcomePageViewModel {

  // Dependencias
  final GoogleSignInUseCase _googleSignInUseCase;

  DefaultWelcomePageViewModel({
    GoogleSignInUseCase? googleSignInUseCase
  }) : _googleSignInUseCase = googleSignInUseCase ?? DefaultGoogleSignInUseCase();

  @override
  Future<Result<UserEntity,Failure>> signInWithGoogle() {
    return _googleSignInUseCase.execute();
  }

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }
}