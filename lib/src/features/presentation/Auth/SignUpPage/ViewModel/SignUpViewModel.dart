import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Base/Constants/LocalStorageKeys.dart';
import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/UseCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:delivery/src/Features/Domain/UseCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:delivery/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery/src/Features/Domain/UseCases/LocalStorage/SaveLocalStorage/SaveLocalStorageUseCase.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/TextFormField/CustomTextFormFields.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';
import '../Model/SignUpModel.dart';

abstract class SignUpViewModelInput {
  // Exposed Properties
  SignUpModel? signUpModel = SignUpModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController;
  late DateTime selectedDate;
  // Exposed Methods
  Future<Result<bool, Failure>> signUp();
  bool isFormValidate();
}

abstract class SignUpViewModel extends SignUpViewModelInput with TextFormFieldDelegate, BaseViewModel {}

class DefaultSignUpViewModel extends SignUpViewModel {
  // UseCases
  final SignUpUseCase _signUpUseCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  DefaultSignUpViewModel({ SignUpUseCase? signUpUseCase,
                           SaveLocalStorageUseCase? saveLocalStorageUseCase })
            : _signUpUseCase = signUpUseCase ?? DefaultSignUpUseCase(),
              _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  // Init
  @override
  void initState({ required LoadingStateProvider loadingState }) {
    loadingStatusState = loadingState;
    dateController = TextEditingController();
    selectedDate = DateTime.now();
  }

  // User Actions
  @override
  Future<Result<bool, Failure>> signUp() async {

    loadingStatusState.setLoadingState(isLoading: true);

    return _signUpUseCase
        .execute(params: SignUpUseCaseParameters(
                email: signUpModel?.email ?? "",
                password: signUpModel?.password ?? "",
                username: signUpModel?.username ?? "",
                phone: signUpModel?.phone ?? "",
                date: signUpModel?.date ?? ""))
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
  onChanged({ required String newValue,
              required CustomTextFormFieldType customTextFormFieldType }) {
    switch (customTextFormFieldType) {
      case CustomTextFormFieldType.email:
        signUpModel?.email = newValue;
        break;
      case CustomTextFormFieldType.password:
        signUpModel?.password = newValue;
        break;
      case CustomTextFormFieldType.username:
        signUpModel?.username = newValue;
        break;
      case CustomTextFormFieldType.phone:
        signUpModel?.phone = newValue;
        break;
      case CustomTextFormFieldType.dateOfBirth:
        signUpModel?.date = newValue;
        break;
      default:
        break;
    }
  }
}

