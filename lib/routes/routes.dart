import 'package:flutter/material.dart';

// Routes
import 'package:bottom_provider/screens/bottom_nav_screen.dart';
import 'package:bottom_provider/screens/intro_screen.dart';
import 'package:bottom_provider/screens/splash_screen.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String splash = '/splash';
  static const String intro = '/intro';
  static const String bottom = '/bottom';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashScreen(),
    intro: (BuildContext context) => const IntroScreen(),
    bottom: (BuildContext context) => const BottomNavigationScreen(),
  };
}
