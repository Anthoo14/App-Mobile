// * Auth Repositories

import '../../../Base/ApiService/appError.dart';
import '../../../Managers/Decodables/PlaceListDecodable.dart';
import '../../../Services/FirebaseService/AuthFirebaseService/Decodables/SingInDecodable.dart';
import '../../../Services/FirebaseService/AuthFirebaseService/Decodables/SingUpDecodable.dart';
import '../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../Data/Decodables/Collections/CollectionsDecodable.dart';
import '../../Data/Decodables/User/UserDecodable.dart';
import '../../Data/Repositories/User/UserBodyParameters.dart';
import '../../domain/Entities/Places/PlaceList/PlaceListEntity.dart';

import '../Decodables/DeliveryAddress/DeliveryAddressDecodable.dart';
import '../Decodables/PaymentMethods/PaymentMethodsDecodable.dart';
import '../Repositories/Auth/SignInRepository/SignInBodyParameters.dart';
import '../Repositories/DeliveryAddress/BodyParameters/DeliveryAddressBodyParameters.dart';
import '../Repositories/PaymentMethods/BodyParameters/PaymentMethodsBodyParameters.dart';



// Auth Repositories
abstract class SignInRepository {
  Future<Result<SignInDecodable, Failure>> signIn({required SignInBodyParameters params});
}

abstract class SignUpRepository {
  Future<Result<SignUpDecodable, Failure>> signUp({ required SignUpBodyParameters params });
}

abstract class GetAuthUserDataRepository {
  Future<Result<UserAuthDataDecodable, Failure>> getUserData({ required GetUserDataBodyParameters params });
}

abstract class UpdatePasswordRepository {
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword({ required String email });
}

abstract class UpdateEmailRepository {
  Future<dynamic> updateEmail({ required String oldEmail, required String newEmail, required String password });
}

// * User Repositories
abstract class SaveUserDataRepository {
  Future<Result<UserDecodable, Failure>> saveUserData({ required UserBodyParameters params });
}

abstract class FetchUserDataRepository {
  Future<Result<UserDecodable, Failure>> fetchUserData({ required String localId });
}

// * LocalStorage Repositories
abstract class SaveLocalStorageRepository {
  Future<void> saveInLocalStorage({ required String key, required String value });
  Future<void> saveRecentSearchInLocalStorage({ required String key, required List<String> value });
}

abstract class FetchLocalStorageRepository {
  Future<String?> fetchInLocalStorage({ required String key });
  Future<List<String>?> fetchRecentSearches();
}

abstract class RemoveLocalStorageRepository {
  Future<void> removeInLocalStorage({required String key});
}

// * Collections Repositories
abstract class CollectionsRepository {
  Future<CollectionsDecodable> fetchCollections();
}

// * Places Repositories
abstract class PlaceListRepository {
  Future<PlaceListDecodable> fetchPlaceList();
  Future<PlaceListDecodable> fetchNoveltyPlaceList();
  Future<PlaceListDecodable> fetchPopularPlacesList();
  Future<PlaceListDecodable> fetchPlacesListByCategory({ required int categoryId });
  Future<PlaceListDecodable> fetchPlacesListByQuery({ required String query });
  Future<PlaceListDecodable> fetchPlacesListByRecentSearches({ required List<String> placeIds });
}

abstract class PlaceDetailRepository {
  Future<void> savePlaceDetail({ required PlaceListDetailEntity placeDetail });
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