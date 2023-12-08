import 'package:flutter/material.dart';


import '../features/presentation/Auth/LoginPage/View/LoginPage.dart';
import '../features/presentation/Auth/SignUpPage/View/SignUpPage.dart';
import '../features/presentation/Auth/UpdatePasswordPage/View/UpdatePasswordPageView.dart';
import '../features/presentation/Auth/WelcomePage/View/WelcomePage.dart';
import '../features/presentation/CheckoutPage/View/CheckoutPage.dart';
import '../features/presentation/Profile/ChangePaymentsMethodsPage/View/ChangePaymentsMethodsPage.dart';
import '../features/presentation/Profile/EditEmailPage/View/EditEmailPage.dart';
import '../features/presentation/Profile/EditPasswordPage/View/EditPasswordPage.dart';
import '../features/presentation/Profile/ProfileDetailPage/View/ProfileDetailPageView.dart';
import '../features/presentation/Shared/MainCoordinator/MainCoordinator.dart';
import '../features/presentation/tabs/TabsPage/View/TabsPage.dart';



final routes = <String, WidgetBuilder>{
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
