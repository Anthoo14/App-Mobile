import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Base/Constants/ErrorMessages.dart';
import 'package:delivery/src/Features/Domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/User/UserEntity.dart';
import 'package:delivery/src/Features/Domain/UseCases/DeliveryAddress/DeliveryAddressUseCase.dart';
import 'package:delivery/src/Features/Domain/UseCases/PaymentMethodsUseCase/PaymentMethodsUseCase.dart';
import 'package:delivery/src/Features/Domain/UseCases/Places/FavouritesPlacesUseCase/FavouritesPlacesUseCase.dart';
import 'package:delivery/src/Features/Domain/UseCases/User/FetchUserDataUseCase/FetchUserDataUseCase.dart';
import 'package:delivery/src/Features/Domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCase.dart';
import 'package:delivery/src/Features/Domain/UseCases/User/SaveUserDataUseCase/SaveUserDataUseCaseParameters.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Cards/FavouritesCards/View/FavouritesCardView.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Domain/Entities/PaymentMethods/PaymentMethodsEntity.dart';

mixin FavouritePageChangeStateDelegate {
  placeFromFavouritesRemoved();
}

class DefaultUserStateProvider extends ChangeNotifier
    with FavouritesCardViewDelegate {
  // Exposed Properties
  UserEntity? userData;

  // Dependencies
  final FetchUserDataUseCase _fetchUserDataUseCase;
  final SaveUserDataUseCase _saveUserDataUseCase;
  final FavouritesPlacesUseCase _favouritesPlacesUseCase;
  final PaymentMethodsUseCase _paymentMethodsUseCase;
  final DeliveryAddressUseCase _deliveryAddressUseCase;

  // Delegates
  FavouritePageChangeStateDelegate? favouritePageChangeStateDelegate;

  DefaultUserStateProvider(
      {FetchUserDataUseCase? fetchUserDataUseCase,
      FavouritesPlacesUseCase? favouritesPlacesUseCase,
      SaveUserDataUseCase? saveUserDataUseCase,
      PaymentMethodsUseCase? paymentMethodsUseCase,
      DeliveryAddressUseCase? deliveryAddressUseCase})
      : _fetchUserDataUseCase =
            fetchUserDataUseCase ?? DefaultFetchUserDataUseCase(),
        _saveUserDataUseCase =
            saveUserDataUseCase ?? DefaultSaveUserDataUseCase(),
        _favouritesPlacesUseCase =
            favouritesPlacesUseCase ?? DefaultFavouritesPlacesUseCase(),
        _paymentMethodsUseCase =
            paymentMethodsUseCase ?? DefaultPaymentMethodsUseCase(),
        _deliveryAddressUseCase =
            deliveryAddressUseCase ?? DefaultDeliveryAddressUseCase();

  @override
  favouriteIconTapped(bool isTapped, String placeId) async {
    await _favouritesPlacesUseCase.saveOrRemoveUserFromPlaceFavourites(
        placeId: placeId,
        localId: MainCoordinator.sharedInstance?.userUid ?? "",
        isFavourite: isTapped);
    if (!isTapped) {
      favouritePageChangeStateDelegate?.placeFromFavouritesRemoved();
    }
  }
}

// UserData
extension UserData on DefaultUserStateProvider {
  fetchUserData({ required String localId }) async {
    userData = await _fetchUserDataUseCase.execute(localId: localId);
  }

  Future<UserEntity> updateUserData({required UserEntity user}) async {
    return _saveUserDataUseCase
        .execute(params: SaveUserDataUseCaseParameters.fromUserEntity(user))
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Future.error(AppFailureMessages.unExpectedErrorMessage);
          }
          userData = result.value;
          return result.value!;
        case ResultStatus.error:
          return Future.error(AppFailureMessages.unExpectedErrorMessage);
      }
    });
  }
}

