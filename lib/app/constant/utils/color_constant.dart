import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstant {
  //Splash
  static Color backgroundColorBlackS = fromHex('#1E1E1E');
  static Color appNameColor = fromHex('#FFE4F3');

  //Home
  static Color backgroundColorBlackH = fromHex('#000000');
  static Color menuAndSearchColor = fromHex('#191919');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
