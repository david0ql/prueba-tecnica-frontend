// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/src/services/bottom_service.dart';

class CreateTab extends StatefulWidget {
  const CreateTab({super.key});

  @override
  State<CreateTab> createState() => _CreateTabState();
}

class _CreateTabState extends State<CreateTab> {
  late TextEditingController textEditingControllerDocumento =
      TextEditingController();
  late TextEditingController textEditingControllerNombre =
      TextEditingController();
  late TextEditingController textEditingControllerPrimerApellido =
      TextEditingController();
  late TextEditingController textEditingControllerSegundoApellido =
      TextEditingController();
  late TextEditingController textEditingControllerDireccion =
      TextEditingController();
  late TextEditingController textEditingControllerTelefono =
      TextEditingController();
  late TextEditingController textEditingControllerCorreo =
      TextEditingController();
  late TextEditingController textEditingControllerValorCupo =
      TextEditingController();

  String condicionPago = "Selecciona una opcion";
  String ciudad = "Selecciona una opcion";
  String medioPago = "Selecciona una opcion";
  String estado = "Selecciona una opcion";

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return Center(
        child: ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Creacion de usuario"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  const Text("Documento"),
                  TextFormField(
                    controller: textEditingControllerDocumento,
                  ),
                  const Text("Nombre"),
                  TextFormField(
                    controller: textEditingControllerNombre,
                  ),
                  const Text("Primer apellido"),
                  TextFormField(
                    controller: textEditingControllerPrimerApellido,
                  ),
                  const Text("Segundo Apellido"),
                  TextFormField(
                    controller: textEditingControllerSegundoApellido,
                  ),
                  const Text("Direccion"),
                  TextFormField(
                    controller: textEditingControllerDireccion,
                  ),
                  const Text("Ciudad"),
                  DropdownButton(
                    hint: Text(ciudad),
                    items: bottomService.ciudades,
                    onChanged: (value) {
                      ciudad = value;
                    },
                  ),
                  const Text("Condicion pago"),
                  DropdownButton(
                    hint: Text(condicionPago),
                    items: bottomService.condiciones,
                    onChanged: (value) {
                      bottomService.medioPagoCupo = value;
                      condicionPago = value.toString();
                    },
                  ),
                  const Text("Medio pago"),
                  DropdownButton(
                    hint: Text(medioPago),
                    items: bottomService.medios,
                    onChanged: (value) {
                      bottomService.medioPagoCupo = value;
                      medioPago = value.toString();
                    },
                  ),
                  const Text("Estados"),
                  DropdownButton(
                    hint: Text(estado),
                    items: bottomService.estados,
                    onChanged: (value) {
                      estado = value.toString();
                    },
                  ),
                  const Text("Telefono"),
                  TextFormField(
                    controller: textEditingControllerTelefono,
                  ),
                  const Text("Correo"),
                  TextFormField(
                    controller: textEditingControllerCorreo,
                  ),
                  if (bottomService.medioPagoCupo == 1)
                    const Text("Valor cupo"),
                  if (bottomService.medioPagoCupo == 1)
                    TextFormField(
                      controller: textEditingControllerValorCupo,
                    ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    final create = await bottomService.createClient(
                        textEditingControllerCorreo.text,
                        textEditingControllerNombre.text,
                        textEditingControllerPrimerApellido.text,
                        textEditingControllerSegundoApellido.text,
                        textEditingControllerDocumento.text,
                        textEditingControllerTelefono.text,
                        textEditingControllerCorreo.text,
                        ciudad,
                        condicionPago,
                        textEditingControllerValorCupo.text,
                        medioPago,
                        estado);
                    print(create);
                    Navigator.pop(context);
                    if (create == "true") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Pudo crearse'),
                      ));
                      await bottomService.getClientes();
                    } else {
                      textEditingControllerCorreo.text = "";
                      textEditingControllerNombre.text = "";
                      textEditingControllerPrimerApellido.text = "";
                      textEditingControllerSegundoApellido.text = "";
                      textEditingControllerDocumento.text = "";
                      textEditingControllerTelefono.text = "";
                      textEditingControllerCorreo.text = "";
                      ciudad = "";
                      condicionPago = "";
                      textEditingControllerValorCupo.text = "";
                      medioPago = "";
                      estado = "";
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Ya hay un usuario con ese documento'),
                      ));
                    }
                  },
                  child: const Text("Guardar cliente")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Descartar cliente"))
            ],
          ),
        );
      },
      child: const Text("Crear cliente"),
    ));
  }
}
