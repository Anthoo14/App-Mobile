import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vscode/src/Base/Views/BaseView.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/LoginPage/ViewModel/LoginViewModel.dart';
import 'package:flutter_vscode/src/features/presentation/StateProviders/LoadingStateProvider.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/BackButtons/back_button.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Buttons/roundedButton.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/TextFormFields/CustomTextFormField.dart';
import 'package:flutter_vscode/src/utils/Helpers/ResultType/ResultType.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget with BaseView {
  // Dependencies
  final LoginViewModel _viewModel;

  LoginPage({LoginViewModel? viewModel}) : _viewModel = viewModel ?? DefaultLoginViewModel();

  @override
  Widget build(BuildContext context) {
    // Init ViewModel
    _viewModel.initState(loadingStateProvider: Provider.of<LoadingStateProvider>(context));

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ));

    return _viewModel.loadingState.isLoading
        ? loadingView
        : Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                 const Stack(
                    children: [
                       Image(
                        width: double.infinity,
                        height: 500,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/imageWelcome.jpg'),
                      ),

                    ],
                  ),
                  Transform.translate(
                    offset: const Offset(0.0, -40.0),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Center(
                          child: Form(
                            key: _viewModel.formKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                header_text(
                                  texto: "Welcome back",
                                  color: primaryColor,
                                  fontSize: 30,
                                ),
                                header_text(
                                  texto: "Login to your account",
                                  color: gris,
                                  fontSize: 15,
                                ),
                                const SizedBox(height: 16),
                                CustomTextFormField(
                                  textFormFieldType: CustomTextFormFieldType.email,
                                  hintext: 'Email',
                                  delegate: _viewModel,
                                ),
                                CustomTextFormField(
                                  textFormFieldType: CustomTextFormFieldType.password,
                                  hintext: 'Password',
                                  delegate: _viewModel,
                                ),
                                createElevatedButton(
                                  labelButton: 'Log in',
                                  color: naranja,
                                  shape: const StadiumBorder(),
                                  func: () {
                                    _ctaButtonTapped(context);
                                  },
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 30.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, 'ForgotPass');
                                    },
                                    child: header_text(
                                      texto: "Forgot your password?  ",
                                      color: Colors.black,
                                      fontSize: 17.0,
                                    ),
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
                                        fontSize: 15.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, 'CreateAccount');
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: header_text(
                                            texto: "Sign up ",
                                            color: naranja,
                                            fontSize: 15.0,
                                          ),
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
                    ),
                  )
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}





extension UserActions on LoginPage{
  void _ctaButtonTapped(BuildContext context){
    if(_viewModel.isFormValidate()){
      _viewModel.login(email: _viewModel.loginModel?.email ?? "", password: _viewModel.loginModel?.password ?? "").then((result) {
        switch(result.status){

          case ResultStatus.success:
            Navigator.pushNamed(context, 'Tabs');
          case ResultStatus.error:

            errorStateProvider.setFailure(context: context, value: result.error!);
          break;}

      });
    }

  }
}