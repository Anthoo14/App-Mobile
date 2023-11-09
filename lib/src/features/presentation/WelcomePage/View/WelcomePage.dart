import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Buttons/roundedButton.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/welcome-img.jpg'))),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 1.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: header_text(
                      texto: 'DELIVERED FAST FOOD\n TO YOUR\n DOOR',
                      color: Colors.white,
                      fontSize: 55.0)),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 30.0),
                child: header_text(
                    texto:
                        'Set exact location to find the right restaurants near you.',
                    color: Colors.white,
                    fontSize: 17.0),
              ),
              createElevatedButton(
                  labelButton: 'Log in',
                  color: naranja,
                  shape: const StadiumBorder(),
                  func: () {
                    Navigator.pushNamed(context, 'Login');
                  }),
              createElevatedButton(
                  labelButton: 'Connect with Google',
                  labelColor: Colors.black,
                  color: Colors.white,
                  isWithIcon: true,
                  shape: const StadiumBorder(),
                  icon: const AssetImage('assets/google.png'),
                  func: () {
                    ;
                  })
            ],
          )
        ],
      ),
    );
  }
}
