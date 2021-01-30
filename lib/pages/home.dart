import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('mechanic help'),
      ),
      body: Column(
        children: [
          Text('Search \n'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Column(
                children: [
                  Text(
                    'Business Name:Cars Wash',
                  ),
                  Text('Service Description:All 4 wheels'),
                  Text('Locality : Ranibari'),
                  Text('City:Kathmandu'),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FlatButton(
                          color: Colors.red,
                          onPressed: () {},
                          child: Text('Call')),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        color: Colors.red,
                        onPressed: () {},
                        child: Text(
                          'Call',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
