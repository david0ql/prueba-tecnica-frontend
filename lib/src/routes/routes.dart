import 'package:flutter/material.dart';
import 'package:prueba_ingreso/src/pages/pages.dart';
class MyRoutes{
  static Map<String, Widget Function(BuildContext)> routes ={
    '/splash': (p0) => const SplashScreen(),
    '/home' : (p0) => const HomeScreen()
  };
}