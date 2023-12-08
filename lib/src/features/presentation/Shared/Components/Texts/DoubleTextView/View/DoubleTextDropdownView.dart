import 'package:delivery/src/Features/Presentation/Shared/Components/Texts/TextView/View/TextView.dart';
import 'package:flutter/material.dart';
import '../../../../../../../Colors/colors.dart';

mixin DoubleTextDropdownViewDelegate {
  dropDownTapped({ required bool isExpanded });
}

class DoubleTextDropdownView extends StatefulWidget {
  final String header;
  final String dropdownRightText;
  final Function()? textActionTapped;
  bool isExpanded;
  DoubleTextDropdownViewDelegate? delegate;

  DoubleTextDropdownView({
    required this.header,
    required this.dropdownRightText,
    required this.isExpanded,
    this.textActionTapped,
    this.delegate
  });

  @override
  State<DoubleTextDropdownView> createState() => _DoubleTextDropdownViewState();
}

class _DoubleTextDropdownViewState extends State<DoubleTextDropdownView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(texto: widget.header,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            Transform.translate(
              offset: const Offset(20, 0),
              child: Row(
                children: [
                  Text(widget.dropdownRightText, style: const TextStyle(color: greyColor)),
                  IconButton(onPressed: () {
                    setState(() {
                      widget.isExpanded = !widget.isExpanded;
                      widget.delegate?.dropDownTapped(isExpanded: widget.isExpanded);
                    });
                  }, icon: Icon(widget.isExpanded
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                      color: greyColor)),
                ],
              ),
            )
          ],
        ),
        const Divider()
      ],
    );
  }
}