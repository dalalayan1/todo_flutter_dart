import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new LandingPage(),
      color: Colors.blue,
    );
  }
}

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      new Text('Hello World', style: new TextStyle(color: Colors.blue, fontSize: 40.0)),
      ]
    );
  }
}