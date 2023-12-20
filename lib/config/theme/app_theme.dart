import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // Propiedades del tema claro
    scaffoldBackgroundColor: Colors.orange[50],

  );

  static ThemeData darkTheme = ThemeData(
    // Propiedades del tema oscuro
    scaffoldBackgroundColor: const Color.fromARGB(255, 56, 55, 55),

  );
}
