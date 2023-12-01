import 'package:flutter/material.dart';
import 'package:invenio2/graficos.dart';
import 'package:invenio2/main.dart';
import 'package:invenio2/ventas.dart';
import 'package:invenio2/services/especificaciones_mostrar_service.dart'; // Importa el servicio

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
      home: ActivoFijoScreen(),
    );
  }
}

class ActivoFijoScreen extends StatefulWidget {
  @override
  _ActivoFijoScreenState createState() => _ActivoFijoScreenState();
}

class _ActivoFijoScreenState extends State<ActivoFijoScreen> {
  String? dropdownValue = 'Filtro';
  Map<String, dynamic>? activo; // Aquí almacenaremos la información del activo

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cargarActivo(); // Cargamos la información del activo cuando se inicializa la pantalla
  }

  Future<void> cargarActivo() async {
    var activoId = ModalRoute.of(context)!.settings.arguments
        as int; // Obtiene el activo_id de la pantalla anterior
    var activoData = await EspecificacionesMostrarService()
        .obtenerEspecificacionesPorActivoId(activoId);
    setState(() {
      activo = activoData;
    });
  }

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
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                'Filtro',
                'Modelo',
                'Serie',
                'Tipo',
                'Estado',
                'Fecha de Entrega',
                'Fecha de Salida',
                'Asignado a'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Buscar Activos Fijos',
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Buscar'),
              ),
            ],
          ),
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Serie',
                ),
              ),
              DataColumn(
                label: Text(
                  'Marca',
                ),
              ),
              DataColumn(
                label: Text(
                  'Estado',
                ),
              ),
              DataColumn(
                label: Text(
                  'EQ',
                ),
              ),
              DataColumn(
                label: Text(
                  'Dimension Alto',
                ),
              ),
              DataColumn(
                label: Text(
                  'Dimension Ancho',
                ),
              ),
              DataColumn(
                label: Text(
                  'RAM',
                ),
              ),
              DataColumn(
                label: Text(
                  'Procesador',
                ),
              ),
              DataColumn(
                label: Text(
                  'Memoria',
                ),
              ),
              DataColumn(
                label: Text(
                  'Color',
                ),
              ),
            ],
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(activo?['serie'] ?? '')),
                  DataCell(Text(activo?['marca'] ?? '')),
                  DataCell(Text(activo?['estado'] ?? '')),
                  DataCell(Text((activo?['eq'] ?? '').toString())),
                  DataCell(Text((activo?['dimension_alto'] ?? '').toString())),
                  DataCell(Text((activo?['dimension_ancho'] ?? '').toString())),
                  DataCell(Text(activo?['ram'] ?? '')),
                  DataCell(Text(activo?['procesador'] ?? '')),
                  DataCell(Text(activo?['memoria'] ?? '')),
                  DataCell(Text(activo?['color'] ?? '')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
