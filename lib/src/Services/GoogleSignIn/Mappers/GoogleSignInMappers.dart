import 'package:delivery/src/Services/GoogleSignIn/Entities/GoogleUserEntity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignInMapper {
  static GoogleSignInUserEntity mapUserCredential(UserCredential credential, String? idToken) {
     return GoogleSignInUserEntity(credential.user, idToken);
  }
}