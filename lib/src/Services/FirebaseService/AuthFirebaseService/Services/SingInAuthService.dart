import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Interfaces/AuthFirebase.dart';

import '../../../../Base/ApiService/appError.dart';

class DefaultSingInService extends SingInService{
  @override
  Future<Map<String, dynamic>> singIn({required Map<String, dynamic> bodyParameters}) {
    return apiService.getDataFromPostRequest(bodyparameters: bodyParameters, endpoint: endpoint);
  }

  @override
  Future<String> getIdToken({required Map<String, dynamic> bodyParameters})async {
    try {
      final userData = await singIn(bodyParameters: bodyParameters);
      return userData['idToken'] as String;
    } on Failure catch (f) {
      return Future.error(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }

  }

}