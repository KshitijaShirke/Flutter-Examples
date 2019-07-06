import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Notification Widget Eg"),
        ),
        body: MyApp(),
      ),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void showSnackbar() {
    final snackbar = SnackBar(
      content: Text("Hi snackbar here"),
      action: SnackBarAction(label: "Ok", onPressed: () {}),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void showBottom() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 100.0,
            color: Colors.deepOrangeAccent,
            child: Center(
              child: Text("Bottom sheet modal"),
            ),
          );
        });
  }

  Future<Null> showSimpleDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Simple diaalog"),
            content: Text("Simple dialog exmaple"),
            actions: <Widget>[
              FlatButton(
                child: Text("Done"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: MaterialButton(
            child: Text("Snackbar"),
            color: Colors.lightBlue,
            textColor: Colors.white,
            splashColor: Colors.green,
            onPressed: () {
              showSnackbar();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: MaterialButton(
            child: Text("Modal bottom"),
            color: Colors.lightBlue,
            textColor: Colors.white,
            splashColor: Colors.green,
            onPressed: () {
              showBottom();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: MaterialButton(
            child: Text("Simple dialog"),
            color: Colors.lightBlue,
            textColor: Colors.white,
            splashColor: Colors.green,
            onPressed: () {
              showSimpleDialog();
            },
          ),
        ),
      ],
    );
  }
}
