import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/src/models/clientes_response.dart';
import 'package:prueba_ingreso/src/services/bottom_service.dart';
import 'package:prueba_ingreso/src/widgets/custom_card_update.dart';

class UpdateTab extends StatelessWidget {
  const UpdateTab({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return ListView.builder(
      itemCount: bottomService.clientes.length,
      itemBuilder: (BuildContext context, int index) {
        final Clientes cliente = bottomService.clientes[index];
        return CustomCardUpdate(
          cliente: cliente,
        );
      },
    );
  }
}
