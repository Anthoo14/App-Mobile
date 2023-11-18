import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Buttons/roundedButton.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return Scaffold(
      body: CustomScrollView(
       slivers: [
         SliverList(delegate: SliverChildListDelegate(
           [Column(
             children: [
               Stack(
                 children: [
                   const Image(
                       width: double.infinity,
                       height: 320.0,
                       fit: BoxFit.cover,
                       image: AssetImage('assets/imageWelcome.jpg')),
                   Container(
                     margin: const EdgeInsets.only(top: 30.0),
                     child: backButtton(context, Colors.white),
                   ),
                 ],
               ),
               Transform.translate(
                 offset: const Offset(0.0, -20.0),
                 child: Container(
                   width: double.infinity,
                   height: 400,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(20.0),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(25.0),
                     child: Center(
                       child: Column(
                         children: [
                           header_text(
                               texto: "Welcome back",
                               color: primaryColor,
                               fontSize: 35),
                           header_text(
                               texto: "Login to you account",
                               color: gris,
                               fontSize: 15),
                           _emailInput(),
                           _passwordInput(),
                           createElevatedButton(
                               labelButton: 'Log in',
                               color: naranja,
                               shape: const StadiumBorder(),
                               func: () {
                                 Navigator.pushNamed(context, 'Tabs');
                               }),
                           Container(
                             margin: const EdgeInsets.only(top: 40.0),
                             child: GestureDetector(
                               onTap: () {
                                 Navigator.pushNamed(context, 'ForgotPass');
                               },
                               child: header_text(
                                   texto: "Forgot your password?  ",
                                   color: Colors.black,
                                   fontSize: 17.0),
                             ),
                           ),
                           Container(
                             margin: const EdgeInsets.only(top: 7.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 header_text(
                                     texto: "Don't have an account?  ",
                                     color: gris,
                                     fontSize: 15.0),
                                 GestureDetector(
                                   onTap: () {
                                     Navigator.pushNamed(context, 'CreateAccount');
                                   },
                                   child: Container(
                                     child: header_text(
                                         texto: "Sign up ",
                                         color: naranja,
                                         fontSize: 15.0),
                                   ),
                                 )
                               ],
                             ),
                           )
                         ],
                       ),
                     ),
                   ),
                 ),
               )
             ],
           ),]
         ))
       ],
      ),
    );
  }
}

Widget _emailInput() {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    padding: const EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput() {
  return Container(
    margin: const EdgeInsets.only(top: 16.0),
    padding: const EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}


/*
Widget _loginButton(BuildContext context) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Tabs');
        },
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(), backgroundColor: naranja, elevation: 0.5),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log in',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ],
        )),
  );
}
*/