import '../Entities/GoogleSignInUserEntity.dart';

abstract class GoogleSignInService{
  Future<GoogleSignInUserEntity> signInWithGoogle();
  Future<bool> isUserInDatabase({required String uid});
}