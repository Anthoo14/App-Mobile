import 'package:flutter/material.dart';

//public extension
double screenWidth = 0.0;
double screenHeight = 0.0;

extension ScreenSize on double {
  double getsScreenWidth(
      {required BuildContext context, double mutiplier = 0.0}) {
    var width = MediaQuery.of(context).size.width;
    if (mutiplier != 0.0) {
      width = width * mutiplier;
    }

    return width;
  }

  double getsScreenHeight(
      {required BuildContext context, double mutiplier = 0.0}) {
    var height = MediaQuery.of(context).size.height;
    if (mutiplier != 0.0) {
      height = height * mutiplier;
    }
    return height;
  }
}
