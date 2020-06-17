import 'package:MechanicFinder/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
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
                  color: Colors.lightBlue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,bottom: 10),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: InkWell(
                                //color: Colors.grey,
                                //elevation: 0,
                                onTap: () {
                                  
                                },
                                child: Text('Push'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(alignment: Alignment.topRight,
                            child: Icon(Icons.add),),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.black12,
                      ),
                      height: MediaQuery.of(context).size.height * .25,
                      //color: Colors.black54,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                     // padding: EdgeInsets.only(left:15),
                    scrollDirection: Axis.vertical,
                        children: <Widget>[
                     
                          for (int i = 0; i < 100;i++)
                            ListTile(
                              
                              leading: Text(
                                'hello',
                                style: heading,
                              ),
                            )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.black12,
                      ),
                      height: MediaQuery.of(context).size.height * .24,
                      //color: Colors.black54,
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            leading: Text(
                              'hello',
                              style: heading,
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ))),
      ),
    );
  }
}
