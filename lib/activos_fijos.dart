import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:invenio2/graficos.dart';
import 'package:invenio2/main.dart';
import 'package:invenio2/modificar_activo.dart';
import 'package:invenio2/services/especificaciones_service.dart';
import 'package:invenio2/ventas.dart';
import 'package:invenio2/services/especificaciones_mostrar_service.dart';

import 'dto/lista_especificaciones_dto.dart'; // Importa el servicio

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
  List<ListaEspecificacionesdto>?
      especificaciones; // Aquí almacenaremos la información del activo

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
    int activoId;
    print(ModalRoute.of(context)!.settings.arguments);
    if (ModalRoute.of(context)!.settings.arguments == null) {
      print("Activo id es null");
      activoId = 2; // Si no se obtiene el activo_id, se asigna 1 por defecto
    } else {
      print("Activo id no es null");
      activoId = ModalRoute.of(context)!.settings.arguments as int;
    }
    var activoData = await EspecificacionesMostrarService()
        .obtenerEspecificacionesPorActivoId(activoId);
    setState(() {
      especificaciones = activoData;
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
      body: SingleChildScrollView(
          child: Column(
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
          // Wrap the DataTable in SingleChildScrollView and set scrollDirection to Axis.horizontal
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
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
                    'Alto',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Ancho',
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
                DataColumn(
                  label: Text(
                    'Editar',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Eliminar',
                  ),
                ),
              ],
              rows: especificaciones == null
                  ? <DataRow>[] // Si no hay información, muestra una lista vacía
                  : // Si hay información, muestra la lista de
                  especificaciones!
                      .map(
                        (especificacion) => DataRow(
                          cells: <DataCell>[
                            DataCell(Text(especificacion.serie)),
                            DataCell(Text(especificacion.marca)),
                            DataCell(Text(especificacion.estado)),
                            DataCell(Text(especificacion.eq.toString())),
                            DataCell(
                                Text(especificacion.dimensionAlto.toString())),
                            DataCell(
                                Text(especificacion.dimensionAncho.toString())),
                            DataCell(Text(especificacion.ram)),
                            DataCell(Text(especificacion.procesador)),
                            DataCell(Text(especificacion.memoria)),
                            DataCell(Text(especificacion.color)),
                            DataCell(ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ModificarScreen(
                                        especificacion: especificacion),
                                  ),
                                );
                              },
                              child: Text('Editar'),
                              style: TextButton.styleFrom(
                                  primary: Color.fromARGB(255, 56, 17, 250)),
                            )),
                            DataCell(ElevatedButton(
                              onPressed: () {
                                var res = EspecificacionesMostrarService()
                                    .eliminarEspecificaciones(
                                        especificacion.id);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ),
                                );
                              },
                              child: Text('Eliminar'),
                              style:
                                  TextButton.styleFrom(primary: Colors.black),
                            )),
                          ],
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      )),
    );
  }
}
