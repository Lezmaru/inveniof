import 'package:flutter/material.dart';
import 'package:invenio2/activos_fijos.dart';

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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: Text('Inicio'),
              style: TextButton.styleFrom(primary: Colors.white),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivoFijoScreen()),
                );
              },
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
  }
}
