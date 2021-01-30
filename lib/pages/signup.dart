import 'package:MechanicFinder/pages/home.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              label: Text('SignUp'),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) {
                  return HomePage();
                }));
              },
            ),
            InkWell(
              child: Text('Dont have account Signup'),
              onTap: () {
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
