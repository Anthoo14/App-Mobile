import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery/src/Services/FirebaseServices/FirebaseAuthService/Decodables/AuthErrorDecodable.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:delivery/src/features/Domain/Entities/Auth/SignUp/SignUpEntity.dart';
import 'package:delivery/src/features/Domain/UseCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:delivery/src/features/Domain/UseCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class _Constants {
  static String correctEmail = "zarek14@gmail.com";
  static String correctPass = "123456";
  static String wrongEmail = "zarek14@gmail.com";
  static String wrongPass = "123456";
}

void main() {
  // GIVEN
  SignUpUseCase sut = DefaultSignUpUseCase();

  // Test success signUp feature
  group('Test success signUp feature', () {
      // Test correct signUp user in Firebase
      test('Test correct signUp user in Firebase', () async {
          // GIVEN       
          final SignUpUseCaseParameters params = SignUpUseCaseParameters(email: _Constants.correctEmail,
                                                                         password: _Constants.correctPass,
                                                                         username: 'Cane',
                                                                         date: '23/10/1989',
                                                                         phone: '12333');
          
          // WHEN
          final result = await sut.execute(params: params);

          switch(result.status) {
            case ResultStatus.success:
              // THEN
              expect(result.value, isA<SignUpEntity>());
              break;
            case ResultStatus.error:
              // THEN
              expect(result.error, Failure);
              break;
          }
      });

      // Test correct signUp user and check the value localId is not empty
      test('Test correct signUp user and check the value localId is not empty', () async {
            // GIVEN       
            final SignUpUseCaseParameters params = SignUpUseCaseParameters(email: _Constants.correctEmail, password: _Constants.correctPass, username: 'Cane');
            // WHEN
            final result = await sut.execute(params: params);

            switch(result.status) {
              case ResultStatus.success:
                // THEN
                final entity = SignUpEntity.fromMap(result.value!.toMap());
                expect(entity.localId!.isNotEmpty, true);
                break;
              case ResultStatus.error:
                // THEN
                expect(result.error, FBFailureMessages.emailExistMessage);
                break;
            }
      });

    // TODO: Añadir más test ;)
  });

  // Test failure signUp feature
  group('Test failure signUp feature', () {
        // Test failure signUp feature in Firebase because the email exists
        test('Test failure signUp feature in Firebase because the email exists', () async {
          try {
            // WHEN
            final SignUpUseCaseParameters params = SignUpUseCaseParameters(email: _Constants.wrongEmail, password: _Constants.wrongPass, username: 'Cane');
            final result = await sut.execute(params: params);
          } on Failure catch(f) {
            // THEN
            AuthErrorDecodable _error = f as AuthErrorDecodable;
            expect(_error.error!.message, FBFailureMessages.emailExistMessage);
          }
        });

    // TODO: Añadir más test ;)
  });
}