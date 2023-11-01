import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';
import 'package:flutter_vscode/src/features/presentation/commons_widgets/Buttons/roundedButton.dart';

class CuisinesFilter extends StatefulWidget {
  const CuisinesFilter({super.key});

  @override
  State<CuisinesFilter> createState() => _CuisinesFilterState();
}

class _CuisinesFilterState extends State<CuisinesFilter> {
  bool btnAmerican = false;
  bool btnSushi = false;
  bool btnAsia = false;
  bool btnPizza = false;

  bool btnDesserts = false;
  bool btnFastFood = false;
  bool btnPeruvian = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _roundedButtonFilter(() {
              setState(() => btnAmerican = !btnAmerican);
            }, btnAmerican, 'American'),
            _roundedButtonFilter(() {
              setState(() => btnAsia = !btnAsia);
            }, btnAsia, 'Asia'),
            _roundedButtonFilter(() {
              setState(() => btnSushi = !btnSushi);
            }, btnSushi, 'Sushi'),
            _roundedButtonFilter(() {
              setState(() => btnPizza = !btnPizza);
            }, btnPizza, 'Pizza'),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _roundedButtonFilter(() {
            setState(() => btnDesserts = !btnDesserts);
          }, btnDesserts, 'Desserts'),
          _roundedButtonFilter(() {
            setState(() => btnFastFood = !btnFastFood);
          }, btnFastFood, 'FastFood'),
          _roundedButtonFilter(() {
            setState(() => btnPeruvian = !btnPeruvian);
          }, btnPeruvian, 'Peruvian')
        ])
      ],
    );
  }
}

Widget _roundedButtonFilter(Function()? func, bool isActive, String labelText) {
  return Container(
    width: 160,
    height: 55,
    margin: const EdgeInsets.only(left: 5),
    child: createElevatedButton(
      labelButton: labelText,
      labelColor: isActive ? naranja : gris,
      func: func,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: isActive ? naranja : gris)),
    ),
  );
}
