import 'package:delivery/src/Features/Presentation/Shared/MainCoordinator/MainCoordinator.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/UserStateProvider.dart';
import 'package:delivery/src/Features/Presentation/Tabs/ProfileTab/View/Components/ProfileTabHeader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Base/Views/BaseView.dart';
import '../../../Shared/Components/Alerts/AlertView/Model/AlertViewModel.dart';
import '../../../Shared/Components/Alerts/AlertView/View/AlertView.dart';
import '../ViewModel/ProfileTabViewModel.dart';
import 'Components/ProfileTabContentView.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with BaseView {

  // ViewModel
  final ProfileTabViewModel _profileTabViewModel = DefaultProfileTabViewModel();

  @override
  Widget build(BuildContext context) {

    // Init ViewModel
    _profileTabViewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));
    Provider.of<DefaultUserStateProvider>(context).fetchUserData(localId: MainCoordinator.sharedInstance?.userUid ?? "");

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverList(delegate: SliverChildListDelegate([
          Column(
            children: [
              const ProfileTabHeaderView(),
              ProfileTabContentView(viewModel: _profileTabViewModel)
            ],
          )
        ]))
      ],
    ));
  }
}

extension UserActions on _ProfileTabState {
  void signOut(BuildContext context) {
    AlertView.showAlertDialog(
      model: AlertViewModel(
        context,
        const AssetImage('assets/logout.png'),
        'Cierre de sesión en curso',
        "¿Desear salir de la sesión actual?",
        'Cerrar sesión',
        "Cancelar",
            () async {
          // Asegúrate de que _profileTabViewModel está inicializado.
          if (_profileTabViewModel != null) {
            await _profileTabViewModel.signOut();
            coordinator.logoutNavigation(context: context);
          } else {
            print("Error: _profileTabViewModel no inicializado.");
            // Manejar el caso en el que _profileTabViewModel no está inicializado.
          }
        },
            () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
