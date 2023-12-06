import 'dart:convert';
import 'package:http/http.dart' as http;



import '../dto/lista_especificaciones_dto.dart';
class EspecificacionesMostrarService {
  Future<List<ListaEspecificacionesdto>> obtenerEspecificacionesPorActivoId(
      int activoId) async {
    final response = await http.get(Uri.parse(
        'http://localhost:8080/api/v1/especificaciones/obtenerPorActivoId/$activoId'));

    if (response.statusCode == 200) {
      var responseBody = response.body;
      if (responseBody.isEmpty) {
        return []; // Devuelve una lista vacía si la respuesta está vacía
      } else {
        List<dynamic> jsonList = jsonDecode(responseBody);
        List<ListaEspecificacionesdto> especificacionesList = jsonList
            .map((json) => ListaEspecificacionesdto.fromJson(json))
            .toList();
        return especificacionesList;
      }
    } else {
      throw Exception('Error al obtener las especificaciones');
    }
  }

  //Delete
  Future<String> eliminarEspecificaciones(int especificacionesId) async {
    final response = await http.delete(Uri.parse(
        'http://localhost:8080/api/v1/especificaciones/eliminar/$especificacionesId'));

    if (response.statusCode == 200) {
      return "Exito";
    } else {
      throw Exception('Error al eliminar las especificaciones');
    }
  }
}
