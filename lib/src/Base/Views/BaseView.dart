import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/ErrorStateProvider.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'package:flutter/material.dart';
import 'LoadingView.dart';

mixin BaseView {
  final Widget loadingView = const LoadingView();
  final MainCoordinator coordinator = MainCoordinator();
  final ErrorStateProvider errorStateProvider = ErrorStateProvider();
  BaseViewStateDelegate? viewStateDelegate;
}

mixin BaseViewStateDelegate {
  void onChange();
}

mixin BaseViewModel {
  void initState({ required LoadingStateProvider loadingState });
  // Exposed Properties
  late LoadingStateProvider loadingStatusState;
}
