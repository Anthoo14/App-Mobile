import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/interfaceAuth/AuthFirebase.dart';

class DefaultSingUpService extends SingUpService{
  @override
  Future<Map<String, dynamic>> singUp({required Map<String, dynamic> bodyParameters}) {
   return apiService.getDataFromPostRequest(bodyparameters: bodyParameters, endpoint: endpoint);
  }
 

}