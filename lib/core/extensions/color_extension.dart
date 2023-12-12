import 'package:flutter/material.dart';

extension HexColor on Color {
  // Extension method to create Color from hex code
  static Color fromHex(String hexString) {
    final int value =
        int.parse(hexString.substring(1, 7), radix: 16) + 0xFF000000;
    return Color(value);
  }
}
