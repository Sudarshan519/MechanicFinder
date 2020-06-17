import 'package:MechanicFinder/admin/adminPage.dart';
import 'package:MechanicFinder/auth/signup.dart';
import 'package:MechanicFinder/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _selectedItem = 'admin';

  String email = '';
  String password = '';
  bool loading = false;
  String error = '';
  final textStyle = new TextStyle(fontSize: 16, color: Colors.black);
  bool _toggleVisibility = true;
  final _formKey = GlobalKey<FormState>();

  Widget _buildEmailField() {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.white.withOpacity(0.5),
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Email',
            icon: Icon(Icons.email),
            //border: OutlineInputBorder(),
          ),
          validator: (val) {
            if (val.length < 6) {
              return 'Enter a password 6+ char long';
            } else if (val.isEmpty)
              return 'Cannot be empty';
            else
              return null;
          },
          onChanged: (v) {
            print(v);
            setState(() {
              email = v;
            });
            print(email);
            return '';
          },
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white.withOpacity(.5),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextFormField(
          validator: (val) {
            if (val.length < 6) {
              return 'Enter a password 6+ char long';
            }
            if (val.isEmpty)
              return 'Enter a password of valid length';
            else
              return '';
          },
          onChanged: (val) {
            print(val);
            setState(() => password = val);
          },
          obscureText: _toggleVisibility,
          decoration: InputDecoration(
              icon: Icon(Icons.lock_outline),
              hintText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _toggleVisibility = !_toggleVisibility;
                  });
                },
                icon: _toggleVisibility
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              ),
              border: InputBorder.none,
             // hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                _buildEmailField(),
                                SizedBox(height: 20),
                                _buildPasswordField(),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              print(email);
                              print(password);
                            },
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.blue.withOpacity(.5),
                              ),
                              child: Center(
                                  child: Text(
                                "Sign In ",
                                style: textStyle.copyWith(
                                    color: Colors.white, fontSize: 24),
                              )),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "Forget Password?",
                            style: textStyle.copyWith(
                                color: Colors.blueAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: loading ? Colors.green : Colors.red,
                              ),
                              child: Center(
                                  child: Text(
                                "SignUp With Google",
                                style: textStyle.copyWith(
                                    color: Colors.white, fontSize: 24),
                              )),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Don't have an account ?",
                                  style: textStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  )),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                    return SignUpPage();
                                  }));
                                },
                                child: Text(
                                  "Signup",
                                  style: textStyle.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
