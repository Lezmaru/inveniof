import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:invenio2/utils/environment.dart';


import '../dto/lista_especificaciones_dto.dart';
class EspecificacionesMostrarService {
  Future<List<ListaEspecificacionesdto>> obtenerEspecificacionesPorActivoId(
      int activoId) async {
    final response = await http.get(Uri.parse(
        '${Environment.API_URL}/api/v1/especificaciones/obtenerPorActivoId/$activoId'));

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
        '${Environment.API_URL}/api/v1/especificaciones/eliminar/$especificacionesId'));

    if (response.statusCode == 200) {
      return "Exito";
    } else {
      throw Exception('Error al eliminar las especificaciones');
    }
  }

  //Update using this endpoint PUT http://localhost:8080/api/v1/especificaciones/actualizar/1?serie=Series&marca=Marca&estado=D&eq=1&dimension_alto=10&dimension_ancho=10&ram=RAM&procesador=Procesador&memoria=Memoria&color=Color&Activo_activoo_id=3
  Future<String> actualizarEspecificaciones(
      int especificacionesId,
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
    final response = await http.put(Uri.parse(
        '${Environment.API_URL}/api/v1/especificaciones/actualizar/$especificacionesId?serie=$serie&marca=$marca&estado=$estado&eq=$eq&dimension_alto=$alto&dimension_ancho=$ancho&ram=$ram&procesador=$procesador&memoria=$memoria&color=$color&Activo_activoo_id=2'));

    if (response.statusCode == 200) {
      return "Exito";
    } else {
      throw Exception('Error al actualizar las especificaciones');
    }
  }
}
