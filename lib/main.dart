import 'package:MechanicFinder/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart' as p;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await p.getApplicationDocumentsDirectory();
  //Hive.registerAdapter(ContactAdapter(), 0);
  Hive.init(dir.path);

  //final usersBox = await Hive.openBox("users");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

          home: FutureBuilder(
        future: Hive.openBox('users'),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasError)
              return LoginPage();
            else
              return Text(snapshot.error.toString());
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //Hive.box('users');
    Hive.close();
  }
}



