import 'package:flutter/material.dart';
import '../../../../../../Colors/Colors.dart';
import '../../../../Shared/Components/Texts/TextView/View/TextView.dart';

class EmptyOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        elevation: 0.5,
        leading: const Text(''),
        backgroundColor: white,
        title: TextView(
            texto: 'My Order',
            color: ColorScheme.dark().secondary,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  width: 216,
                  height: 216,
                  image: AssetImage('assets/emptyOrder.png')),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: TextView(
                    texto: 'Cart Empty',
                    color: greyColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextView(
                    texto:
                        'Good food is always cooking! Go ahead, order some yummy items from the menu.',
                    textAlign: TextAlign.center,
                    color: greyColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
