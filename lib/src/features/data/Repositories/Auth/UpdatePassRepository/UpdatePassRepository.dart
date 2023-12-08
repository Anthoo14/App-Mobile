

import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Decodables/UpdatePassDecodable.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Interfaces/AuthFirebase.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Services/UpdatePassUserService.dart';
import 'package:flutter_vscode/src/features/domain/Interfaces/Interfaces.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

class DefaultUpdatePassRepository extends UpdatePassRepository{

  //dependencies
  final UpdatePassUserService _updatePassUserService;


  DefaultUpdatePassRepository({UpdatePassUserService? updatePassUserService})
      :_updatePassUserService=updatePassUserService??DefaultUpdatePassUserService();

  @override
  Future<Result<UpdatePassDecodable, Failure>> updatePass({required String email}) async{
    try{
      final result = await _updatePassUserService.updatePass(email: email);
      UpdatePassDecodable _decodable = UpdatePassDecodable.fromMap(result);
      return Result.success(_decodable);
    }on Failure catch(f){
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
  
}