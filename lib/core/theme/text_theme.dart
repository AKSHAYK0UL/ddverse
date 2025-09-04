import 'package:flutter/material.dart';

TextTheme textTheme(double size) {
  return TextTheme(
    titleLarge: TextStyle(
      fontSize: size * 0.0350,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: size * 0.0280,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: size * 0.0240,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: size * 0.0230,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontSize: size * 0.0220,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontSize: size * 0.0200,
    ),
  );
}
