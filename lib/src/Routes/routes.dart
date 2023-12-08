import 'package:delivery/src/Features/Presentation/Auth/LoginPage/View/LoginPage.dart';
import 'package:delivery/src/Features/Presentation/Auth/SignUpPage/View/SignUpPage.dart';
import 'package:delivery/src/Features/Presentation/Auth/UpdatePasswordPage/View/UpdatePasswordPageView.dart';
import 'package:delivery/src/Features/Presentation/Auth/WelcomePage/View/WelcomePage.dart';
import 'package:delivery/src/Features/Presentation/Profile/AddEditCardPage/View/AddEditCardPage.dart';
import 'package:delivery/src/Features/Presentation/Profile/EditEmailPage/View/EditEmailPage.dart';
import 'package:delivery/src/Features/Presentation/Profile/ProfileDetailPage/View/ProfileDetailPageView.dart';
import 'package:flutter/material.dart';
import '../Features/Presentation/Profile/ChangePaymentsMethodsPage/View/ChangePaymentsMethodsPage.dart';
import '../Features/Presentation/Profile/EditPasswordPage/View/EditPasswordPage.dart';
import '../Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import '../Features/Presentation/Tabs/TabsPage/View/TabsPage.dart';
import '../features/presentation/CheckoutPage/View/CheckoutPage.dart';

final routes = <String, WidgetBuilder> {
  'welcome': (BuildContext context) => WelcomePage(),
  'login': (BuildContext context) => LoginPage(),
  'forgot-password': (BuildContext context) => UpdatePasswordPage(),
  'sign-up': (BuildContext context) => SignUpPage(),
  'Tabs': (BuildContext context) => const TabsPage(),
  'profile-detail': (BuildContext context) => const ProfileDetailPage(),
  'checkout': (BuildContext context) => CheckOutPage(),
  RoutesPaths.editPasswordPath : (BuildContext context) => const EditPasswordPage(),
  RoutesPaths.editEmailPath : (BuildContext context) => const EditEmailPage(),
  RoutesPaths.changePaymentMethodsPath : (BuildContext context) => const ChangePaymentsMethodsPage()
};
