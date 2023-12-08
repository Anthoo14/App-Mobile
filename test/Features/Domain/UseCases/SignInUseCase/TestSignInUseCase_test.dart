import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery/src/Services/FirebaseServices/FirebaseAuthService/Decodables/AuthErrorDecodable.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:delivery/src/features/Domain/Entities/Auth/SignIn/SignInEntity.dart';
import 'package:delivery/src/features/Domain/UseCases/Auth/SignInUseCase/SignInUseCase.dart';
import 'package:delivery/src/features/Domain/UseCases/Auth/SignInUseCase/SignInUseCaseParameters.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class _Constants {
  static String correctEmail = "zarek@gmail.com";
  static String correctPass = "123456";
  static String wrongEmail = "zarek@gmail.com";
  static String wrongPass = "12345689";
}

void main() {
  // GIVEN
  final SignInUseCase sut = DefaultSignInUseCase();

  // Test correct response to SignInUseCase
  group('Test correct response to SignInUseCase', () {
    // Test correct signIn feature with correct email and password
    test('Test correct signIn feature with correct email and password',
        () async {
      // GIVEN
      final SignInUseCaseParameters _signInBodyParams = SignInUseCaseParameters(
          email: _Constants.correctEmail, password: _Constants.correctPass);

      // WHEN    
      var result = await sut.execute(params: _signInBodyParams);

      switch (result.status) {
        case ResultStatus.success:
          // THEN
          expect(result.value, isA<SignInEntity>());
          break;
        case ResultStatus.error:
          // THEN
          expect(result.error, Failure);
          break;
      }
    });

    // Test correct signIn feature with correct email and password and receives localId propertie
    test(
        'Test correct signIn feature with correct email and password and receives localId propertie',
        () async {
      // GIVEN
      final SignInUseCaseParameters _signInBodyParams = SignInUseCaseParameters(
          email: _Constants.correctEmail, password: _Constants.correctPass);
      
      // WHEN
      var result = await sut.execute(params: _signInBodyParams);

      switch (result.status) {
        case ResultStatus.success:
          // THEN
          var entity = SignInEntity.fromMap(result.value!.toMap());
          expect(entity.localId, "L0vuN9HivNSakuQtRKGrYlDa3fR2");
          break;
        case ResultStatus.error:
          // THEN
          expect(result.error, Failure);
          break;
      }
    });

    // TODO: Añadir más test ;)
  });

  // Test failure response to SignInUseCase
  group('Test failure response to SignInUseCase', () {
    // Test failure response to SignInUseCase with wrong email
    test('Test failure response to SignInUseCase with wrong email', () async {
      // GIVEN
      final SignInUseCaseParameters _signInBodyParams = SignInUseCaseParameters(
          email: _Constants.wrongEmail, password: _Constants.correctPass);
      try {
        // WHEN
        var _ = await sut.execute(params: _signInBodyParams);
      } on Failure catch (f) {
        // THEN
        AuthErrorDecodable _error = f as AuthErrorDecodable;
        expect(_error.error!.message, FBFailureMessages.emailNotFoundMessage);
      }
    });

    // Test failure response to SignInUseCase with wrong password
    test('Test failure response to SignInUseCase with wrong password',
        () async {
      // GIVEN
      final SignInUseCaseParameters _signInBodyParams = SignInUseCaseParameters(
          email: _Constants.correctEmail, password: _Constants.wrongPass);
      try {
        // WHEN
        var _ = await sut.execute(params: _signInBodyParams);
      } on Failure catch (f) {
        // THEN
        AuthErrorDecodable _error = f as AuthErrorDecodable;
        expect(_error.error!.message, FBFailureMessages.invalidPasswordMessage);
      }
    });

    // TODO: Añadir más test ;)
  });
}
