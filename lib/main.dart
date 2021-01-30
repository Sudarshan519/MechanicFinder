import 'package:MechanicFinder/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // final dir = await p.getApplicationDocumentsDirectory();
  // Hive.registerAdapter(UserAdapter());
  // Hive.init(dir.path);

  //final usersBox = await Hive.openBox("users");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
