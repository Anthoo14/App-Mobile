
import 'package:flutter/material.dart';


import '../../../Base/Constants/LocalStorageKeys.dart';
import '../../../Base/Views/BaseView.dart';

import '../../domain/Entities/Collections/CollectionsEntity.dart';
import '../../domain/Entities/DeliveryAddress/DeliveryAddressEntity.dart';
import '../../domain/Entities/PaymentMethods/PaymentMethodsEntity.dart';
import '../../domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import '../../domain/UseCases/LocalStorage/FetchLocalStorageUseCase.dart';
import '../../domain/UseCases/LocalStorage/LocalStorageUseCaseParameters.dart';
import '../../domain/UseCases/LocalStorage/SaveLocalStorageUseCase.dart';
import '../../domain/UseCases/User/ValidateCurrentUserUseCase/ValidateCurrentUserUseCase.dart';
import '../CollectionsPage/View/collectionsView.dart';
import '../FilterPage/View/FilterPage.dart';
import '../Filters/FilterPage/View/FilterPage.dart';
import '../Places_Detail_Page/View/places_detail_page.dart';
import '../Profile/AddEditCardPage/View/AddEditCardPage.dart';
import '../Profile/AddEditDeliveryAddressPage/View/AddEditDeliveryAddressPage.dart';
import '../Profile/AddEditPaypalAccountPage/View/AddEditPaypalAccountPage.dart';
import '../Profile/ChangeDeliveryAddressPage/View/ChangeDeliveryAddressPage.dart';
import '../WelcomePage/View/WelcomePage.dart';

class RoutesPaths {
  static String welcomePath = "Welcome";
  static String loginPath = "Login";
  static String signUpPath = "Sign-up";
  static String tabsPath = "Tabs";
  static String updatePasswordPath = "Forgot-password";
  static String editPasswordPath = "Edit-password";
  static String editEmailPath = "Edit-email";
  static String changePaymentMethodsPath = "Change-payments-methods";
}

class MainCoordinator {
  // Dependencies
  final FetchLocalStorageUseCase _fetchLocalStorageUseCase;
  final ValidateCurrentUserUseCase _validateCurrentUserCase;
  final SaveLocalStorageUseCase _saveLocalStorageUseCase;

  // Exposed Properties
  String? userUid;
  static MainCoordinator? sharedInstance = MainCoordinator();

  MainCoordinator({ FetchLocalStorageUseCase? fetchLocalStorageUseCase,
    ValidateCurrentUserUseCase? validateCurrentUserCase,
    SaveLocalStorageUseCase? saveLocalStorageUseCase })
      : _fetchLocalStorageUseCase = fetchLocalStorageUseCase ?? DefaultFetchLocalStorageUseCase(),
        _validateCurrentUserCase = validateCurrentUserCase ?? DefaultValidateCurrentUserUseCase(),
        _saveLocalStorageUseCase = saveLocalStorageUseCase ?? DefaultSaveLocalStorageUseCase();

  Future<String?> start(BuildContext context) {
    return _isUserLogged(context).then((value) {
      return value == null ? RoutesPaths.welcomePath : RoutesPaths.tabsPath;
    });
  }
}

extension AuthNavigation on MainCoordinator {
  showWelcomePage({ required BuildContext context }) {
    Navigator.pushNamed(context, RoutesPaths.welcomePath);
  }

  showLoginPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.loginPath);
  }

  logoutNavigation({ required BuildContext context }) {
    Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (_, __, ___) => WelcomePage(),
        transitionDuration: const Duration(seconds: 0)));
  }

  showSignUpPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.signUpPath);
  }

  showTabsPage({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesPaths.tabsPath);
  }

  showUpdatePasswordPage({ required BuildContext context }) {
    Navigator.pushNamed(context, RoutesPaths.updatePasswordPath);
  }
}

