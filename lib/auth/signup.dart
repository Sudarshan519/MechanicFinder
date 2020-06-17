import 'package:MechanicFinder/admin/adminPage.dart';
import 'package:MechanicFinder/auth/login.dart';
import 'package:MechanicFinder/business/businessHomePage.dart';
import 'package:MechanicFinder/database/dbhelper.dart';
import 'package:MechanicFinder/models/user.dart';
import 'package:MechanicFinder/user/userHomePage.dart';
import 'package:MechanicFinder/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _selectedItem = 'user';

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  User user;

  String usertype;

  void showSnackBar() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('value'),
      backgroundColor: Colors.white,
    ));
  }

  @override
  void initState() {
    super.initState();
    usertype = 'user';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.lightBlue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: '  username',
                            border: InputBorder.none),
                        controller: usernameController,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: '  email',
                            border: InputBorder.none),
                        controller: emailController,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: '  password',
                            border: InputBorder.none),
                        controller: passwordController,
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButton(
                          isExpanded: true,
                          dropdownColor: Colors.grey,

                          underline: Text(''),
                          elevation: 0,
                          //isExpanded: true,
                          value: _selectedItem,
                          onChanged: (v) {
                            setState(() {
                              _selectedItem = v;

                              print(v);
                              usertype = v;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.person,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    ' Admin',
                                    style: heading.copyWith(
                                        fontSize: 15, color: Colors.black54),
                                  )
                                ],
                              ),
                              value: 'admin',
                            ),
                            DropdownMenuItem(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.person,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    '  User',
                                    style: heading.copyWith(
                                        fontSize: 15, color: Colors.black54),
                                  )
                                ],
                              ),
                              value: 'user',
                            ),
                            DropdownMenuItem(
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.person,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    '  Business',
                                    style: heading.copyWith(
                                        fontSize: 15, color: Colors.black54),
                                  )
                                ],
                              ),
                              value: 'business',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          print(usernameController.text);
                          print(passwordController.text);
                          print(emailController.text);
                          print(usertype);
                          if (usernameController.text != null) addUser();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            if (usertype == 'admin')
                              return AdminPage();
                            else if (usertype == 'user')
                              return UserHomePage();
                            else
                              return BusinessHomePage();
                          }));
                        },
                        child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(child: Text('SignUp'))),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginPage()));
                        },
                        child: Text('Already have account\tSignIn'),
                      ),
                      Container(
                          height: 100,
                          child: ListView.builder(
                            itemCount: Hive.box('users').length,
                            itemBuilder: (_, index) {
                              final useri =
                                  Hive.box('users').getAt(index) as User;
                              return ListTile(
                                  leading: Text(useri.usertype),
                                  trailing: IconButton(
                                    onPressed: () {
                                      // Hive.box('users').clear();
                                    },
                                    icon: Icon(Icons.delete),
                                  ));
                            },
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getUser(index) {
    Hive.box('users').length;
  }

  void addUser() {
    int key = DateTime.now().millisecondsSinceEpoch;
    final users = User(key.toString(), usernameController.text, 'images/b.jpg',
        usertype, emailController.text, passwordController.text);
    dbHelper.addUser(users);
  }
}
