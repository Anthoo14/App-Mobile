
abstract class  AppFailureMessage{
  //Error Message
 static String unExpectedErrrorMessage =  "an unexpected error has occurred.";

}


abstract class FirebaseFailureMessages{

  //Error Messages

  static String emailNotFoundMessage =
  "There is no  user record corresponding to this identifier. The use may have been deleted";
  static String invalidPasswordMessage=
  "The password is invalid or the user does not have a password.";
  static String emailExistMessage =
  "The email address is already being used by another account.";
  static String tooManyAttemptsMessage =
  "We have blocked all requests from this device due to unusual activity. Please try again later.";
  static String invalidTokenMessage =
      "The user credentials are no longer valid. Please log in again";
  static String userNotFoundMessage =
  "There is no user record corresponding to this identifier. The user may have been deleted.";

}