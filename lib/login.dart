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
   late Auth0 auth0;


  @override
  void initState() {
    super.initState();
    auth0 = Auth0('dev-et7ad23cy60xt03a.us.auth0.com', '4hIn3NfQdPcMckaPeqD7iY49QLNOeIKm');
   
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
                  onPressed: () async {
                    
                    final credentials =
                        await auth0.webAuthentication().login();

                    setState(() {
                      _credentials = credentials;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: const Text("Log in"))
  
          ],
        ),
      ),
    );
  }
}

//COMMIT XD


