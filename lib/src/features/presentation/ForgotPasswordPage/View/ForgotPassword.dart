import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/alert_dialog.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/back_button.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/headers.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/roundedButton.dart';

class ForgotPassword extends StatelessWidget {
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
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              header_text(
                  texto: "Forgot Password", color: primaryColor, fontSize: 30),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: header_text(
                    texto:
                        "Please enter your email address. You will recive a link to create a new password via email.",
                    color: Colors.black,
                    fontSize: 15),
              ),
              _emailInput(),
              createElevatedButton(
                  labelButton: 'Send',
                  color: naranja,
                  shape: const StadiumBorder(),
                  func: () {
                    _showAlerta(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Widget _emailInput() {
  return Container(
    margin: const EdgeInsets.only(top: 20.0),
    padding: const EdgeInsets.only(left: 10.0),
    decoration: BoxDecoration(
        color: bgInputs, borderRadius: BorderRadius.circular(30.0)),
    child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Your email',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

void _showAlerta(BuildContext context) {
  ShowAlertDialog(
      context,
      AssetImage('assets/lock.png'),
      'Your password has been reset.',
      "You'll  shortly receive an email whith a code to setup a new password.",
      createElevatedButton(
          labelButton: 'Done',
          color: naranja,
          shape: const StadiumBorder(),
          func: () {
            Navigator.pushNamed(context, 'Login');
          }));
}

_goToLoginPage(BuildContext context) {
  Navigator.pushNamed(context, 'Login');
}
