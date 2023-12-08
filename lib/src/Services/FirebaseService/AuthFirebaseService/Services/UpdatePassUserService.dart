import 'package:flutter_vscode/src/Base/ApiService/apiService.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/BodyParameters/UpdatePassUserServiceBodyParameters.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Interfaces/AuthFirebase.dart';

class DefaultUpdatePassUserService extends UpdatePassUserService {

  final String _requestType = "PASSWORD_RESET";

  @override
  Future<Map<String,dynamic>> updatePass({ required String email }){
    final _parameters = UpdatePassBodyParameters(requestType: _requestType, email: email);
    return apiService.getDataFromPostRequest(bodyparameters: _parameters.toMap(), endpoint: endpoint);
  }


}