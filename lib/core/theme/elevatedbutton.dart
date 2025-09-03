import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonTheme(double size) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(size * 1, size * 0.0747),
      disabledBackgroundColor: Colors.grey.shade600,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
