import 'package:delivery/src/Base/Constants/LocalStorageKeys.dart';
import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Domain/Entities/Collections/CollectionsEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/Order/OrderEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/PaymentMethods/PaymentMethodsEntity.dart';
import 'package:delivery/src/Features/Domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:delivery/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/FetchLocalStorageUseCase.dart';
import 'package:delivery/src/Features/Domain/UseCases/LocalStorage/FetchLocalStorage/LocalStorageUseCaseParameters.dart';
import 'package:delivery/src/Features/Domain/UseCases/LocalStorage/SaveLocalStorage/SaveLocalStorageUseCase.dart';
import 'package:delivery/src/Features/Domain/UseCases/User/ValidateCurrentUserUseCase/ValidateCurrentUserUseCase.dart';
import 'package:delivery/src/Features/Presentation/Auth/WelcomePage/View/WelcomePage.dart';
import 'package:delivery/src/Features/Presentation/Collections/CollectionDetailPage/View/CollectionDetailPage.dart';
import 'package:delivery/src/Features/Presentation/Collections/CollectionDetailPage/ViewModel/CollectionDetailPageViewModel.dart';
import 'package:delivery/src/Features/Presentation/Collections/CollectionsPage/View/CollectionsPage.dart';
import 'package:delivery/src/Features/Presentation/Filters/FilterPage/View/FilterPage.dart';
import 'package:delivery/src/Features/Presentation/OrderConfirmation/OrderConfirmation.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/View/PlaceDetailPage.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceDetailPage/ViewModel/PlaceDetailViewModel.dart';
import 'package:delivery/src/Features/Presentation/Places/PlaceRatingsPage/PlaceRatingsPage.dart';
import 'package:delivery/src/Features/Presentation/Places/PopularPlacesListPage/View/PopularPlacesListPage.dart';
import 'package:flutter/material.dart';

import '../../Profile/AddEditCardPage/View/AddEditCardPage.dart';
import '../../Profile/AddEditDeliveryAddressPage/View/AddEditDeliveryAddressPage.dart';
import '../../Profile/AddEditPaypalAccountPage/View/AddEditPaypalAccountPage.dart';
import '../../Profile/ChangeDeliveryAddressPage/View/ChangeDeliveryAddressPage.dart';

class RoutesPaths {
  static String welcomePath = "welcome";
  static String loginPath = "login";
  static String signUpPath = "sign-up";
  static String tabsPath = "Tabs";
  static String updatePasswordPath = "forgot-password";
  static String editPasswordPath = "edit-password";
  static String editEmailPath = "edit-email";
  static String changePaymentMethodsPath = "change-payments-methods";
}

class MainCoordinator {
  // Dependencies
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserCase _validateCurrentUserCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  // Exposed Properties
  String? userUid;
  static MainCoordinator? sharedInstance = MainCoordinator();

  MainCoordinator(
      {FetchLocalStorageUseCase? fetchLocalStorageUseCase,
      ValidateCurrentUserCase? validateCurrentUserCase,
      SaveLocalStorageUseCase? saveLocalStorageUseCase})
      : _fetchLocalStorageUseCase =
            fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _validateCurrentUserCase =
            validateCurrentUserCase ?? DefaultValidateCurrentUserCase(),
        _saveLocalStorageUseCase =
            saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  Future<String?> start(BuildContext context) {
    return _isUserLogged(context).then((value) {
      return value == null ? RoutesPaths.welcomePath : RoutesPaths.tabsPath;
    });
  }
}

extension AuthNavigation on MainCoordinator {
  showWelcomePage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.welcomePath);
  }

  showLoginPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.loginPath);
  }

  void logoutNavigation({required BuildContext context}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }


  showSignUpPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.signUpPath);
  }

  showTabsPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.tabsPath);
  }

  showUpdatePasswordPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.updatePasswordPath);
  }
}

