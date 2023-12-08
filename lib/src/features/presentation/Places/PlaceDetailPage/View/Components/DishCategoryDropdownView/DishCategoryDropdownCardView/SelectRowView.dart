import 'package:delivery/src/Utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../Colors/colors.dart';

class SelectRowView extends StatefulWidget {
  bool isSelected = false;

  SelectRowView({ Key? key,
                  required this.isSelected }) : super(key: key);

  @override
  State<SelectRowView> createState() => _SelectRowViewState();
}

class _SelectRowViewState extends State<SelectRowView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Divider(),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FirstRow(quantity: 1, dishPrice: 9.25)),
        Container(
            margin: const EdgeInsets.only(top: 6),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SecondRow(dishName: "Durum Al Horno",
                dishAdditionalItems: "Pollo, Durum al Horno(solo carne), Salsa blanca")),
        ThirdRow()
      ],
    );
  }
}

class FirstRow extends StatelessWidget {
  final int quantity;

  final double dishPrice;

  FirstRow({ Key? key,
             required this.quantity,
             required this.dishPrice }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${dishPrice} €",
            style: const TextStyle(color: Colors.black,
                                   fontSize: 14,
                                   fontWeight: FontWeight.w500)),
        Text("${quantity}x",
            style: const TextStyle(color: Colors.black,
                                   fontSize: 14,
                                   fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class SecondRow extends StatelessWidget {
  final String dishName;
  final String dishAdditionalItems;

  SecondRow({ Key? key,
              required this.dishName,
              required this.dishAdditionalItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dishName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
        Container(
          width: getScreenWidth(context: context),
          margin: const EdgeInsets.only(top: 5),
          child: Text(dishAdditionalItems,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w400,
                                     fontSize: 15,
                                     color: Colors.black87)),
        )
      ],
    );
  }
}

class ThirdRow extends StatelessWidget {

  ThirdRow({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: const Icon(
              Icons.remove_circle,
              color:  orange,
              size: 24,
            ),
            onPressed: () {}),
        IconButton(
           // padding: const EdgeInsets.only(left:24, right: 0),
            icon: const Icon(
              Icons.add_circle,
              color:  orange,
              size: 24,
            ),
            onPressed: () {})
      ],
    );
  }
}

