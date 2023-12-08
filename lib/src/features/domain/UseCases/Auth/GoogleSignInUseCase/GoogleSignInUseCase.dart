import 'package:delivery/src/Features/Domain/Entities/User/UserEntity.dart';
import 'package:delivery/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery/src/Services/GoogleSignIn/Interfaces/Interfaces.dart';
import 'package:delivery/src/Services/GoogleSignIn/Service/GoogleSignInService.dart';
import '../../../../../Base/AppError/AppError.dart';
import '../../../../../Base/Constants/LocalStorageKeys.dart';
import '../../../../../Services/GoogleSignIn/Entities/GoogleUserEntity.dart';
import '../../../../../Utils/Helpers/Date/DateHelpers.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../../../../features/Domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import '../../../../../features/Domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import '../../LocalStorage/SaveLocalStorage/SaveLocalStorageUseCase.dart';

abstract class GoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> execute();
}

class DefaultGoogleSignInUseCase extends GoogleSignInUseCase {

  // Dependencies
  final GoogleSignInService _googleSignInService;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;

  DefaultGoogleSignInUseCase({
    GoogleSignInService? googleSignInService,
    SaveLocalStorageUseCase? saveLocalStorageUseCase,
    SaveUserDataUseCase? saveUserDataUseCase
  }) : _googleSignInService = googleSignInService ?? DefaultGoogleSignInService(),
       _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase(),
        _saveUserDataUseCase = saveUserDataUseCase ?? DefaultSaveUserDataUseCase();

  @override
  Future<Result<UserEntity, Failure>> execute() async {
    final user = await _googleSignInService.signInWithGoogle();
    _saveLocalStorageUseCase.execute(saveLocalParameteres: SaveLocalStorageParameters(key: LocalStorageKeys.idToken,
                                                                                      value: user.uid ?? ""));

    final isUserInDatabase = await _googleSignInService.isUserInDatabase(uid: user.uid ?? "");
    if (isUserInDatabase) {
      return Result.success(mapUserEntity(user:user));
    } else {
      return _saveUserDataInDataBase(user: user);
    }
  }
}

extension on DefaultGoogleSignInUseCase {
  Future<Result<UserEntity, Failure>> _saveUserDataInDataBase({ required GoogleSignInUserEntity user }) {

    SaveUserDataUseCaseParameters _params = SaveUserDataUseCaseParameters(
        localId: user.uid,
        role: UserRole.user,
        username: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
        dateOfBirth: "",
        startDate: DateHelpers.getStartDate(),
        photo: user.photoURL,
        shippingAddress: '',
        billingAddress: '',
        idToken: user.idToken,
        provider: UserAuthProvider.google);

    return _saveUserDataUseCase.execute(params: _params);
  }

  UserEntity mapUserEntity({ required GoogleSignInUserEntity user }) {
    return UserEntity(
        localId: user.uid,
        role: UserRole.user.toShortString(),
        username: user.displayName,
        email: user.email,
        phone: user.phoneNumber,
        dateOfBirth: "",
        startDate: DateHelpers.getStartDate(),
        photo: user.photoURL,
        shippingAddress: '',
        billingAddress: '',
        idToken: user.refreshToken,
        provider: UserAuthProvider.google
    );
  }
}