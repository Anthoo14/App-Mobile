import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/ForgotPasswordPage/View/Components/TextFormFiledForgotEmail.dart';
import 'package:flutter_vscode/src/features/presentation/ForgotPasswordPage/ViewModel/ForgotPasswordViewModel.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Alerts/alert_dialog.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Buttons/roundedButton.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  //Dependencies
  final ForgotPasswordViewModel _viewModel;
  _ForgotPasswordState({ForgotPasswordViewModel ?viewModel}):
        _viewModel = viewModel ??  DefaultForgotPasswordViewModel();



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
          padding:const EdgeInsets.all(30.0),
          child: Column(
            children: [
              header_text(
                  texto: "Forgot Password", color: primaryColor, fontSize: 40),
              Container(
                padding: const EdgeInsets.all(30.0),
                child: header_text(
                    texto:
                        "Please enter your email address. You will recive a link to create a new password via email.",
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),

              TextFormFieldEmailUpdatePassword(viewModel: _viewModel,),
              createElevatedButton(
                  labelButton: 'Send',
                  color: naranja,
                  shape: const StadiumBorder(),
                  func: () {
                    _ctaBottonTapped(context);
                  }),
              Container(
                margin: const EdgeInsets.only(top: 40),
                width: 500,
                height: 290,
                child: const Image(
                  image: AssetImage('assets/forgot.png'),
                  fit: BoxFit.cover
                  ,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}


extension UserAction on _ForgotPasswordState{
  void _ctaBottonTapped(BuildContext context) {
    _viewModel.updatePassword().then((value) {
      ShowAlertDialog(
          context,
         const AssetImage('assets/lock.png'),
          'Your password has been reset.',
          "You'll  shortly receive an email whith a code to setup a new password.",
          createElevatedButton(
              labelButton: 'Done',
              color: naranja,
              shape: const StadiumBorder(),
              func: () {
                Navigator.pushNamed(context, 'Login');
              }));
    });

  }

}

