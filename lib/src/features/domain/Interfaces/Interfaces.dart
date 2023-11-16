
//Auth Repositories
import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/features/data/Decodables/User/UserDecodable.dart';

import 'package:flutter_vscode/src/features/data/Repositories/Auth/SingUpRepository/SingUpRepositoryParameters.dart';
import 'package:flutter_vscode/src/features/data/Repositories/User/UserBodyParameters.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

import '../../../Services/FirebaseService/AuthFirebaseService/interfaceAuth/Decodables/SingInDecodable.dart';
import '../../../Services/FirebaseService/AuthFirebaseService/interfaceAuth/Decodables/SingUpDecodable.dart';
import '../../data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';

// Auth Repository

abstract class SignInRepository{
 Future<Result<SingInDecodable,Failure>>  SignIn({required SignInBodyParameters parameters});
}

abstract class SingUpRepository{
  Future<Result<SingUpDecodable, Failure>> singUp({required SingUpRepositoryParameters parameters});
}

//User Database Repository
abstract class SaveUserDataRepository{
  Future<Result<UserDecodable, Failure>> saveUserData({required UserBodyParameters parameters});

}