import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('Inicio'),
              style: TextButton.styleFrom(primary: Colors.white),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Activos Fijos'),
              style: TextButton.styleFrom(primary: Colors.white),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Gráficos'),
              style: TextButton.styleFrom(primary: Colors.white),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Ventas'),
              style: TextButton.styleFrom(primary: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          const Image(image: AssetImage('assets/Invenio.png'), height: 200),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ElevatedButton(
            onPressed: () {},
            child: Text('Ingresar Producto'),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Buscar Productos',
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
