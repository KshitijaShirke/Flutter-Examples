import 'package:flutter/material.dart';

void main()=> runApp(
    MaterialApp(
         home:MyApp()
    )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded & flex eg"),
      ),
      body: Column(
        children: <Widget>[
          Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Expanded(
                flex: 1,     //both expanded ele will half the exact same size
                  child: Container(
                    height: 200,
                    color: Colors.green,
                  ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Row(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Expanded(
                flex: 3,     //both expanded ele will half the exact same size
                child: Container(
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  height: 100,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}