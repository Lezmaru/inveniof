import 'package:flutter/material.dart';
import 'package:invenio2/activos_fijos.dart';
import 'package:invenio2/graficos.dart';
import 'package:invenio2/main.dart';
import 'package:invenio2/services/especificaciones_service.dart';
import 'package:invenio2/ventas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invenio',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: IngresarScreen(),
    );
  }
}

class IngresarScreen extends StatefulWidget {
  @override
  _IngresarState createState() => _IngresarState();
}

class _IngresarState extends State<IngresarScreen> {
  String? _selectedTipo;
  String? _selectedEstado;
  TextEditingController _serieController = TextEditingController();
  TextEditingController _modeloController = TextEditingController();
  TextEditingController _eqController = TextEditingController();
  TextEditingController _asignadoController = TextEditingController();
  TextEditingController _ramController = TextEditingController();
  TextEditingController _sddController = TextEditingController();
  TextEditingController _procesadorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        child: Form(
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
                decoration: InputDecoration(labelText: 'Fecha de Entrada'),
              ),
              TextField(
                controller: _asignadoController,
                decoration: InputDecoration(labelText: 'Asignado a*'),
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
                  print(_serieController.text);
                  print(_selectedTipo);
                  print(_modeloController.text);
                  print(_selectedEstado);
                  print(_eqController.text);
                  print(_asignadoController.text);
                  print(_ramController.text);
                  print(_sddController.text);
                  print(_procesadorController.text);
                   var res =EspecificacionesService().guardarEspecificaciones(
                      _serieController.text,
                      _modeloController.text,
                      _selectedEstado.toString(),
                      int.parse(_eqController.text),
                      10,
                      10,
                      _ramController.text,
                      _procesadorController.text,
                      _sddController.text,
                      "balnco"
                      );
                },
                child: Text('Guardar'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  print("CANCELAR");
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
