import 'package:delivery/src/Services/FirebaseServices/FirebaseRealTimeDatabaseService/Services/RealtimeDataBaseService.dart';
import 'package:delivery/src/Services/GoogleSignIn/Entities/GoogleUserEntity.dart';
import 'package:delivery/src/Services/GoogleSignIn/Interfaces/Interfaces.dart';
import 'package:delivery/src/Services/GoogleSignIn/Mappers/GoogleSignInMappers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../Base/AppError/AppError.dart';
import '../../FirebaseServices/FirebaseRealTimeDatabaseService/Interfaces/Interfaces.dart';


class DefaultGoogleSignInService extends GoogleSignInService {
  final RealtimeDataBaseService _realtimeDataBaseService;
  String _path = "users/";

  // Dependencies
  DefaultGoogleSignInService({ RealtimeDataBaseService? realtimeDataBaseService })
           : _realtimeDataBaseService = realtimeDataBaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<GoogleSignInUserEntity> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    return GoogleSignInMapper.mapUserCredential(userCredential,await
                                                userCredential.user?.getIdToken()??"");
  }

  @override
  Future<bool> isUserInDatabase({ required String uid }) async {
    final fullpath = _path + uid;
    try {
      final result = await _realtimeDataBaseService.getData(path: fullpath);
      return result.isNotEmpty;
    } on Failure catch (f) {
      return false;
    }
  }
}