import 'package:flutter/material.dart';

AppBarTheme appBarTheme(double size) {
  return AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontSize: size * 0.0350,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}
