import 'package:flutter/material.dart';
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
                  'Fecha de Salida',
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
                  DataCell(Text('MJ04Q34RST')),
                  DataCell(Text('AIO')),
                  DataCell(Text('M810')),
                  DataCell(Text('En uso')),
                  DataCell(Text('10/11/2023')),
                  DataCell(Text('12/11/2023')),
                  DataCell(Text('Jose Luis Perales')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('SQ461YMN12')),
                  DataCell(Text('Televisor')),
                  DataCell(Text('E404')),
                  DataCell(Text('Mal Estado')),
                  DataCell(Text('5/11/2023')),
                  DataCell(Text(' - ')),
                  DataCell(Text('Almacen de Soporte')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('ZZ34T56T7')),
                  DataCell(Text('Verifone')),
                  DataCell(Text('VX520')),
                  DataCell(Text('En uso')),
                  DataCell(Text('1/01/2023')),
                  DataCell(Text('2/11/2023')),
                  DataCell(Text('Agencia Villa Fátima')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
