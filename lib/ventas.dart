import 'package:flutter/material.dart';
import 'package:invenio2/activos_fijos.dart';
import 'package:invenio2/graficos.dart';
import 'package:invenio2/main.dart';

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
      home: VentasScreen(),
    );
  }
}

class VentasScreen extends StatefulWidget {
  @override
  _VentasScreenState createState() => _VentasScreenState();
}

class _VentasScreenState extends State<VentasScreen> {
  String? dropdownValue = 'Filtro';

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
                    labelText: 'Buscar Ventas de Activos Fijos',
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: Text('Buscar'),
                style: TextButton.styleFrom(primary: Colors.black),
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
                  'Tipo',
                ),
              ),
              DataColumn(
                label: Text(
                  'Modelo',
                ),
              ),
              DataColumn(
                label: Text(
                  'Estado',
                ),
              ),
              DataColumn(
                label: Text(
                  'Fecha de Entrega',
                ),
              ),
              DataColumn(
                label: Text(
                  'Fecha de Venta',
                ),
              ),
              DataColumn(
                label: Text(
                  'Asignado a',
                ),
              ),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('SQ461YMN12')),
                  DataCell(Text('Televisor')),
                  DataCell(Text('QN900C')),
                  DataCell(Text('Bueno')),
                  DataCell(Text('18/11/2023')),
                  DataCell(Text('15/11/2023')),
                  DataCell(Text('Armando Moscoso')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('MJ04Q34RST')),
                  DataCell(Text('CPU')),
                  DataCell(Text('M70 Gen 3')),
                  DataCell(Text('Bueno')),
                  DataCell(Text('5/11/2023')),
                  DataCell(Text('2/11/2023')),
                  DataCell(Text('Ronny Rodriguez')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('SAF41Q4RDAX')),
                  DataCell(Text('Tablet')),
                  DataCell(Text('M10')),
                  DataCell(Text('Bueno')),
                  DataCell(Text('2/10/2023')),
                  DataCell(Text('1/10/2023')),
                  DataCell(Text('Luisa Portillo')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
