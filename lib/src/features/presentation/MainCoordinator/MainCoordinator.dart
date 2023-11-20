import 'package:flutter_vscode/src/Base/Constants/LocalStorageKeys.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/LocalStorage/FetchLocalStorageUseCase.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/User/ValidateCurrentUserUseCase/ValidateCurrentUserUseCase.dart';

class RoutesPath{
  static String welcomePath = "Welcome";
  static String tabsPath = "Tabs";
}


class MainCoordinator {
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserUseCase _validateCurrentUserUseCase;

  MainCoordinator(
      {FetchLocalStorageUseCase? fetchLocalStorageUseCase,
      ValidateCurrentUserUseCase? validateCurrentUserUseCase})
      : _fetchLocalStorageUseCase =
            fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _validateCurrentUserUseCase =
            validateCurrentUserUseCase ?? DefaultValidateCurrentUserUseCase();

 Future<String?> start(){
    return _isUserLogged().then((value) {
      return value == null ? RoutesPath.welcomePath : RoutesPath.tabsPath;
    });
  }

  Future<String?>  _isUserLogged() async{
var idToken = await  _fetchLocalStorageUseCase.execute(parameters: FetchLocalStorageParameters(key: LocalStorageKeys.idToken));


//saved user?
if(idToken==null){
  return null;
}
// ok token and user in FB
  var isUserValid = await _validateCurrentUserUseCase.execute(idToken: idToken);

if(isUserValid){
  return idToken;
}else {
  return null;
}

}

}
