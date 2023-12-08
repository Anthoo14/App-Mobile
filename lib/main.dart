import 'package:delivery/src/Features/Presentation/Shared/StateProviders/ErrorStateProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'src/Base/Views/BaseView.dart';
import 'src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'src/Features/Presentation/Shared/StateProviders/UserStateProvider.dart';
import 'src/colors/colors.dart';
import 'src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoadingStateProvider()),
        ChangeNotifierProvider(create: (_) => DefaultUserStateProvider()),
        ChangeNotifierProvider(create: (_) => ErrorStateProvider())
      ],
      child: MyAppUserState(),
    );
  }
}

class MyAppUserState extends StatelessWidget with BaseView {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MainCoordinator.sharedInstance?.start(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else {
            Provider.of<DefaultUserStateProvider>(context)
                .fetchUserData(localId: MainCoordinator.sharedInstance?.userUid ?? "");
            return MyApp(initialRoute: snapshot.data);
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class MyApp extends StatelessWidget {
  final String _initialRoute;

  MyApp({required String initialRoute}) : _initialRoute = initialRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: _initialRoute,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: orange,
          appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.black))),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
    );
  }
}
