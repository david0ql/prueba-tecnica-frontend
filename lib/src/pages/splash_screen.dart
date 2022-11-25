import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:prueba_ingreso/src/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 4500), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: Center(
        child: Lottie.asset("assets/splash.json"),
      ),
    );
  }
}
