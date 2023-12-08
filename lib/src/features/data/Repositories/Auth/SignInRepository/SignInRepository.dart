import 'package:flutter_vscode/src/Base/ApiService/appError.dart';


import 'package:flutter_vscode/src/features/data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import 'package:flutter_vscode/src/features/domain/Interfaces/Interfaces.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

import '../../../../../Services/FirebaseService/AuthFirebaseService/Decodables/SingInDecodable.dart';
import '../../../../../Services/FirebaseService/AuthFirebaseService/Interfaces/AuthFirebase.dart';
import '../../../../../Services/FirebaseService/AuthFirebaseService/Services/SingInAuthService.dart';

class DefaultSignInRepository extends SignInRepository {
  //dependecies
  final SingInService _singInService;
  DefaultSignInRepository({SingInService? singInService})
      : _singInService = singInService ?? DefaultSingInService();


  @override
  Future<Result<SingInDecodable, Failure>> signIn({required SignInBodyParameters params}) async{

    try{
      final result = await _singInService.singIn(bodyParameters: params.toMap());
      SingInDecodable decodable = SingInDecodable.fromMap(result);
      return Result.success(decodable);

    }on Failure catch(f){
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
  }
}
  }