import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

void main()=> runApp(
    MaterialApp(home:MyApp()
    )
);

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState()=>_MyAppState();
}

class _MyAppState extends State<MyApp>{
  String input,username;

  @override
  void initState(){
    super.initState();
    getSharedPrefs();
  }

  Future<Null> storeInput(String input) async{
   await SharedPreferences.getInstance().then((prefs){
     setState(() {
        prefs.setString("username",input);
        username=input;
     });
     });
  }

  Future<Null> getSharedPrefs() async{
    await SharedPreferences.getInstance().then((prefs){
      setState(() {
        username=prefs.getString("username");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(username==null?"No Name":username),
        ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (String value){
              input=value;
            },
          ),
          RaisedButton(
              child: Text("Save Username"),
              onPressed: (){
                 setState(() {
                    storeInput(input);
                 });
              },
          )
        ],
      ),
    );
  }

}