import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';

abstract class Coordinator {
  late List<Coordinator> childCoordinators;
}

abstract class ChildCoordinator {
  late MainCoordinator parentCoordinator;
}