
//Auth Repositories
import 'package:flutter_vscode/src/Base/ApiService/appError.dart';
import 'package:flutter_vscode/src/features/data/Decodables/Auth/UserAuthData/UserAuthDataDecodable.dart';
import 'package:flutter_vscode/src/features/data/Decodables/User/UserDecodable.dart';

import 'package:flutter_vscode/src/features/data/Repositories/Auth/SingUpRepository/SingUpRepositoryParameters.dart';
import 'package:flutter_vscode/src/features/data/Repositories/User/UserBodyParameters.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';

import '../../../Services/FirebaseService/AuthFirebaseService/Decodables/SingInDecodable.dart';
import '../../../Services/FirebaseService/AuthFirebaseService/Decodables/SingUpDecodable.dart';
import '../../../Services/FirebaseService/AuthFirebaseService/Decodables/UpdatePassDecodable.dart';
import '../../Data/Decodables/DeliveryAddress/DeliveryAddressDecodable.dart';
import '../../Data/Decodables/PaymentMethods/PaymentMethodsDecodable.dart';
import '../../Data/Repositories/DeliveryAddress/BodyParameters/DeliveryAddressBodyParameters.dart';
import '../../data/Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import '../../data/Repositories/Auth/UserAuthData/UserAuthDataRepositoryBodyParameters.dart';
import '../../data/Repositories/PaymentMethods/BodyParameters/PaymentMethodsBodyParameters.dart';

// Auth Repository

abstract class SignInRepository {
 Future<Result<SingInDecodable, Failure>> signIn({required SignInBodyParameters params});
}


abstract class SingUpRepository{
 Future<Result<SingUpDecodable, Failure>> singUp({required SingUpRepositoryParameters parameters});
}

abstract class UpdatePassRepository{
 Future<Result<UpdatePassDecodable,Failure>> updatePass({required String email});
}

abstract class UserAuthDataRepository{
 Future<Result<UserAuthDataDecodable,Failure>>  GetUserData({required GetUserAuthDataBodyParameters parameters});
}

//User Database Repository
abstract class SaveUserDataRepository{
 Future<Result<UserDecodable, Failure>> saveUserData({required UserBodyParameters parameters});

}

abstract class FetchUserDataRepository{
 Future<Result<UserDecodable,Failure>> fetchUserData({required String localId});
}

//local storage
abstract class SaveLocalStorageRepository{
 Future<void> saveInLocalStorage({required String key,required String value});
 Future<void> saveRecentSearchInLocalStorage({ required String key, required List<String> value });
}

abstract class FetchLocalStorageRepository{
 Future<String?> fetchInLocalStorage({required String key});
 Future<List<String>?> fetchRecentSearches();
}

abstract class RemoveLocalStorageRepository{
 Future<void> removeInLocalStorage({required String key});
}

// * Payment Methods Repositories
abstract class PaymentMethodsRepository {
 Future<PaymentMethodsDecodable> getPaymentMethods({ required String localId });
 Future<PaymentMethodsDecodable> savePaymentMethods({ required String localId, required PaymentMethodsBodyParameters bodyParameters });
}

// * Delivery Address Repositories
abstract class DeliveryAddressRepository {
 Future<DeliveryAddressListDecodable> getDeliveryAddressList({ required String localId });
 Future<DeliveryAddressListDecodable> saveDeliveryAddressList({ required String localId,
  required DeliveryAddressListBodyParameters bodyParameters });
}