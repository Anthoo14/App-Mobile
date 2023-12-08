import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Base/Views/BaseView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Alerts/ErrorAlertView/View/ErrorAlertView.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Buttons/RoundedButton/View/RoundedButton.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:flutter/material.dart';
import '../../../Colors/colors.dart';

class ErrorView extends StatelessWidget with BaseView {

  bool isLocationDeniedError = false;
  String assetImagePath = "";
  String errorTitle = "";
  String errorSubTitle = "";

  ErrorView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    setErrorViewData();
    return Scaffold(
      backgroundColor: bgGreyPage,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: getScreenHeight(context: context,
                                                        multiplier: 0.1), bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 216,
                  height: 216,
                  image: AssetImage(assetImagePath)),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: TextView(
                    texto: errorTitle,
                    color: greyColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextView(
                    texto: errorSubTitle,
                    textAlign: TextAlign.center,
                    color: greyColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              createElevatedButton(
                context: context,
                width: 300,
                func: () {
                  if(isLocationDeniedError) {
                    // TODO: Crear feature de añadir dirección de entrega
                  } else {
                    coordinator.showTabsPage(context: context);
                  }
                },
                color: orange,
                labelButton: isLocationDeniedError ? "Establecer dirección de entrega" : "Ir a Inicio",
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }

  setErrorViewData() {
    assetImagePath = isLocationDeniedError ? 'assets/location.png': 'assets/errorIcon.png';
    errorTitle = isLocationDeniedError ? 'Location Denied Error': 'Network Error';
    errorSubTitle = isLocationDeniedError ? 'Something bad happened, Without your current location, the app cannot continue to work properly. \n\n You can order anything, just indicate in which direction'
                                          : 'Something bad happened, the app cannot continue to work properly.';
  }
}
