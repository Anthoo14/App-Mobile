

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_vscode/src/features/presentation/StateProviders/ErrorStateProvider.dart';
import 'package:flutter_vscode/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:flutter_vscode/src/routers/routers.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> ErrorStateProvider()),
      ChangeNotifierProvider(create: (_)=> LoadingStateProvider()),
    ],
    child: MyApp(),);
  }
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: 'Welcome',
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

      ],
      theme: ThemeData(
        primaryColor: Color.fromRGBO(10, 31, 68, 1.0),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme:  AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color.fromRGBO(102, 51, 0, 1),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromRGBO(0, 122, 255, 1.0),
        ),
      ),
    );
  }
}
