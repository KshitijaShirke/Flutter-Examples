import 'package:flutter/material.dart';

void main()=> runApp(
    MaterialApp(home:MyApp()
    )
);

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState()=>_MyAppState();
}

class _MyAppState extends State<MyApp>{

  Widget buildPage(String text,Color color){
     return Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 80.0,color: color),
        ),
     );
  }

  Widget buildPageView(){
    return PageView(
      children: <Widget>[
        buildPage("Hello",Colors.red),
        buildPage("From",Colors.green),
        buildPage("Pageview",Colors.blue),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: buildPageView()
    );
  }

}