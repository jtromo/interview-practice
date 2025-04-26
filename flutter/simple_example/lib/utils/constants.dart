import 'package:flutter/material.dart';

Color cardTextColor = Colors.black;
Color cardSubtextColor = Colors.black54;

Color cardBackgroundColor = Colors.lightBlue.shade100;
Color cardShadowColor = Colors.black;

const cardShadow = BoxDecoration(
  boxShadow: [
    BoxShadow(color: Color.fromRGBO(200, 200, 200, .4), blurRadius: 10.0, offset: Offset(10, 10)),
  ],
);
double roundedCornerRadius = 10;

double minPercentDecimalValue = 0.02;
double maxPercentDecimalValue = 0.99;
