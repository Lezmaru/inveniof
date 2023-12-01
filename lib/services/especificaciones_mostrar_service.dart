import 'dart:convert';
import 'package:http/http.dart' as http;

class EspecificacionesMostrarService {
  Future<Map<String, dynamic>> obtenerEspecificacionesPorActivoId(
      int activoId) async {
    final response = await http.get(Uri.parse(
        'http://localhost:8080/api/v1/especificaciones/obtenerPorActivoId/$activoId'));

    if (response.statusCode == 200) {
      // Si el servidor devuelve una respuesta OK, parseamos el resultado
      return jsonDecode(response.body);
    } else {
      // Si la respuesta no es OK, lanzamos un error
      throw Exception('Error al obtener las especificaciones');
    }
  }
}
