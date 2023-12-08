import 'package:delivery/src/Base/AppError/AppError.dart';
import 'package:delivery/src/Features/Presentation/Shared/Components/Alerts/ErrorAlertView/View/ErrorAlertView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

mixin ErrorStateProviderDelegate {
  void setFailure({required BuildContext context, required Failure value});
  void showErrorAlert({ required BuildContext context, required String message });
}

class ErrorStateProvider extends ChangeNotifier with ErrorStateProviderDelegate {
  late Failure _failure;

  @override
  void setFailure({ required BuildContext context,
                    required Failure value }) {
    _failure = value;
    showErrorAlert(context: context, message: _failure.toString());
    notifyListeners();
  }

  @override
  showErrorAlert({ required BuildContext context, required String message }) {
    ErrorAlertView.showErrorAlertDialog(
        context: context,
        subTitle: message,
        ctaButtonAction: () {
          Navigator.pop(context);
    });
  }
}

extension ErrorStateProviderExtension on BuildContext {
  showErrorAlert({ required BuildContext context, required String message }) => Provider.of<ErrorStateProvider>(this, listen: false).showErrorAlert(context: context, message: message);
}