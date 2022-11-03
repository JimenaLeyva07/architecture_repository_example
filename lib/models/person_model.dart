import 'dart:convert';

PersonModel personModelFromJson(String str) => PersonModel.fromJson(json.decode(str));

String personModelToJson(PersonModel data) => json.encode(data.toJson());

class PersonModel {
    PersonModel({
        required this.nombre,
        required this.edad
    });

    String nombre;
    int edad;

    factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        nombre: json["nombre"],
        edad: json["edad"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "edad": edad,
    };
}
