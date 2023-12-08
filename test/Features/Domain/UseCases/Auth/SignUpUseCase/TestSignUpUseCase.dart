import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Base/Constants/ErrorMessage.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/Decodables/AuthErrorDecodable.dart';
import 'package:flutter_vscode/src/features/domain/Entities/Auth/SignUpEntity/SignUpEntity.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCase.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/Auth/SignUpUseCase/SignUpUseCaseParameters.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

abstract class _Constants{
  static String correctEmail="anthoo124@gmail.com";
  static String correctPass="123456";
  static String wrongEmail ="anthoo@gmail.com";
  static String wrongPass="123456";
}
void main(){
      //given   (subject under test=sut)

  SignUpUseCase sut = DefaultSignUpUseCase();

  //test for saved create account
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
                break;
              case ResultStatus.error:
            //then
              expect(result.error,Failure);
            }
          });
          //add test's

  });


  //test for failed  create account

group('Test failure sign up in Firebase', () {
test('Test failure sign up in Firebase', ()async{
try{
  final SignUpUseCaseParameters parameters = SignUpUseCaseParameters(
      email: _Constants.wrongEmail,
      password: _Constants.wrongPass,
      username: 'zarek1',
      date: '28/04/2002',
      phone: '955632733');
  final _ = await sut.execute(parameters: parameters);
}on Failure catch(f){
//then
      AuthErrorDecodable _error = f as AuthErrorDecodable;
      expect(_error.error!.message, FirebaseFailureMessages.emailExistMessage);
}

});
  
});

//add test's




}