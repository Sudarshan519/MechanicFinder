import 'package:MechanicFinder/pages/home.dart';
import 'package:MechanicFinder/pages/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanic Finder'),
      ),
      body: Form(
        child: Column(
          children: [
            Text('Sign In'),
            TextFormField(
              decoration: InputDecoration(labelText: 'Username or Email'),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(
              height: 40,
            ),
            FloatingActionButton.extended(
              label: Text('SignIn'),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) {
                  return HomePage();
                }));
              },
            ),
            InkWell(child: Text('Dont have account Signup'),
            onTap: (){
               Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) {
                  return SignupPage();
                }));
            },
          )
          ],
        ),
      ),
    );
  }
}
