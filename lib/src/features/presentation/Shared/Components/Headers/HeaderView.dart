import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  String textHeader;
  String textAction;

  HeaderView({ Key? key,
               required this.textHeader,
               required this.textAction }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: TextView(texto: textHeader, fontSize: 20.0),
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              textAction,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
            ),
            const Icon(Icons.play_arrow)
          ],
        ),
      ],
    );
  }
}
