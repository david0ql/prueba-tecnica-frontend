import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/src/services/bottom_service.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.data_array), label: 'Resumen'),
      BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Creacion'),
      BottomNavigationBarItem(icon: Icon(Icons.change_circle), label: 'Edicion'),
    ],
    currentIndex: bottomService.currentIndex,
    onTap: (value) {
      bottomService.currentIndex = value;
    },
    );
  }
}