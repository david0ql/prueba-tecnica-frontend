import 'dart:convert';

class MediosResponse {
    MediosResponse({
        required this.response,
    });

    List<Medios> response;

    factory MediosResponse.fromJson(String str) => MediosResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MediosResponse.fromMap(Map<String, dynamic> json) => MediosResponse(
        response: List<Medios>.from(json["response"].map((x) => Medios.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "response": List<dynamic>.from(response.map((x) => x.toMap())),
    };
}

class Medios {
    Medios({
      required this.idMedioPago,
      required this.nombre,
    });

    int idMedioPago;
    String nombre;

    factory Medios.fromJson(String str) => Medios.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Medios.fromMap(Map<String, dynamic> json) => Medios(
        idMedioPago: json["id_medio_pago"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "id_medio_pago": idMedioPago,
        "nombre": nombre,
    };
}
