import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/features/presentation/tabs/MyOrdenTab/View/Components/empty_order_view.dart';

import '../../../../../Colors/colors.dart';
import '../../../commons_widgets/Headers/headers.dart';

class MyOrderTab extends StatefulWidget {
  const MyOrderTab({super.key});

  @override
  State<MyOrderTab> createState() => _MyOrderTabState();
}

class _MyOrderTabState extends State<MyOrderTab> {
  @override
  Widget build(BuildContext context) {
    final emptyOrderState = false;

    return Scaffold(
      backgroundColor: bgGrey,
      body: emptyOrderState
          ? EmptyOrderView()
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0.5,
                  leading: Text(''),
                  backgroundColor: blanco,
                  centerTitle: true,
                  title: header_text(
                      texto: 'My Order',
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        _order(context),
                        SizedBox(height: 100),
                        _checkoutResume(context)
                      ],
                    ),
                  )
                ]))
              ],
            ),
    );
  }
}

Widget _order(BuildContext context) {
  return Column(
    children: [_cardOrder(context)],
  );
}

Widget _cardOrder(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(248, 248, 248, 1.0),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(210, 211, 215, 1.0),
              spreadRadius: 1.0,
              blurRadius: 4.0)
        ]),
    child: Column(
      children: [
        Row(
          children: [
            _cardOrderTopContent(),
          ],
        ),
        Column(
          children: [
            _items(context),
            _items(context),
            _items(context),
            _items(context)
          ],
        ),
        _moreContent(context)
      ],
    ),
  );
}

Widget _cardOrderTopContent() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(top: 7.0, bottom: 7.0, right: 20.0),
        child: header_text(
            texto: 'Little Creatures - Club Street',
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on,
              color: gris,
              size: 16.0,
            ),
            header_text(
                texto: '856 Estar underpass',
                color: gris,
                fontWeight: FontWeight.w500,
                fontSize: 14.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              width: 120.0,
              height: 20.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: naranja,
                    elevation: 0.5),
                onPressed: () {},
                child: const Text(
                  'Free Delivery',
                  style: TextStyle(color: Colors.white, fontSize: 11.0),
                ),
              ),
            )
          ],
        ),
      )
    ]),
  );
}

Widget _items(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header_text(
              texto: 'Special Ganaranajd Bhel',
              color: naranja,
              fontWeight: FontWeight.w300,
              fontSize: 15.0),
          header_text(
              texto: 'Mixed vegetables, Chicken Egg',
              color: gris,
              fontWeight: FontWeight.w400,
              fontSize: 12.0)
        ],
      ),
      trailing: header_text(
          texto: '9.50 PEN',
          color: gris,
          fontWeight: FontWeight.w400,
          fontSize: 15.0),
    ),
  );
}

Widget _moreContent(BuildContext context) {
  return Container(
    child: ListTile(
        title: header_text(
            texto: 'Add More Items',
            color: rosa,
            fontWeight: FontWeight.w600,
            fontSize: 17.0)),
  );
}

Widget _checkoutResume(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(vertical: 10),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: blanco,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(210, 211, 215, 1.0),
              spreadRadius: 1.0,
              blurRadius: 4.0)
        ]),
    child: Column(
      children: [
        _itemsCheckoutResume(
            title: 'Subtotal', value: '100.20 PEN', context: context),
        _itemsCheckoutResume(
            title: 'Tax & Fee', value: '4.0 PEN', context: context),
        _itemsCheckoutResume(
            title: 'Delivery', value: 'Free', context: context),
        _buttonCheckout(context)
      ],
    ),
  );
}

Widget _itemsCheckoutResume(
    {required String title,
    required String value,
    required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Theme.of(context).dividerColor))),
    child: ListTile(
      title: header_text(
          texto: title, fontWeight: FontWeight.w400, fontSize: 15.0),
      trailing: header_text(
          texto: value, fontWeight: FontWeight.w400, fontSize: 15.0),
    ),
  );
}

Widget _buttonCheckout(BuildContext context) {
  return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10.0),
      height: 45.0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        width: 120.0,
        height: 20.0,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: naranja,
                elevation: 0.5),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Container(
                  margin: const EdgeInsets.only(left: 50),
                  child: header_text(
                      texto: 'Pedir',
                      fontSize: 17,
                      color: blanco,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  child: header_text(
                      texto: '100.20 PEN',
                      fontSize: 15,
                      color: blanco,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ));
}
