import 'dart:convert';
import 'package:http/http.dart' as http;

class EspecificacionesService {
  Future<String> guardarEspecificaciones(
      String serie,
      String marca,
      String estado,
      int eq,
      int alto,
      int ancho,
      String ram,
      String procesador,
      String memoria,
      String color) async {
    print("API");
    print(
        "http://localhost:8080/api/v1/especificaciones/crear?serie=$serie&marca=$marca&estado=$estado&eq=$eq&dimension_alto=$alto&dimension_ancho=$ancho&ram=$ram&procesador=$procesador&memoria=$memoria&color=$color&Activo_activoo_id=2");
    final response = await http.post(Uri.parse(
        "http://localhost:8080/api/v1/especificaciones/crear?serie=$serie&marca=$marca&estado=$estado&eq=$eq&dimension_alto=$alto&dimension_ancho=$ancho&ram=$ram&procesador=$procesador&memoria=$memoria&color=$color&Activo_activoo_id=2"));
    if (response.statusCode == 200) {
      return "Exito";
    } else {
      throw Exception('Error al guardar las especificaciones');
    }
  }
}
