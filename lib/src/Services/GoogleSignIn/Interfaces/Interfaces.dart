import 'package:delivery/src/Services/GoogleSignIn/Entities/GoogleUserEntity.dart';

abstract class GoogleSignInService {
   Future<GoogleSignInUserEntity> signInWithGoogle();
   Future<bool> isUserInDatabase({ required String uid });
}