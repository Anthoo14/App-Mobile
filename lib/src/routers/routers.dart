import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/features/presentation/Collection_Detail_Page/View/Collection_Detail_Page.dart';
import 'package:flutter_vscode/src/features/presentation/CollectionsPage/View/collectionsView.dart';
import 'package:flutter_vscode/src/features/presentation/CreateAccountPage/View/CreateAccount.dart';
import 'package:flutter_vscode/src/features/presentation/ForgotPasswordPage/View/ForgotPassword.dart';
import 'package:flutter_vscode/src/features/presentation/Places_Detail_Page/View/places_detail_page.dart';
import 'package:flutter_vscode/src/features/presentation/Profile_Detail_Page/View/profile_detail.dart';
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
  'Collection': (BuildContext context) => CollectionsPage(),
  'CollectionsDetail': (BuildContext context) => CollectionsDetail(),
  'PlaceDetail': (BuildContext context) => PlaceDetailPage(),
  'ProfileDetail': (BuildContext context) => ProfileDetailPage()
};
