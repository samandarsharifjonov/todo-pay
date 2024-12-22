import 'package:flutter/material.dart';

double height = 1, width = 1, arif = 1;

extension ExtSize on num {
  double get h => this * height;
  double get w => this * width;
  double get o => this * arif;
}

Widget sizeVer(double height) => SizedBox(height: height);
Widget sizeHor(double width) => SizedBox(width: width);