extension PlacesNavigation on MainCoordinator {
  showPlaceListPage(
      {required BuildContext context,
      required List<PlaceDetailEntity> popularPlaces}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                PopularPlacesListPage(popularPlaces: popularPlaces),
            transitionDuration: const Duration(seconds: 0)));
  }

  showPlaceDetailPage(
      {required BuildContext context, required PlaceDetailEntity place}) async {
    await _saveLocalStorageUseCase.saveRecentSearchInLocalStorage(
        placeId: place.placeId);
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => PlaceDetailPage(
                viewModel: DefaultPlaceDetailViewModel(place: place)),
            transitionDuration: const Duration(seconds: 0)));
  }

  showCollectionsPage(
      {required BuildContext context,
      required List<CollectionDetailEntity> collections}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                CollectionsPage(collections: collections),
            transitionDuration: const Duration(seconds: 0)));
  }

  showCollectionsDetailPage(
      {required BuildContext context,
      required CollectionDetailEntity collection}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => CollectionDetailPage(
                collectionDetailPageViewModel:
                    DefaultCollectionDetailPageViewModel(
                        collection: collection)),
            transitionDuration: const Duration(seconds: 0)));
  }

  showFiltersPage(
      {required BuildContext context, required FilterPageDelegate delegate}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => FilterPage(delegate: delegate),
            transitionDuration: const Duration(seconds: 0)));
  }

  showRatingsPage(
      {required BuildContext context,
      required List<PlaceRatingEntity> placeRatings}) {
    _pushPage(
        context: context, page: PlaceRatingsPage(placeRatings: placeRatings));
  }
}

extension PaymentMethodsNavigation on MainCoordinator {
  showEditPasswordPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.editPasswordPath);
  }

  showEditEmailPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.editEmailPath);
  }

  showChangePaymentsMethodsPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.changePaymentMethodsPath);
  }

  showAddEditCardPage(
      {required BuildContext context,
      bool? isForEditing,
      bool? isForCreateAVisaCard,
      PaymentMethodEntity? paymentMethod,
      BaseViewStateDelegate? viewStateDelegate}) {
    _pushPage(
        context: context,
        page: AddEditCardPage(
            isEditing: isForEditing,
            isForCreateAVisaCard: isForCreateAVisaCard,
            paymentMethod: paymentMethod,
            viewStateDelegate: viewStateDelegate));
  }

  showAddEditPaypalAccountPage(
      {required BuildContext context,
      bool? isForEditing,
      PaymentMethodEntity? paymentMethod,
      BaseViewStateDelegate? viewStateDelegate}) {
    _pushPage(
        context: context,
        page: AddEditPaypalAccountPage(
            isEditing: isForEditing,
            paymentMethod: paymentMethod,
            viewStateDelegate: viewStateDelegate));
  }
}

extension DeliveryAddressNavigation on MainCoordinator {
  showChangeDeliveryAddress({required BuildContext context}) {
    _pushPage(context: context, page: const ChangeDeliveryAddressPage());
  }

  showAddEditDeliveryAddress(
      {required BuildContext context,
      required bool? isForEditing,
      DeliveryAddressEntity? deliveryAddressEntity,
      required BaseViewStateDelegate? viewStateDelegate}) {
    _pushPage(
        context: context,
        page: AddEditDeliveryAddressPage(
            deliveryAddressEntity: deliveryAddressEntity,
            viewStateDelegate: viewStateDelegate,
            isEditing: isForEditing));
  }
}

extension OrdersNavigation on MainCoordinator {
    showOrderConfimationPage({ required BuildContext context, required OrderEntity order }) {
        _pushPage(
            context: context,
            page: OrderConfirmationPage(order: order));
    }
}

extension PrivateMethods on MainCoordinator {
  Future<String?> _isUserLogged(BuildContext context) async {
    var idToken = await _fetchLocalStorageUseCase.execute(
        fetchLocalParameteres:
            FetchLocalStorageParameters(key: LocalStorageKeys.idToken));
    userUid = idToken;
    return idToken;
  }

  _pushPage({required BuildContext context, required Widget page}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
            transitionDuration: const Duration(seconds: 0)));
  }
}
