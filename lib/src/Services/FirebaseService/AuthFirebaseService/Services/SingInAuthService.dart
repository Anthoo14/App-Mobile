import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Interfaces/AuthFirebase.dart';

class DefaultSingInService extends SingInService{
  @override
  Future<Map<String, dynamic>> singIn({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyparameters: bodyParameters, endpoint: endpoint);
  }


}