import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prueba_ingreso/src/models/clientes_response.dart';
import 'package:prueba_ingreso/src/models/condiciones_response.dart';
import 'package:prueba_ingreso/src/models/medios_response.dart';
import 'package:http/http.dart' as http;

class BottomService with ChangeNotifier {
  BottomService() {
    getMedios();
    getCondiciones();
    getClientes();
    getCiudades();
  }

  //Url base
  final String _baseUrl = "192.168.1.52";

  //Arreglos de datos
  List<Clientes> clientes = [];
  List<DropdownMenuItem> medios = [];
  List<DropdownMenuItem> condiciones = [];
  List<DropdownMenuItem> ciudades = [];
  List<DropdownMenuItem> estados = [];
  List<DataRow> data = [];
  //Menu donde se encuentra el usuario
  int _currentIndex = 0;

  //Getters y Setters
  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  //Mostrar medio de pago y no valor cupo
  int _medioPagoCupo = 1;

  //Getters y Setters
  int get medioPagoCupo => _medioPagoCupo;

  set medioPagoCupo(int value) {
    _medioPagoCupo = value;
    notifyListeners();
  }

  //Llenar valor cupo pero no medio de pago
  int _valorCupoPago = 0;

  //Getters y Setters
  int get valorCupoPago => _valorCupoPago;

  set valorCupoPago(int value) {
    _valorCupoPago = value;
    notifyListeners();
  }

  //Metodos para obtener los datos antes de iniciar el Splash

  Future<void> getMedios() async {
    medios.clear();
    final httpRequest = await http.get(Uri.http(_baseUrl,
        '/proyecto/endpoints/medios_pago/medios_pago.controller.php'));
    final mediosResponse = MediosResponse.fromJson(httpRequest.body).response;
    for (var element in mediosResponse) {
      final drop = DropdownMenuItem(
        value: element.idMedioPago,
        child: Text(element.nombre),
      );
      medios.add(drop);
    }
  }

  Future<void> getCiudades() async {
    const drop1 = DropdownMenuItem(
      value: "Bucaramanga",
      child: Text("Bucaramanga"),
    );
    const drop2 = DropdownMenuItem(
      value: "Piedecuesta",
      child: Text("Piedecuesta"),
    );
    const drop3 = DropdownMenuItem(
      value: "Floridablanca",
      child: Text("Floridablanca"),
    );
    const drop4 = DropdownMenuItem(
      value: "Girón",
      child: Text("Girón"),
    );

    const drop5 = DropdownMenuItem(
      value: "1",
      child: Text("Activo"),
    );
    const drop6 = DropdownMenuItem(
      value: "0",
      child: Text("Inactivo"),
    );

    estados.add(drop5);
    estados.add(drop6);
    ciudades.add(drop1);
    ciudades.add(drop2);
    ciudades.add(drop3);
    ciudades.add(drop4);
  }

  Future<void> getClientes() async {
    clientes.clear();
    final httpRequest = await http.get(Uri.http(
        _baseUrl, '/proyecto/endpoints/clientes/clientes.controller.php'));
    final clentesResponse = CientesResponse.fromJson(httpRequest.body).response;
    data = List<DataRow>.generate(
        clentesResponse.length,
        (index) => DataRow(cells: [
              DataCell(Text(clentesResponse[index].documento.toString())),
              DataCell(Text(clentesResponse[index].nombre)),
              DataCell(Text(clentesResponse[index].primerApellido)),
              DataCell(Text(clentesResponse[index].segundoApellido)),
              DataCell(Text(clentesResponse[index].direccion)),
              DataCell(Text(clentesResponse[index].telefono)),
              DataCell(Text(clentesResponse[index].correo)),
              DataCell(Text(clentesResponse[index].ciudad)),
              DataCell(Text(clentesResponse[index].condicionPago)),
              DataCell(Text(clentesResponse[index].valorCupo)),
              DataCell(Text(clentesResponse[index].medioPago)),
              DataCell(Text(clentesResponse[index].fechaRegistro.toString())),
            ]));
    for (var element in clentesResponse) {
      clientes.add(element);
    }
    notifyListeners();
  }

  Future<void> getCondiciones() async {
    condiciones.clear();
    final httpRequest = await http.get(Uri.http(_baseUrl,
        '/proyecto/endpoints/condiciones_pago/condiciones_pago.controller.php'));
    final condicionesResponse =
        CondicionesResponse.fromJson(httpRequest.body).response;
    for (var element in condicionesResponse) {
      final drop = DropdownMenuItem(
        value: element.idCondicionPago,
        child: Text(element.nombre),
      );
      condiciones.add(drop);
    }
  }

  Future<String> updateClient(
      String documento,
      String nombre,
      String primerApellido,
      String segundoApellido,
      String direccion,
      String telefono,
      String correo,
      String ciudad,
      String valorCupo,
      String estado,
      String idCliente) async {
    final Map<String, dynamic> map = {
      "documento": documento,
      "nombre": nombre,
      "primer_apellido": primerApellido,
      "segundo_apellido": segundoApellido,
      "direccion": direccion,
      "telefono": telefono,
      "correo": correo,
      "ciudad": ciudad,
      "valor_cupo": valorCupo,
      "estado": estado,
      "id_cliente": idCliente
    };
    final body = json.encode(map);
    final httpRequest = await http.put(
      Uri.http(
          _baseUrl, '/proyecto/endpoints/clientes/clientes.controller.php'),
      body: body,
    );
    return httpRequest.body;
  }

  Future<String> createClient(
    String documento,
    String nombre,
    String primerApellido,
    String segundoApellido,
    String direccion,
    String telefono,
    String correo,
    String ciudad,
    String idEdicionPago,
    String valorCupo,
    String idMedioPago,
    String estado,
  ) async {
    final Map<String, dynamic> map = {
      "documento": documento.trim(),
      "nombre": nombre.trim(),
      "primer_apellido": primerApellido.trim(),
      "segundo_apellido": segundoApellido.trim(),
      "direccion": direccion.trim(),
      "telefono": telefono.trim(),
      "correo": correo.trim(),
      "ciudad": ciudad.trim(),
      "id_condicion_pago": idEdicionPago.trim(),
      "valor_cupo": valorCupo.trim(),
      "id_medio_pago": idMedioPago.trim(),
      "estado": estado.trim(),
    };
    print(map);
    final body = json.encode(map);
    final httpRequest = await http.post(
      Uri.http(
          _baseUrl, '/proyecto/endpoints/clientes/clientes.controller.php'),
      body: body,
    );
    return httpRequest.body;
  }
}
