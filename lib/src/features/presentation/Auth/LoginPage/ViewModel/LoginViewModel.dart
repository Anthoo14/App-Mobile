import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Base/Constants/LocalStorageKeys.dart';
import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/UseCases/Auth/SignInUseCase/SignInUseCase.dart';
import 'package:delivery/src/Features/Domain/UseCases/Auth/SignInUseCase/SignInUseCaseParameters.dart';
import 'package:delivery/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery/src/Features/Domain/UseCases/LocalStorage/SaveLocalStorage/SaveLocalStorageUseCase.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/TextFormField/CustomTextFormFields.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';
import '../Model/LoginModel.dart';

// * Métodos y propiedades a exponer en la View
abstract class LoginViewModelInput {
  // Exposed properties
  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel? loginModel = LoginModel(email: '', password: '');
  // Exposed Methods
  Future<Result<bool, Failure>> login(
      {required String email, required String password});
  bool isFormValidate();
}

// * LoginViewModel
abstract class LoginViewModel extends LoginViewModelInput
    with TextFormFieldDelegate, BaseViewModel {}

class DefaultLoginViewModel extends LoginViewModel {
  // * Dependencies
  // * UseCases
  final SignInUseCase _signInUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  // * Constructor
  DefaultLoginViewModel(
      {SignInUseCase? signInUseCase,
      SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _signInUseCase = signInUseCase ?? DefaultSignInUseCase(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  // * Init State
  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  // User Actions
  @override
  Future<Result<bool, Failure>> login(
      {required String email, required String password}) {
    loadingStatusState.setLoadingState(isLoading: true);

    return _signInUseCase
        .execute(
            params: SignInUseCaseParameters(email: email, password: password))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          _saveLocalStorageUseCase.execute(
              saveLocalParameteres: SaveLocalStorageParameters(
                  key: LocalStorageKeys.idToken,
                  value: result.value?.localId ?? ""));
          loadingStatusState.setLoadingState(isLoading: false);
          return Result.success(true);
        case ResultStatus.error:
          loadingStatusState.setLoadingState(isLoading: false);
          return Result.failure(result.error);
      }
    });
  }

  // Utils
  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  onChanged(
      {required String newValue,
      required CustomTextFormFieldType customTextFormFieldType}) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        loginModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        loginModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
        // TODO: Handle this case.
        break;
      case CustomTextFormFieldType.phone:
        // TODO: Handle this case.
        break;
      case CustomTextFormFieldType.dateOfBirth:
        // TODO: Handle this case.
        break;
      default:
        break;
    }
  }
}
