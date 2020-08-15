import 'package:flutter/cupertino.dart';

class SizeController {
  static final double defaultPadding = 25;

  static Size getCurrentSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}