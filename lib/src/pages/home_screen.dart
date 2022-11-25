import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/src/pages/core/core.dart';
import 'package:prueba_ingreso/src/services/bottom_service.dart';
import 'package:prueba_ingreso/src/theme/theme.dart';
import 'package:prueba_ingreso/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      appBar: AppBar(
      title: const Text("Clientes"),
      centerTitle: true, 
      elevation: 0,
      ),
      body: const HomeSwitch(),
      bottomNavigationBar: const CustomBottomNavigation(),
      );
  }
}

class HomeSwitch extends StatelessWidget {
  const HomeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    switch (bottomService.currentIndex) {
      case 0:
        return const ReadTab();
      case 1:
        return const CreateTab();
      case 2:
        return const UpdateTab();
      default:
        return const ReadTab();
    }
  }
}