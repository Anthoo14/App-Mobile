import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Headers/headers.dart';

import '../../../../../../Colors/colors.dart';

class EmptyOrderView extends StatelessWidget {
  const EmptyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      appBar: AppBar(
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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 216,
                  height: 216,
                  image: AssetImage('assets/emptyOrder.png')),
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: header_text(
                    texto: 'Card Empty',
                    color: gris,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: header_text(
                    texto:
                        'Good food is always cooking! Go ahead, order some yummy items from the menu. ',
                    color: gris,
                    textAlign: TextAlign.center,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
