import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Buttons/RoundedButton/View/RoundedButton.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'package:delivery/src/Utils/Helpers/ResultType/ResultType.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import '../../../../../Colors/colors.dart';
import '../ViewModel/WelcomePageViewModel.dart';

class WelcomePage extends StatefulWidget with BaseView {
  WelcomePage({ Key? key }) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with BaseView {

  final WelcomePageViewModel viewModel;

  _WelcomePageState({ WelcomePageViewModel? welcomePageViewModel })
   : viewModel = welcomePageViewModel ?? DefaultWelcomePageViewModel();

  @override
  Widget build(BuildContext context) {

    viewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));

    return viewModel.loadingStatusState.isLoading
        ? loadingView
        : Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/welcome-img.jpg'),
                  )),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
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
                  child: const TextView(
                      texto: 'DELIVERED FAST FOOD\nTO YOUR\nDOOR',
                      color: Colors.white,
                      fontSize: 60.0),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
                  child: const Text(
                      'Set exact location to find the right restaurants near you.',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 17.0)),
                ),
                createElevatedButton(
                    labelButton: 'Log in',
                    color: orange,
                    shape: const StadiumBorder(),
                    func: () {
                      coordinator.showLoginPage(context: context);
                    }),
                createElevatedButton(
                    labelButton: 'Connect with Google',
                    labelColor: Colors.black,
                    color: white,
                    isWithIcon: true,
                    shape: const StadiumBorder(),
                    icon: const AssetImage('assets/google.png'),
                    func: () {
                      googleSignInTapped(context);
                    })
              ],
            )
          ],
        )
    );
  }
}

extension UserActions on _WelcomePageState {
  googleSignInTapped(BuildContext context) {
    viewModel.signInWithGoogle().then((result) {
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