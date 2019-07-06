import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true, //show normal app bar while scrolling
            flexibleSpace: FlexibleSpaceBar(
              title: Text("SliverAppBar Example"),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("$index", style: TextStyle(fontSize: 32.0)),
                    ), //Padding
                  ) //Card
                  ); //Padding
            }), //SliverChildBuilderDelegate
          ) //SliverList
        ], //<Widget>[]
      ), //CustomScrollView
    ); //Scaffold
  }
}
