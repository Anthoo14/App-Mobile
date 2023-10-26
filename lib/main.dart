import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/routers/routers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: 'Welcome',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(10, 31, 68, 1.0),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
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
