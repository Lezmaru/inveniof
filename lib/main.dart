import 'package:flutter/material.dart';
import 'package:invenio2/activos_fijos.dart';
import 'package:invenio2/graficos.dart';
import 'package:invenio2/ingresar_datos.dart';
import 'package:invenio2/login.dart';
import 'package:invenio2/ventas.dart';
import 'package:invenio2/services/activo_buscar_service.dart'; // Importa el servicio

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invenio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainView(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController _nombreActivoController = TextEditingController();
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
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          const Image(
              image: AssetImage('assets/images/Invenio.png'), height: 200),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IngresarScreen()),
              );
            },
            child: Text('Ingresar Activo Fijo'),
            style: TextButton.styleFrom(primary: Colors.black),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  controller:
                      _nombreActivoController, // Usa el controlador aquí
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Buscar Activos Fijos',
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () async {
                  var nombreActivo = _nombreActivoController
                      .text; // Usa el valor del TextField
                  var activoId = await ActivoBuscarService()
                      .obtenerIdPorNombre(nombreActivo);
                  print(
                      'Activo ID: $activoId'); // Esto imprimirá el activo_id en la consola
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActivoFijoScreen(),
                      settings: RouteSettings(
                        arguments: activoId, // Pasa el activo_id como argumento
                      ),
                    ),
                  );
                },
                child: Text('Buscar'),
                style: TextButton.styleFrom(primary: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
