import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

abstract class _Constants{
  static String correctEmail="anthoo@gmail.com";
  static String correctPass="123456";
  static String wrongEmail ="zarek231@gmail.com";
  static String wrongPass="123456";
}
void main(){
      //given   (subject under test=sut)

  SignUpUseCase sut = DefaultSignUpUseCase();

  group('Test success signUp user in Firebase', () {
          test('Test success signUp user in Firebase', () async {
              final SignUpUseCaseParameters parameters = SignUpUseCaseParameters(
                  email: _Constants.correctEmail,
                  password: _Constants.correctPass,
                  username: 'zarek1',
                  date: '28/04/2002',
                  phone: '955632733');

            //when (group)
            final result = await sut.execute(parameters: parameters);

            switch(result.status){
              case ResultStatus.success:
              //then
                expect(result.value, isA<SignUpEntity>());
                print("correct test");
              case ResultStatus.error:
            //then
              expect(result.error,Failure);
            }
          });

  });







}