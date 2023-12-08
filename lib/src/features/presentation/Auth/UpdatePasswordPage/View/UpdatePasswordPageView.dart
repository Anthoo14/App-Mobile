import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Alerts/AlertView/Model/AlertViewModel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Alerts/AlertView/View/AlertView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/BackButtons/BackButtonView/View/BackButtonView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Buttons/RoundedButton/View/RoundedButton.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:flutter/material.dart';
import '../../../../../Colors/colors.dart';
import '../ViewModel/UpdatePasswordViewModel.dart';
import 'Components/TextFormFieldEmail.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpdatePasswordPage extends StatefulWidget {
  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> with BaseView {

  // Dependencies
  final UpdatePasswordViewModel _viewModel;

  _UpdatePasswordPageState({ UpdatePasswordViewModel? updatePasswordViewModel })
      : _viewModel = updatePasswordViewModel ?? DefaultUpdatePasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(builder: (BuildContext context) {
          return const BackButtonView(color: Colors.black);
        }),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const TextView(texto: 'Forgot password', color: accentColor, fontSize: 30.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                    'Please enter your email address. You will receive a link to create a new password via email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0)),
              ),
              TextFormFieldEmailUpdatePassword(viewModel: _viewModel),
              createElevatedButton(
                  labelButton: 'Send',
                  shape: const StadiumBorder(),
                  color: orange,
                  func: () => _ctaButtonTapped(context)),
              SizedBox(height: 8),  // Adjust the spacing as needed
              SvgPicture.asset("assets/pass.svg"),
            ],
          ),
        ),
      ),
    );
  }
}

extension UserActions on _UpdatePasswordPageState {
  void _ctaButtonTapped(BuildContext context) {
    _viewModel.updatePassword(email: _viewModel.email ).then((value) {
      AlertView.showAlertDialog(
          model: AlertViewModel(
              context,
              const AssetImage('assets/lock.png'),
              'Your password has been reset',
              "You'll shortly receive an email with a code to setup a new password.",
              'Done',
              null,
                  () {
                coordinator.showLoginPage(context: context);
              },
              null
          )
      );
    });
  }
}
