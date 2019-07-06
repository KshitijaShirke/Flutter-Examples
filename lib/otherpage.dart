import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {

  final String mText;

  OtherPage(this.mText);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(mText),),
      body: new Center(
        child: new Text(mText),
      ),
    );
  }
}
