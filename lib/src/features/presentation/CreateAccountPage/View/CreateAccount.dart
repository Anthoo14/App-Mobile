import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/back_button.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/headers.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/roundedButton.dart';

class CreateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return backButtton(context, Colors.black);
        }),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                header_text(
                    texto: "Create an Account",
                    color: primaryColor,
                    fontSize: 30),
                _usernameInput(context),
                _emailInput(context),
                _phoneInput(context),
                _dateOfBirth(context),
                _passwordInput(context),
                createElevatedButton(
                    labelButton: 'Sing Up',
                    color: naranja,
                    shape: const StadiumBorder(),
                    func: () {
                      Navigator.pushNamed(context, 'Login');
                    }),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 40.0),
                  child: const Text(
                    'By Clicking Sign Up you agree to the following Terms and Conditions whitout ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _usernameInput(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20.0),
    margin: EdgeInsets.only(top: 40.0),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: const TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Username',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _emailInput(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20.0),
    margin: EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _phoneInput(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20.0),
    margin: EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: const TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: 'Phone',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _dateOfBirth(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20.0),
    margin: EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: const TextField(
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
          hintText: 'Date of Birth',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _passwordInput(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20.0),
    margin: EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
      color: bgInputs,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: const TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _sinUpButton(BuildContext context) {
  return Container(
    width: 370.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 40.0),
    child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            elevation: 0.5),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ],
        )),
  );
}
