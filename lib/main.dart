import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(home: new MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _TabbarExampleState createState() => new _TabbarExampleState();
}

class _TabbarExampleState extends State<MyApp> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tabbar"),
        bottom: new TabBar(
            controller: _tabController,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.supervisor_account),),
              new Tab(icon: new Icon(Icons.access_alarm),),
              new Tab(icon: new Icon(Icons.archive),),
            ],
        ),
      ),
      body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
             new Center(child: new Text("Supervisor account"),),
             new Center(child: new Text("Access alarm"),),
             new Center(child: new Text("Archive"),),
          ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: _tabController,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.supervisor_account),),
            new Tab(icon: new Icon(Icons.access_alarm),),
            new Tab(icon: new Icon(Icons.archive),),
          ],
        ),
      ),
    );
  }
}

//Widget _customWidgetMethod(){
//  return new Container(
//    color: Colors.purple,
//    margin: const EdgeInsets.all(15.0),
//  );
//}