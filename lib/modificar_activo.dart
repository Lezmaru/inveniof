import 'package:flutter/material.dart';
import 'package:invenio2/activos_fijos.dart';
import 'package:invenio2/dto/lista_especificaciones_dto.dart';
import 'package:invenio2/graficos.dart';
import 'package:invenio2/main.dart';
import 'package:invenio2/services/especificaciones_mostrar_service.dart';
import 'package:invenio2/services/especificaciones_service.dart';
import 'package:invenio2/ventas.dart';

class ModificarScreen extends StatefulWidget {
  final ListaEspecificacionesdto especificacion;

  ModificarScreen({required this.especificacion});

  @override
  _ModificarState createState() => _ModificarState();
}

class _ModificarState extends State<ModificarScreen> {
  String? _selectedTipo;
  String? _selectedEstado;

  TextEditingController _altController = TextEditingController();
  TextEditingController _anchoController = TextEditingController();

  TextEditingController _serieController = TextEditingController();
  TextEditingController _modeloController = TextEditingController();
  TextEditingController _eqController = TextEditingController();
  TextEditingController _asignadoController = TextEditingController();
  TextEditingController _ramController = TextEditingController();
  TextEditingController _sddController = TextEditingController();
  TextEditingController _procesadorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _altController.text = widget.especificacion.dimensionAlto.toString();
    _anchoController.text = widget.especificacion.dimensionAncho.toString();
    _serieController.text = widget.especificacion.serie;
    _modeloController.text = widget.especificacion.marca;
    _eqController.text = widget.especificacion.eq.toString();
    _asignadoController.text = widget.especificacion.color;
    _ramController.text = widget.especificacion.ram;
    _sddController.text = widget.especificacion.memoria;
    _procesadorController.text = widget.especificacion.procesador;
    _selectedEstado = widget.especificacion.estado;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Text('Inicio'),
              style: TextButton.styleFrom(primary: Colors.black),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivoFijoScreen()),
                );
              },
              child: Text('Activos Fijos'),
              style: TextButton.styleFrom(primary: Colors.black),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GraficoScreen()),
                );
              },
              child: Text('Gráficos'),
              style: TextButton.styleFrom(primary: Colors.black),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VentasScreen()),
                );
              },
              child: Text('Ventas'),
              style: TextButton.styleFrom(primary: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Ingrese los Datos del Producto'),
              TextField(
                controller: _serieController,
                decoration: InputDecoration(labelText: 'Serie equipo*'),
              ),
              DropdownButton<String>(
                value: _selectedTipo,
                items:
                    <String>['Laptop', 'Desktop', 'Tablet'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedTipo = newValue;
                  });
                },
                hint: Text('Tipo*'),
              ),
              TextField(
                controller: _modeloController,
                decoration: InputDecoration(labelText: 'Modelo*'),
              ),
              DropdownButton<String>(
                value: _selectedEstado,
                items: <String>['Funcional', 'Problemas', 'Vendido']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedEstado = newValue;
                  });
                },
                hint: Text('Estado'),
              ),
              TextField(
                controller: _eqController,
                decoration: InputDecoration(labelText: 'EQ*'),
              ),
              TextField(
                controller: _altController,
                decoration: InputDecoration(labelText: 'Alto en pulgadas'),
              ),
              TextField(
                controller: _anchoController,
                decoration: InputDecoration(labelText: 'Ancho en pulgadas'),
              ),
              TextField(
                controller: _asignadoController,
                decoration: InputDecoration(labelText: 'Color*'),
              ),
              TextField(
                controller: _ramController,
                decoration: InputDecoration(labelText: 'RAM*'),
              ),
              TextField(
                controller: _sddController,
                decoration: InputDecoration(labelText: 'SDD/HDD*'),
              ),
              TextField(
                controller: _procesadorController,
                decoration: InputDecoration(labelText: 'Procesador: *'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  print("HIKA");
                  print(widget.especificacion);
                  var res = EspecificacionesMostrarService().actualizarEspecificaciones(
                      widget.especificacion.id,
                      _serieController.text,
                      _modeloController.text,
                      _selectedEstado.toString(),
                      int.parse(_eqController.text),
                      int.parse(_altController.text),
                      int.parse(_anchoController.text),
                      _ramController.text,
                      _procesadorController.text,
                      _sddController.text,
                      _asignadoController.text,
                      );
                       Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                  
                },
                child: Text('Modificar'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
