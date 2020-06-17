import 'package:flutter/material.dart';

class BusinessHomePage extends StatefulWidget {
  @override
  _BusinessHomePageState createState() => _BusinessHomePageState();
}

class _BusinessHomePageState extends State<BusinessHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.lightBlue,
            ),
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
