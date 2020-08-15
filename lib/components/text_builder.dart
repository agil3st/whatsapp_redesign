import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/themes/color_library.dart';

class TextBuilder {

  static write(String value, {
    Color color,
    double size,
    FontWeight weight,
    TextAlign align
  }) {
    return Text(
      value,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
      ),
      textAlign: align,
    );
  }

  static writeAccent(String value, {
    double size,
    FontWeight weight}) {
    return Text(
      value,
      style: TextStyle(
          color: ColorLibrary.whiteChocolate,
          fontSize: size,
          fontWeight: weight
      ),
    );
  }

}