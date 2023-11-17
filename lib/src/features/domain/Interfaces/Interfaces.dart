
//Auth Repositories
import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/features/data/Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:flutter_vscode/src/features/data/Decodables/User/UserDecodable.dart';

import 'package:flutter_vscode/src/features/data/Repositories/Auth/SingUpRepository/SingUpRepositoryParameters.dart';
import 'package:flutter_vscode/src/features/data/Repositories/User/UserBodyParameters.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';


import '../../../Services/FirebaseService/AuthFirebaseService/Decodables/SingInDecodable.dart';
import '../../../Services/FirebaseService/AuthFirebaseService/Decodables/SingUpDecodable.dart';
import '../../../Services/FirebaseService/AuthFirebaseService/Decodables/UpdatePassDecodable.dart';
import '../../data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import '../../data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';

// Auth Repository

abstract class SignInRepository{
 Future<Result<SingInDecodable,Failure>>  SignIn({required SignInBodyParameters parameters});
}

abstract class SingUpRepository{
  Future<Result<SingUpDecodable, Failure>> singUp({required SingUpRepositoryParameters parameters});
}

abstract class UpdatePassRepository{
 Future<Result<UpdatePassDecodable,Failure>> updatePass({required String email});
}

abstract class UserAuthDataRepository{
 Future<Result<UserAuthDataDecodable,Failure>>  GetUserData({required GetUserAuthDataBodyParameters parameters});
}

//User Database Repository
abstract class SaveUserDataRepository{
  Future<Result<UserDecodable, Failure>> saveUserData({required UserBodyParameters parameters});

}

 abstract class FetchUserDataRepository{
  Future<Result<UserDecodable,Failure>> fetchUserData({required String localId});
 }

//local storage
abstract class SaveLocalStorageRepository{
 Future<void> saveInLocalStorage({required String key,required String value});
}

abstract class FetchLocalStorageRepository{
 Future<String?> fetchInLocalStorage({required String key});
}

abstract class RemoveLocalStorageRepository{
 Future<void> removeInLocalStorage({required String key});
}
