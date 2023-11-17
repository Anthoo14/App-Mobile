import 'dart:convert';


import '../../Services/FirebaseService/AuthFirebaseService/Decodables/AuthErrorDecodable.dart';
import '../Constants/ErrorMessage.dart';

class Failure {
  String? message;
  Map<String, dynamic> error = {};

  @override
  String toString() => message ?? "";

  Failure.fromMessage({String? message}) {
    this.message = message;
  }

  Failure.fromBody({required String body}) {
    var jsonData = jsonDecode(body);
    this.error = jsonData;
  }

  static Failure getFirebaseAuthErrorMessage(
      {required Map<String, dynamic> error}) {
    AuthErrorDecodable _errorDecodable = AuthErrorDecodable.fromMap(error);

    var message = "";
    _errorDecodable.error?.errors?.forEach((error) {
      message = error.message ?? "";
    });

    if (message == "EMAIL_NOT_FOUND") {
      return Failure.fromMessage(
          message: FirebaseFailureMessages.emailNotFoundMessage);
    } else if (message == "INVALID_PASSWORD") {
      return Failure.fromMessage(
          message: FirebaseFailureMessages.invalidPasswordMessage);
    } else if (message == "EMAIL_EXISTS") {
      return Failure.fromMessage(
          message: FirebaseFailureMessages.emailExistMessage);
    } else if (message == "TO_MANY_ATTEMPTS_TRY_LATER") {
      return Failure.fromMessage(
          message: FirebaseFailureMessages.tooManyAttemptsMessage);
    } else if (message == "INVALID_ID_TOKEN") {
      return Failure.fromMessage(
          message: FirebaseFailureMessages.invalidTokenMessage);
    } else if (message == "USER_NOT_FOUND") {
      return Failure.fromMessage(
          message: FirebaseFailureMessages.userNotFoundMessage);
    }else{
      return   Failure.fromMessage(message: message);
    }
  }
}
