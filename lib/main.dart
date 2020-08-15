import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:whatsapp_redesign/screens/index_screen.dart';
import 'package:whatsapp_redesign/screens/splash_screen.dart';
import 'package:whatsapp_redesign/themes/color_library.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'WhatsApp Redesign',
      home: CustomSplashScreen(),
    );
  }
}
