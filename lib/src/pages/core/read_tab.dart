import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/src/services/bottom_service.dart';

class ReadTab extends StatelessWidget {
  const ReadTab({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              bottomService.currentIndex = 1;
            },
            child: const Text("Ingresar nuevo cliente")),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DataTable2(
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                showBottomBorder: true,
                sortAscending: false,
                columns: const [
                  DataColumn2(label: Text("Documento")),
                  DataColumn2(label: Text("Nombre")),
                  DataColumn2(label: Text("P_Apellido")),
                  DataColumn2(label: Text("S_Apellido")),
                  DataColumn2(label: Text("Direccion")),
                  DataColumn2(label: Text("Telefono")),
                  DataColumn2(label: Text("Correo")),
                  DataColumn2(label: Text("Ciudad")),
                  DataColumn2(label: Text("Condicion Pago")),
                  DataColumn2(label: Text("Valor cupo")),
                  DataColumn2(label: Text("Medio Pago")),
                  DataColumn2(label: Text("Fecha Registro")),
                ],
                rows: bottomService.data),
          ),
        ),
      ],
    );
  }
}
