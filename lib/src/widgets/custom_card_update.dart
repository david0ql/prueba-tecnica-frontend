// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_ingreso/src/services/bottom_service.dart';

import '../models/clientes_response.dart';

class CustomCardUpdate extends StatefulWidget {
  final Clientes cliente;

  const CustomCardUpdate({super.key, required this.cliente});

  @override
  State<CustomCardUpdate> createState() => _CustomCardUpdateState();
}

class _CustomCardUpdateState extends State<CustomCardUpdate> {
  late TextEditingController textEditingControllerDocumento =
      TextEditingController(text: widget.cliente.documento.toString());
  late TextEditingController textEditingControllerNombre =
      TextEditingController(text: widget.cliente.nombre);
  late TextEditingController textEditingControllerPrimerApellido =
      TextEditingController(text: widget.cliente.primerApellido);
  late TextEditingController textEditingControllerSegundoApellido =
      TextEditingController(text: widget.cliente.segundoApellido);
  late TextEditingController textEditingControllerDireccion =
      TextEditingController(text: widget.cliente.direccion);
  late TextEditingController textEditingControllerTelefono =
      TextEditingController(text: widget.cliente.telefono);
  late TextEditingController textEditingControllerCorreo =
      TextEditingController(text: widget.cliente.correo);
  late TextEditingController textEditingControllerCiudad =
      TextEditingController(text: widget.cliente.ciudad);
  late TextEditingController textEditingControllerValorCupo =
      TextEditingController(text: widget.cliente.valorCupo);
  late TextEditingController textEditingControllerEstado =
      TextEditingController(text: widget.cliente.estado);

  @override
  Widget build(BuildContext context) {
    final bottomService = Provider.of<BottomService>(context);
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Estas editando a: ${widget.cliente.nombre}"),
                  content: SingleChildScrollView(
                    child: Column(children: [
                      const Text("Documento"),
                      TextFormField(
                        controller: textEditingControllerDocumento,
                      ),
                      const Text("Nombre"),
                      TextFormField(
                        controller: textEditingControllerNombre,
                      ),
                      const Text("Primer Apellido"),
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
                      const Text("Telefono"),
                      TextFormField(
                        controller: textEditingControllerTelefono,
                      ),
                      const Text("Correo"),
                      TextFormField(
                        controller: textEditingControllerCorreo,
                      ),
                      const Text("Ciudad"),
                      TextFormField(
                        controller: textEditingControllerCiudad,
                      ),
                      const Text("Valor del cupo"),
                      TextFormField(
                        controller: textEditingControllerValorCupo,
                      ),
                      const Text("Estado"),
                      TextFormField(
                        controller: textEditingControllerEstado,
                      ),
                    ]),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () async {
                          final update = await bottomService.updateClient(
                              textEditingControllerDocumento.text,
                              textEditingControllerNombre.text,
                              textEditingControllerPrimerApellido.text,
                              textEditingControllerSegundoApellido.text,
                              textEditingControllerDireccion.text,
                              textEditingControllerTelefono.text,
                              textEditingControllerCorreo.text,
                              textEditingControllerCiudad.text,
                              textEditingControllerValorCupo.text,
                              textEditingControllerEstado.text,
                              widget.cliente.idCliente.toString());
                          Navigator.pop(context);
                          if (update == "true") {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Pudo actualizarse'),
                            ));
                            await bottomService.getClientes();
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Hubo un error'),
                            ));
                          }
                        },
                        child: const Text("Cambiar")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                  ],
                ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Card(
            shape: const StadiumBorder(),
            child: Column(
              children: [
                Text("Documento: ${widget.cliente.documento}"),
                Text("Nombre: ${widget.cliente.nombre}"),
                Text("Telefono: ${widget.cliente.telefono}")
              ],
            )),
      ),
    );
  }
}
