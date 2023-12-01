import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/material.dart';
import 'package:invenio2/main.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  Credentials? _credentials;

  late Auth0Web auth0 = Auth0Web(
      's9I74zQAyfSkLzVtKgeiBZPGgcjWRJz6', 'dev-2xtlx3etsrdkrcyq.us.auth0.com');

  @override
  void initState() {
    super.initState();
    auth0.onLoad().then((final credentials) => setState(() {
          _credentials = credentials;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invenio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_credentials == null)
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: const Text("Log in"))
            else
              ElevatedButton(
                  onPressed: () => auth0.logout(),
                  child: const Text("Log out")),
          ],
        ),
      ),
    );
  }
}
