import 'package:flutter/material.dart';
import 'package:invenio2/activos_fijos.dart';
import 'package:invenio2/graficos.dart';
import 'package:invenio2/main.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              TextFormField(
                decoration: InputDecoration(labelText: 'Serie*'),
              ),
              DropdownButton<String>(
                items:
                    <String>['Laptop', 'Desktop', 'Tablet'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
                hint: Text('Tipo*'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Modelo*'),
              ),
              DropdownButton<String>(
                items: <String>['Funcional', 'Problemas', 'Vendido']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
                hint: Text('Estado'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'EQ*'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Fecha de Entrada'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Asignado a*'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'RAM*'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'SDD/HDD*'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Procesador*'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Guardar'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Cancelar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
