
import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Interfaces/AuthFirebase.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Services/GetUserAuthDataService.dart';
import 'package:flutter_vscode/src/features/data/Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:flutter_vscode/src/features/data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';
import '../../../../domain/Interfaces/Interfaces.dart';
class DefaultUserAuthDataRepository extends UserAuthDataRepository{


  //Dependencies
  final GetUserAuthDataService _getUserAuthDataService;

  DefaultUserAuthDataRepository({GetUserAuthDataService? getUserAuthDataService})
            :_getUserAuthDataService = getUserAuthDataService ?? DefaultGetUserAuthDataService();
  


  @override
  Future<Result<UserAuthDataDecodable, Failure>> GetUserData({required GetUserAuthDataBodyParameters parameters}) async{
    try{
      final result = await _getUserAuthDataService.getUserAuthData(bodyParameters: parameters.toMap());
      UserAuthDataDecodable _decodable = UserAuthDataDecodable.fromMap(result);
      return Result.success(_decodable);
    }on Failure catch
    (f){
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }    
        
  }
  
}