import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/alert_dialog.dart';
import 'package:flutter_vscode/src/features/presentation/tabs/ExploreTab/View/ExploreTab.dart';
import 'package:flutter_vscode/src/features/presentation/tabs/FavoriteTab/View/FavoriteTab.dart';
import 'package:flutter_vscode/src/features/presentation/tabs/MyOrdenTab/View/MyOrdersTab.dart';
import 'package:flutter_vscode/src/features/presentation/tabs/ProfileTab/View/ProfileTab.dart';

class tabsPage extends StatefulWidget {
  const tabsPage({super.key});

  @override
  State<tabsPage> createState() => _tabsPageState();
}

class _tabsPageState extends State<tabsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _giveLocation(context);
    });
  }

  //Lista de widgets
  List<Widget> _widgetOptions = [
    ExploreTabs(),
    MyOrderTab(),
    FavoriteTab(),
    ProfileTab()
  ];

  int _selectedItemIndex = 0;

//funcion para llamar el index de cada tab
  void _cambiarWidget(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //llamar a los tabs mediante el indice
      body: _widgetOptions.elementAt(_selectedItemIndex),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

//array de icons

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 30.0,
        selectedItemColor: amarillo,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedItemIndex,
        onTap: _cambiarWidget,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'My Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), label: 'Profile')
        ]);
  }
}

Future _giveLocation(BuildContext context) async {
  await ShowAlertDialog(
      context,
      AssetImage('assets/location.png'),
      "Enable Your Location",
      'Pleace allow to use your location to show nearby  restaurant on the map. ',
      _doneButton(context, 'Enable Location'));
}

Widget _doneButton(BuildContext context, String labelBtn) {
  return Container(
    width: 350.0,
    height: 45.0,
    margin: const EdgeInsets.only(top: 30.0),
    child: ElevatedButton(
        onPressed: () {
          print("Habilitar geolocation.");
        },
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(), backgroundColor: naranja, elevation: 0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              labelBtn,
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ],
        )),
  );
}
