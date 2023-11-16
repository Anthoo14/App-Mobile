
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/Base/Constants/ErrorMessage.dart';
import 'package:flutter_vscode/src/Services/FirebaseService/AuthFirebaseService/interfaceAuth/Decodables/AuthErrorDecodable.dart';
import 'package:flutter_vscode/src/features/domain/Entities/Auth/SignInEntity/SignInEntity.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/Auth/SignInUseCase/SignInUseCase.dart';
import 'package:flutter_vscode/src/features/domain/UseCases/Auth/SignInUseCase/SignInUseCaseParameters.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';


abstract class _Constants{
  static String correctEmail="anthoo14@gmail.com";
  static String correctPass="123456";
  static String wrongEmail ="anthoo314@gmail.com";
  static String wrongPass="1234wdq56";
}

void main(){

  final SignInUseCase sut= DefaultSignInUseCase();

  group("test success response to SignInUseCase", () {
        test("test success response to SignInUseCase", () async{
          //GIVEN
          final  SignInUseCaseBodyParameters _parameters=SignInUseCaseBodyParameters(email: _Constants.correctEmail, password: _Constants.correctPass);

          //WHEN
          var result = await sut.execute(parameters: _parameters);
          switch(result.status){
            case ResultStatus.success:
              expect(result.value, isA<SignInEntity>());

            case ResultStatus.error:
              //THEN
              expect(result.error, Failure);
          }
        });

        //ADD MORE TEST ;)
  });

  group("test failure response to SignInUseCase", () {
    //failed account
  test("test failure response to SignInUseCase", ()async{
    final  SignInUseCaseBodyParameters _parameters=SignInUseCaseBodyParameters(email: _Constants.wrongEmail, password: _Constants.wrongPass);
    try{
      final _ =await sut.execute(parameters: _parameters);


    }on Failure catch(f){
      AuthErrorDecodable _error = f as AuthErrorDecodable;
      expect(_error.error!.message, FirebaseFailureMessages.emailNotFoundMessage);
    }
  });
  //password failed
  test("test failure response to SignInUseCase whit wrong password", ()async{
    final  SignInUseCaseBodyParameters _parameters=SignInUseCaseBodyParameters(email: _Constants.correctEmail, password: _Constants.wrongPass);
    try{
      final _ =await sut.execute(parameters: _parameters);


    }on Failure catch(f){
      AuthErrorDecodable _error = f as AuthErrorDecodable;
      expect(_error.error!.message, FirebaseFailureMessages.invalidPasswordMessage);
    }
  });
  });
}