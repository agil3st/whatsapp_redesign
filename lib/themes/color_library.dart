import 'package:flutter/material.dart';

class ColorLibrary {
  static final Color tealGreen = Color(0xFF128C7E);
  static final Color tealGreenLight = Color(0xFF00ac9b);
  static final Color tealGreenDark = Color(0xFF075E54);
  static final Color lightGreen = Color(0xFF25D366);
  static final Color blue = Color(0xFF34B7F1);
  static final Color teaGreen = Color(0xFFDCF8C6);
  static final Color darkRed = Color(0xFF8d0000);
  static final Color darkYellow = Color(0xFFdeb200);
  static final Color whiteChocolate = Color(0xFFECE5DD);
  static final Color snow = Color(0xFFfafafa);
  static final Color darkBackground = Color(0xFF101d25);
  static final Color darkTabBar = Color(0xFF202a33);
  static final Color semiDark = Color(0xFF777777);
  static final Color lightGrey = Color(0xFFc9c9c9);
  static final Color color1 = Color(0xffe8faf7);
  static final Color color2 = Color(0xFFafe9c6);
  static final Color color3 = Color(0xffefdfef);

  static final LinearGradient baseGradient = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.white, color2],
      stops: [0.5, 1]
  );

  static final BoxShadow baseShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 0,
    blurRadius: 4,
    offset: Offset(0, 4), // changes position of shadow
  );

  static final BoxShadow baseShadowGlow = BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 0,
    blurRadius: 5,
    offset: Offset(0, 20), // changes position of shadow
  );
}