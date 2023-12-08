import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Presentation/Auth/LoginPage/ViewModel/LoginViewModel.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Buttons/RoundedButton/View/RoundedButton.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/TextFormField/CustomTextFormFields.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../../../../../Colors/colors.dart';

class LoginPage extends StatelessWidget with BaseView  {

  // * Dependencies
  final LoginViewModel _viewModel;

  LoginPage({ LoginViewModel? viewModel }) : _viewModel = viewModel ?? DefaultLoginViewModel();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));

    // * Inicializamos el ViewModel
    _viewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));

    return _viewModel.loadingStatusState.isLoading ? loadingView : Scaffold(
      body: CustomScrollView(
        slivers: [SliverList(delegate: SliverChildListDelegate([
          Column(
            children: [
              Stack(
                children: const [
                  Image(
                      width: double.infinity,
                      height: 500.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'))
                ],
              ),
              Transform.translate(
                offset: const Offset(0.0, -50.0),
                child: Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Form(
                        key: _viewModel.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            const Text("Welcome Back",
                                style: TextStyle(
                                    color: accentColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0)),
                            const Text("Login to you account",
                                style: TextStyle(
                                    color: greyColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0)),
                            const SizedBox(height: 16),
                            CustomTextFormField(delegate: _viewModel,
                                                textFormFieldType: CustomTextFormFieldType.email,
                                                hintext: 'Email'),
                            CustomTextFormField(delegate: _viewModel,
                                                textFormFieldType: CustomTextFormFieldType.password,
                                                hintext: 'Password'),
                            createElevatedButton(
                                color: orange,
                                labelButton: 'Log in',
                                shape: const StadiumBorder(),
                                func: () {
                                  ctaTapped(context);
                                }),
                            Container(
                              margin: const EdgeInsets.only(top: 30.0),
                              child: GestureDetector(
                                onTap: () {
                                   coordinator.showUpdatePasswordPage(context: context);
                                },
                                child: const Text('Forgot you password?',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17.0)),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have an account?",
                                      style: TextStyle(
                                          color: greyColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.0)),
                                  GestureDetector(
                                    onTap: () {
                                      coordinator.showSignUpPage(context: context);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: const Text('Sign up',
                                          style: TextStyle(
                                              color: orange,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15.0)),
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
          )
        ]))],
      ),
    );
  }
}

// Auth Actions
extension UserActions on LoginPage {
  ctaTapped(BuildContext context) {
    if(_viewModel.isFormValidate()) {
      _viewModel.login(email: _viewModel.loginModel?.email ?? '',
                       password: _viewModel.loginModel?.password ?? '').then((result) {
        switch (result.status) {
          case ResultStatus.success:
            coordinator.showTabsPage(context: context);
            break;
          case ResultStatus.error:
            errorStateProvider.setFailure(context: context, value: result.error!);
            break;
        }
      });
    }
  }
}