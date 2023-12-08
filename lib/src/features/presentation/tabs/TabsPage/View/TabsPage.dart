import 'package:delivery/src/Features/Presentation/Shared/StateProviders/LoadingStateProvider.dart';
import 'package:delivery/src/Features/Presentation/Shared/StateProviders/UserStateProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Base/Views/BaseView.dart';
import '../../../../../Colors/Colors.dart';
import '../../../../../Services/GeolocationService/Entities/GeoServiceEntities.dart';
import '../../../../../Utils/Helpers/ResultType/ResultType.dart';
import '../../../Shared/Components/Alerts/AlertView/Model/AlertViewModel.dart';
import '../../../Shared/Components/Alerts/AlertView/View/AlertView.dart';
import '../../ExploreTab/View/ExploreTab.dart';
import '../../FavouriteTab/View/FavouriteTab.dart';
import '../../MyOrderTab/View/MyOrderTab.dart';
import '../../ProfileTab/View/ProfileTab.dart';
import '../ViewModel/TabsViewModel.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({ Key? key }) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with BaseView {

  // Dependencies
  final TabsViewModel _viewModel;
  _TabsPageState({ TabsViewModel? tabsViewModel}) : _viewModel = tabsViewModel ?? DefaultTabsViewModel();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      _viewModel.loadingStatusState.setLoadingState(isLoading: true);
      final LocationPermissionStatus currentStatus = await _viewModel.getPermissionStatus();
      switch (currentStatus) {
        case LocationPermissionStatus.denied:
          _getCurrentPosition(context);
          break;
        default:
          _viewModel.loadingStatusState.setLoadingState(isLoading: false);
          break;
      }
    });
  }

  final List<Widget> _widgetOptions = [
    const ExploreTab(),
    const MyOrderTab(),
    const FavouriteTab(),
    const ProfileTab()
  ];

  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Init ViewModel
    _viewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));
    (context).getUserData();

    return _viewModel.loadingStatusState.isLoading ? loadingView : Scaffold(
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }
}

extension PrivateMethods on _TabsPageState {
  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 30.0,
        selectedItemColor: orange,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedItemIndex,
        onTap: _changeTab,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'My Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: 'Profile')
        ]);
  }

  Future _getCurrentPosition(BuildContext context) async {
    AlertView.showAlertDialog(model: AlertViewModel(
            context,
            const AssetImage('assets/location.png'),
            'Enable Your Location',
            "Please allow to use your location to show nearby restaurant on the map.",
            'Enable Your Location',
            "Por el momento no quiero",
                () {
                  _closeAlertDialog(context);
                  // Cta Action
                  _viewModel.getCurrentPosition().then( (result) {
                    switch (result.status) {
                      case ResultStatus.success:
                        _viewModel.loadingStatusState.setLoadingState(isLoading: false);
                        break;
                      case ResultStatus.error:
                        errorStateProvider.setFailure(context: context, value: result.error!);
                        break;
                    }
                  });
            },  () {
                // Cancel Action
                _closeAlertDialog(context);
            })
    );
  }

  _closeAlertDialog(BuildContext context) {
    Navigator.pop(context);
  }
}

extension UserActions on _TabsPageState {
  void _changeTab(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }
}
