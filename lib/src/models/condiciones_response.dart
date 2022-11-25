import 'dart:convert';

class CondicionesResponse {
    CondicionesResponse({
        required this.response,
    });

    List<Condiciones> response;

    factory CondicionesResponse.fromJson(String str) => CondicionesResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CondicionesResponse.fromMap(Map<String, dynamic> json) => CondicionesResponse(
        response: List<Condiciones>.from(json["response"].map((x) => Condiciones.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "response": List<dynamic>.from(response.map((x) => x.toMap())),
    };
}

class Condiciones {
    Condiciones({
        required this.idCondicionPago,
        required this.nombre,
    });

    int idCondicionPago;
    String nombre;

    factory Condiciones.fromJson(String str) => Condiciones.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Condiciones.fromMap(Map<String, dynamic> json) => Condiciones(
        idCondicionPago: json["id_condicion_pago"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "id_condicion_pago": idCondicionPago,
        "nombre": nombre,
    };
}
