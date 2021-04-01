import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor purpleNavy = MaterialColor(
      _purpleNavyHEX,
      <int, Color>{
        50: Color(0xFF8080B3),
        100: Color(0xFF7373AB),
        200: Color(0xFF6666A3),
        300: Color(0xFF5C5C99),
        400: Color(0xFF54548C),
        500: Color(_purpleNavyHEX),
        600: Color(0xFF454573),
        700: Color(0xFF3D3D66),
        800: Color(0xFF363659),
        900: Color(0xFF2E2E4D),
      }
  );
  static const _purpleNavyHEX = 0xFF484877;

}
