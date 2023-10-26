import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
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