extension PlacesNavigation on MainCoordinator {
  showPlaceListPage({ required BuildContext context,
    required List<PlaceListDetailEntity> popularPlaces }) {
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (_,__,___) => PopularPlacesListPage(popularPlaces: popularPlaces),
            transitionDuration: const Duration(seconds: 0)
        ));
  }

  showPlaceDetailPage({ required BuildContext context,
    required String placeId }) async {
    await _saveLocalStorageUseCase.saveRecentSearchInLocalStorage(placeId: placeId);
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (_,__,___) => PlaceDetailPage(),
            transitionDuration: const Duration(seconds: 0)
        ));
  }

  showCollectionsPage({ required BuildContext context,
    required List<CollectionDetailEntity> collections }) {
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (_,__,___) => CollectionsPage(collections: collections),
            transitionDuration: const Duration(seconds: 0)
        ));
  }

  showCollectionsDetailPage({ required BuildContext context,
    required CollectionDetailEntity collection }) {
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (_,__,___) => CollectionDetailPage(collectionDetailPageViewModel: DefaultCollectionDetailPageViewModel(collection: collection)),
            transitionDuration: const Duration(seconds: 0)
        ));
  }

  showFiltersPage({ required BuildContext context,
    required FilterPageDelegate delegate }) {
    Navigator.push(context,
        PageRouteBuilder(pageBuilder: (_,__,___) => FilterPage(delegate: delegate),
            transitionDuration: const Duration(seconds: 0)
        ));
  }

  showRatingsPage({ required BuildContext context,
    required List<int> ratingsList }) {
    _pushPage(context: context,
        page: PlaceRatingsPage(ratingsList: ratingsList));
  }
}

extension PaymentMethodsNavigation on MainCoordinator {
  showEditPasswordPage({ required BuildContext context }) {
    Navigator.pushNamed(context, RoutesPaths.editPasswordPath);
  }

  showEditEmailPage({ required BuildContext context }) {
    Navigator.pushNamed(context, RoutesPaths.editEmailPath);
  }

  showChangePaymentsMethodsPage({ required BuildContext context }) {
    Navigator.pushNamed(context, RoutesPaths.changePaymentMethodsPath);
  }

  showAddEditCardPage({ required BuildContext context,
    bool? isForEditing,
    bool? isForCreateAVisaCard,
    PaymentMethodEntity? paymentMethod,
    BaseViewStateDelegate? viewStateDelegate }) {
    _pushPage(context: context,
        page: AddEditCardPage(isEditing: isForEditing,
            isForCreateAVisaCard: isForCreateAVisaCard,
            paymentMethod: paymentMethod,
            viewStateDelegate: viewStateDelegate));
  }

  showAddEditPaypalAccountPage({ required BuildContext context,
    bool? isForEditing,
    PaymentMethodEntity? paymentMethod,
    BaseViewStateDelegate? viewStateDelegate }) {
    _pushPage(context: context,
        page: AddEditPaypalAccountPage(isEditing: isForEditing,
            paymentMethod: paymentMethod,
            viewStateDelegate: viewStateDelegate));
  }
}

extension DeliveryAddressNavigation on MainCoordinator {
  showChangeDeliveryAddress({ required BuildContext context }) {
    _pushPage(context: context, page: const ChangeDeliveryAddressPage());
  }

  showAddEditDeliveryAddress({ required BuildContext context,
    required bool? isForEditing,
    DeliveryAddressEntity? deliveryAddressEntity,
    required BaseViewStateDelegate? viewStateDelegate }) {
    _pushPage(context: context, page: AddEditDeliveryAddressPage(deliveryAddressEntity: deliveryAddressEntity,
        viewStateDelegate: viewStateDelegate,
        isEditing: isForEditing));
  }
}

extension PrivateMethods on MainCoordinator {
  Future<String?> _isUserLogged(BuildContext context) async {
    var idToken = await _fetchLocalStorageUseCase.execute(fetchLocalParameteres: FetchLocalStorageParameters(key: LocalStorageKeys.idToken));
    userUid = idToken;
    return idToken;
  }

  _pushPage({ required BuildContext context,
    required Widget page }) {
    Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___) => page,
        transitionDuration: const Duration(seconds: 0)
    ));
  }
}
