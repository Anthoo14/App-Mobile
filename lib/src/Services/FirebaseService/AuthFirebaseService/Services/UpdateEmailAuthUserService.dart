
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Services/SingInAuthService.dart';
import '../../../../Base/ApiService/appError.dart';

import '../Interfaces/AuthFirebase.dart';


class DefaultUpdateEmailUserService extends UpdateEmailUserService {

  // * Dependencies
  final SingInService _signInService;

  DefaultUpdateEmailUserService({ SingInService? singInService })
      : _signInService = singInService ?? DefaultSingInService();

  @override
  Future<Map<String, dynamic>> updateEmail({ required String oldEmail,
    required String newEmail,
    required String password }) async {
    try {
      final Map<String, dynamic> signInBodyParameters = {
        'email': oldEmail,
        'password': password,
        'returnSecureToken': true,
      };

      final idToken = await _signInService.getIdToken(bodyParameters: signInBodyParameters);

      final Map<String, dynamic> bodyParameters = {
        'email': newEmail,
        'idToken': idToken,
        'returnSecureToken': true,
      };

      return apiService.getDataFromPostRequest(bodyparameters: bodyParameters, endpoint: endpoint);
    } on Failure catch (f) {
      return Future.error(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }


}