import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/features/presentation/CreateAccountPage/View/CreateAccount.dart';
import 'package:flutter_vscode/src/features/presentation/ForgotPasswordPage/View/ForgotPassword.dart';
import 'package:flutter_vscode/src/features/presentation/SearchPage/View/searchView.dart';

//pages
import 'package:flutter_vscode/src/features/presentation/WelcomePage/View/WelcomePage.dart';
import 'package:flutter_vscode/src/features/presentation/LoginPage/View/LoginPage.dart';
import 'package:flutter_vscode/src/features/presentation/filterPage/View/filterPage.dart';
import 'package:flutter_vscode/src/features/presentation/tabs/ExploreTab/View/ExploreTab.dart';
import 'package:flutter_vscode/src/features/presentation/tabs/tabs.dart';

final routes = <String, WidgetBuilder>{
  'Welcome': (BuildContext context) => WelcomePage(),
  'Login': (BuildContext context) => LoginPage(),
  'ForgotPass': (BuildContext context) => ForgotPassword(),
  'CreateAccount': (BuildContext context) => CreateAccount(),
  'Tabs': (BuildContext context) => tabsPage(),
  'Search': (BuildContext context) => SearchPage(),
  'Filter': (BuildContext context) => FilterPage(),
};
