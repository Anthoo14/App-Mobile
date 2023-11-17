import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Interfaces/AuthFirebase.dart';

import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Decodables/SingUpDecodable.dart';
import 'package:flutter_vscode/src/features/data/Repositories/Auth/SingUpRepository/SingUpRepositoryParameters.dart';
import 'package:flutter_vscode/src/features/domain/Interfaces/Interfaces.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

import '../../../../../Services/FirebaseService/AuthFirebaseService/Services/SingUpAuthService.dart';

class DefaultSingUpRepository extends SingUpRepository{
//dependencies
  final SingUpService _singUpService;

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