import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';
import '../../../../../../Colors/colors.dart';

class FABRoundedRectangleView extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final bool isHidden;
  final ShapeBorder? shape;

  FABRoundedRectangleView({ Key? key,
                            required this.text,
                            this.backgroundColor = orange,
                            this.shape = const StadiumBorder(),
                            required this.onPressed,
                            required this.isHidden })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isHidden ? Container()
        : FloatingActionButton.extended(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        shape: shape,
        label: TextView(
            texto: text,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16));
  }
}
