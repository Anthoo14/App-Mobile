import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/interfaceAuth/AuthFirebase.dart';

import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/interfaceAuth/Decodables/SingUpDecodable.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/interfaceAuth/SingUpAuthService.dart';
import 'package:flutter_vscode/src/features/data/Repositories/Auth/SingUpRepository/SingUpRepositoryParameters.dart';
import 'package:flutter_vscode/src/features/domain/Interfaces/Interfaces.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

class DefaultSingUpRepository extends SingUpRepository{
//dependencies
  SingUpService _singUpService;

  DefaultSingUpRepository({SingUpService ?  singUpService}):_singUpService = singUpService ?? DefaultSingUpService();

  @override
  Future<Result<SingUpDecodable, Failure>> singUp({required SingUpRepositoryParameters parameters})async {
    try{
      final result = await _singUpService.singUp(bodyParameters: parameters.toMap());
      SingUpDecodable decodable = SingUpDecodable.fromMap(result);
      return Result.success(decodable);
    }on Failure catch(f){
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }

  
}