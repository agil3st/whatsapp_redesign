import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:whatsapp_redesign/components/text_builder.dart';
import 'package:whatsapp_redesign/screens/index_screen.dart';
import 'package:whatsapp_redesign/themes/color_library.dart';

class CustomSplashScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new IndexScreen(),
      title: TextBuilder.write(
        'WhatsApp Redesign',
        color: ColorLibrary.darkTabBar.withAlpha(180),
        weight: FontWeight.bold,
        size: 40,
        align: TextAlign.center
      ),
      gradientBackground: ColorLibrary.baseGradient,
      backgroundColor: Colors.white,
      loaderColor: ColorLibrary.tealGreenLight,
    );
  }
}
