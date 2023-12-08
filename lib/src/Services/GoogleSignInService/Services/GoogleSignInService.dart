 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/RealtimeDatabase/Interfaces/interfaces.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/RealtimeDatabase/Service/RealtimeDatabaseService.dart';
import 'package:flutter_vscode/src/Services/GoogleSignInService/Entities/GoogleSignInUserEntity.dart';
import 'package:flutter_vscode/src/Services/GoogleSignInService/Interfaces/Interfaces.dart';
import 'package:flutter_vscode/src/Services/GoogleSignInService/Mappers/GoogleSignInMapper.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DefaultGoogleSignInService extends GoogleSignInService{
  final RealtimeDatabaseService _realtimeDatabaseService;
String _path ="users/";

  DefaultGoogleSignInService({RealtimeDatabaseService ? realtimeDatabaseService}):
      _realtimeDatabaseService = realtimeDatabaseService ?? DefaultRealtimeDatabaseService();


  @override
  Future<GoogleSignInUserEntity> signInWithGoogle() async{
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
      return GoogleSignInMapper.mapUserCredential(userCredential, googleAuth?.idToken);
  }
@override
Future<bool> isUserInDatabase({required String uid}) async{
  final fullPath = _path + uid;
  try{
    final result=await _realtimeDatabaseService.getData(path: fullPath);
    return result.isNotEmpty;
  }on Failure catch(f){
    return false;
  }
}
  
}