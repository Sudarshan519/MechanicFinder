import 'package:MechanicFinder/admin/adminPage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: Column(
          children: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AdminPage()));
                },
                child: Text('Admin')),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AdminPage()));
                },
                child: Text('Admin')),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AdminPage()));
                },
                child: Text('Admin')),
          ],
        ),
      ),
    );
  }
}
