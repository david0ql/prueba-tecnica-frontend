import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/src/routes/routes.dart';
import 'package:prueba_ingreso/src/services/bottom_service.dart';
import 'package:prueba_ingreso/src/theme/theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const AppState());}


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<BottomService>(
        create: (context) => BottomService(),
      )
    ],
    child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba tecnica',
      initialRoute: '/splash',
      routes: MyRoutes.routes,
      theme: MyTheme.myTheme,
    );
  }
}