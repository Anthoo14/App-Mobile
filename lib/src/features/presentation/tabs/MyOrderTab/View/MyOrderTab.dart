import 'package:flutter/material.dart';
import '../../../../../Colors/Colors.dart';
import 'Components/EmptyOrderView.dart';
import 'Components/ListOrder.dart';

class MyOrderTab extends StatefulWidget {
  const MyOrderTab({Key? key}) : super(key: key);

  @override
  _MyOrderTabState createState() => _MyOrderTabState();
}

class _MyOrderTabState extends State<MyOrderTab> {
  final emptyOrderState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgGreyPage,
        body: emptyOrderState
            ? EmptyOrderView()
            : const ListOrdersView());
  }
}

