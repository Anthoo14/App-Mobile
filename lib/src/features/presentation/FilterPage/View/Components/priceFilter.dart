import 'package:flutter/material.dart';
import 'package:flutter_vscode/src/Colors/colors.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  //properties
  RangeValues _values = RangeValues(0, 100);
  int _minPrize = 0;
  int _maxPrize = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '$_minPrize PEN',
          style: TextStyle(fontSize: 16),
        ),
        Container(
          width: 300,
          child: RangeSlider(
            activeColor: naranja,
            inactiveColor: gris,
            values: _values,
            min: 0,
            max: 200.0,
            onChanged: (RangeValues newValues) {
              setState(() {
                _values = newValues;
                _minPrize = _values.start.round();
                _maxPrize = _values.end.round();
              });
            },
          ),
        ),
        Text(
          '$_maxPrize PEN',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
