import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/interfaceAuth/Decodables/SingInDecodable.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/interfaceAuth/SingInAuthService.dart';
import 'package:flutter_vscode/src/features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:flutter_vscode/src/features/domain/Interfaces/Interfaces.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

import '../../../../../Services/FirebaseService/AuthFirebaseService/interfaceAuth/AuthFirebase.dart';

class DefaultSignInRepository extends SignInRepository {
  //dependecies
  final SingInService _singInService;
  DefaultSignInRepository({SingInService? singInService})
      : _singInService = singInService ?? DefaultSingInService();

  @override
  Future<Result<SingInDecodable, Failure>> SignIn(
      {required SignInBodyParameters parameters})async {
    try{
    final result = await _singInService.singIn(bodyParameters: parameters.toMap());
    SingInDecodable decodable = SingInDecodable.fromMap(result);
    return Result.success(decodable);

    }on Failure catch(f){
return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
