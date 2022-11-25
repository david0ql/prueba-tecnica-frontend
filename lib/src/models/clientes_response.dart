
import 'dart:convert';

class CientesResponse {
    CientesResponse({
        required this.response,
    });

    List<Clientes> response;

    factory CientesResponse.fromJson(String str) => CientesResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CientesResponse.fromMap(Map<String, dynamic> json) => CientesResponse(
        response: List<Clientes>.from(json["response"].map((x) => Clientes.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "response": List<dynamic>.from(response.map((x) => x.toMap())),
    };
}

class Clientes {
    Clientes({
    required this.idCliente,
    required this.documento,
    required this.nombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.direccion,
    required this.telefono,
    required this.correo,
    required this.ciudad,
    required this.idCondicionPago,
    required this.condicionPago,
    required this.valorCupo,
    required this.idMedioPago,
    required this.medioPago,
    required this.estado,
    required this.fechaRegistro,
    });

    int idCliente;
    int documento;
    String nombre;
    String primerApellido;
    String segundoApellido;
    String direccion;
    String telefono;
    String correo;
    String ciudad;
    int idCondicionPago;
    String condicionPago;
    String valorCupo;
    int idMedioPago;
    String medioPago;
    String estado;
    DateTime fechaRegistro;

    factory Clientes.fromJson(String str) => Clientes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Clientes.fromMap(Map<String, dynamic> json) => Clientes(
        idCliente: json["id_cliente"],
        documento: json["documento"],
        nombre: json["nombre"],
        primerApellido: json["primer_apellido"],
        segundoApellido: json["segundo_apellido"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        correo: json["correo"],
        ciudad: json["ciudad"],
        idCondicionPago: json["id_condicion_pago"],
        condicionPago: json["condicion_pago"],
        valorCupo: json["valor_cupo"],
        idMedioPago: json["id_medio_pago"],
        medioPago: json["medio_pago"],
        estado: json["estado"],
        fechaRegistro: DateTime.parse(json["fecha_registro"]),
    );

    Map<String, dynamic> toMap() => {
        "id_cliente": idCliente,
        "documento": documento,
        "nombre": nombre,
        "primer_apellido": primerApellido,
        "segundo_apellido": segundoApellido,
        "direccion": direccion,
        "telefono": telefono,
        "correo": correo,
        "ciudad": ciudad,
        "id_condicion_pago": idCondicionPago,
        "condicion_pago": condicionPago,
        "valor_cupo": valorCupo,
        "id_medio_pago": idMedioPago,
        "medio_pago": medioPago,
        "estado": estado,
        "fecha_registro": fechaRegistro.toIso8601String(),
    };
}
