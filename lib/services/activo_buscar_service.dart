import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:invenio2/utils/environment.dart';

class ActivoBuscarService {
  Future<int> obtenerIdPorNombre(String nombre) async {
    final response = await http.get(Uri.parse(
        '${Environment.API_URL}/api/v1/activo/obtenerIdPorNombre/$nombre')); // Hace la petición al servidor

    if (response.statusCode == 200) {
      // Si el servidor devuelve una respuesta OK, parseamos el resultado
      return int.parse(response.body);
    } else {
      // Si la respuesta no es OK, lanzamos un error
      throw Exception('Error al obtener el activo_id');
    }
  }
}