// Favourites
extension Favourites on DefaultUserStateProvider {
  Future<List<PlaceDetailEntity>> fetchUserFavouritePlaces() async {
    var placeList = await _favouritesPlacesUseCase.fetchFavouritesPlaces(
        localId: userData?.localId ?? "");
    return placeList.placeList ?? [];
  }
}

// PaymentMethods
extension PaymentMethods on DefaultUserStateProvider {
  Future<PaymentMethodsEntity?> getPaymentMethods() {
    return _paymentMethodsUseCase.getPaymentMethods(
        localId: userData?.localId ?? "");
  }

  Future<PaymentMethodsEntity?> addPaymentMethod(
      {required PaymentMethodEntity paymentMethod}) async {
    var paymentMethods = await getPaymentMethods();
    paymentMethods?.paymentMethods.add(paymentMethod);

    if (paymentMethods == null) {
      return Future.error(Failure.fromMessage(
          message: AppFailureMessages.unExpectedErrorMessage));
    }
    return _savePaymentMethods(parameters: paymentMethods);
  }

  Future<PaymentMethodsEntity?> editPaymentMethod(
      {required PaymentMethodEntity paymentMethod}) async {
    var paymentMethods = await getPaymentMethods();
    int? idx = paymentMethods?.paymentMethods
        .indexWhere((item) => item.id == paymentMethod.id);

    if (idx != -1 && idx != null && paymentMethods != null) {
      paymentMethods.paymentMethods[idx] = paymentMethod;
      return _savePaymentMethods(parameters: paymentMethods);
    } else {
      return Future.error(Failure.fromMessage(
          message: AppFailureMessages.unExpectedErrorMessage));
    }
  }

  Future<PaymentMethodsEntity?> deletePaymentMethod(
      {required PaymentMethodEntity paymentMethod}) async {
    var paymentMethods = await getPaymentMethods();
    int? idx = paymentMethods?.paymentMethods
        .indexWhere((item) => item.id == paymentMethod.id);
    if (idx != -1 && idx != null && paymentMethods != null) {
      paymentMethods.paymentMethods.removeAt(idx);
      return _savePaymentMethods(parameters: paymentMethods);
    } else {
      return Future.error(Failure.fromMessage(
          message: AppFailureMessages.unExpectedErrorMessage));
    }
  }

  Future<PaymentMethodsEntity?> _savePaymentMethods(
      {required PaymentMethodsEntity parameters}) {
    return _paymentMethodsUseCase.savePaymentMethods(
        localId: userData?.localId ?? "", parameters: parameters);
  }
}

// DeliveryAddress
extension DeliveryAddress on DefaultUserStateProvider {
  Future<DeliveryAddressListEntity?> getDeliveryAddressList() {
    return _deliveryAddressUseCase.getDeliveryAddressList(
        localId: userData?.localId ?? "");
  }

  Future<DeliveryAddressListEntity?> addDeliveryAddress({ required DeliveryAddressEntity deliveryAddressEntity }) async {
    var deliveryAddressList = await getDeliveryAddressList();
    deliveryAddressList?.deliveryAddressList.add(deliveryAddressEntity);

    if (deliveryAddressList == null) {
      return Future.error(Failure.fromMessage(
          message: AppFailureMessages.unExpectedErrorMessage));
    }
    return _saveDeliveryAddress(parameters: deliveryAddressList);
  }

  Future<DeliveryAddressListEntity?> editDeliveryAddress({ required DeliveryAddressEntity deliveryAddressEntity }) async {
    var deliveryAddressList = await getDeliveryAddressList();
    int? idx = deliveryAddressList?.deliveryAddressList
        .indexWhere((item) => item.id == deliveryAddressEntity.id);

    if (idx != -1 && idx != null && deliveryAddressList != null) {
      deliveryAddressList.deliveryAddressList[idx] = deliveryAddressEntity;
      return _saveDeliveryAddress(parameters: deliveryAddressList);
    } else {
      return Future.error(Failure.fromMessage(
          message: AppFailureMessages.unExpectedErrorMessage));
    }
  }

