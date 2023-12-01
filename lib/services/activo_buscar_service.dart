import 'dart:convert';
import 'package:http/http.dart' as http;

class ActivoBuscarService {
  Future<int> obtenerIdPorNombre(String nombre) async {
    final response = await http.get(Uri.parse(
        'http://localhost:8080/api/v1/activo/obtenerIdPorNombre/$nombre'));

    if (response.statusCode == 200) {
      // Si el servidor devuelve una respuesta OK, parseamos el resultado
      return int.parse(response.body);
    } else {
      // Si la respuesta no es OK, lanzamos un error
      throw Exception('Error al obtener el activo_id');
    }
  }
}
