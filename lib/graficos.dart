import 'package:flutter/material.dart';
import 'package:invenio2/activos_fijos.dart';
import 'package:invenio2/main.dart';
import 'package:invenio2/ventas.dart';
import 'package:fl_chart/fl_chart.dart';

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
      home: GraficoScreen(),
    );
  }
}

class GraficoScreen extends StatefulWidget {
  @override
  _GraficoState createState() => _GraficoState();
}

class _GraficoState extends State<GraficoScreen> {
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
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: <Widget>[
            Text(
              'Gráfico de Ventas:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 10,
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(fromY: 0, color: Colors.black, toY: 5),
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(fromY: 0, color: Colors.black, toY: 3),
                    ], showingTooltipIndicators: [
                      0
                    ]),
                  ],
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('Claudio Miguel Burgos');
                            case 1:
                              return Text('Jorge Armando Moscoso');
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('Laptops');
                            case 1:
                              return Text('Televisores');
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