  Future<DeliveryAddressListEntity?> deleteDeliveryAddress({ required DeliveryAddressEntity deliveryAddressEntity }) async {
    var deliveryAddressList = await getDeliveryAddressList();
    int? idx = deliveryAddressList?.deliveryAddressList
        .indexWhere((item) => item.id == deliveryAddressEntity.id);
    if (idx != -1 && idx != null && deliveryAddressList != null) {
      deliveryAddressList.deliveryAddressList.removeAt(idx);
      return _saveDeliveryAddress(parameters: deliveryAddressList);
    } else {
      return Future.error(Failure.fromMessage(
          message: AppFailureMessages.unExpectedErrorMessage));
    }
  }

  Future<DeliveryAddressListEntity?> _saveDeliveryAddress(
      {required DeliveryAddressListEntity parameters}) {
    return _deliveryAddressUseCase.saveDeliveryAddressList(
        localId: userData?.localId ?? "", parameters: parameters);
  }
}

// BuildContext
extension DefaultUserStateProviderExtension on BuildContext {
  // Provider
  DefaultUserStateProvider getDefaultUserStateProvider() =>
      Provider.of<DefaultUserStateProvider>(this);
  // UserData
  UserEntity? getUserData() =>
      Provider.of<DefaultUserStateProvider>(this, listen: false).userData;
  Future<UserEntity> updateUserData({required UserEntity user}) =>
      Provider.of<DefaultUserStateProvider>(this, listen: false)
          .updateUserData(user: user);
  // Favourites
  Future<List<PlaceDetailEntity>> fetchUserFavouritePlaces() =>
      Provider.of<DefaultUserStateProvider>(this, listen: false)
          .fetchUserFavouritePlaces();
  // PaymentMethods
  Future<PaymentMethodsEntity?> getPaymentMethods() =>
      Provider.of<DefaultUserStateProvider>(this).getPaymentMethods();
  Future<PaymentMethodsEntity?> addPaymentMethod(
          {required PaymentMethodEntity paymentMethod}) =>
      Provider.of<DefaultUserStateProvider>(this, listen: false)
          .addPaymentMethod(paymentMethod: paymentMethod);
  Future<PaymentMethodsEntity?> editPaymentMethod(
          {required PaymentMethodEntity paymentMethod}) =>
      Provider.of<DefaultUserStateProvider>(this, listen: false)
          .editPaymentMethod(paymentMethod: paymentMethod);
  Future<PaymentMethodsEntity?> deletePaymentMethod(
          {required PaymentMethodEntity paymentMethod}) =>
      Provider.of<DefaultUserStateProvider>(this, listen: false)
          .deletePaymentMethod(paymentMethod: paymentMethod);

  // Delivery Address
  Future<DeliveryAddressListEntity?> getDeliveryAddressList() =>
      Provider.of<DefaultUserStateProvider>(this).getDeliveryAddressList();
  Future<DeliveryAddressListEntity?> addDeliveryAddress(
          {required DeliveryAddressEntity deliveryAddressEntity}) =>
      Provider.of<DefaultUserStateProvider>(this, listen: false)
          .addDeliveryAddress(deliveryAddressEntity: deliveryAddressEntity);
  Future<DeliveryAddressListEntity?> editDeliveryAddress(
          {required DeliveryAddressEntity deliveryAddressEntity}) =>
      Provider.of<DefaultUserStateProvider>(this, listen: false)
          .editDeliveryAddress(deliveryAddressEntity: deliveryAddressEntity);
  Future<DeliveryAddressListEntity?> deleteDeliveryAddress(
          {required DeliveryAddressEntity deliveryAddressEntity}) =>
      Provider.of<DefaultUserStateProvider>(this, listen: false)
          .deleteDeliveryAddress(deliveryAddressEntity: deliveryAddressEntity);
}
