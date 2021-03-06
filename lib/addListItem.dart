import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  List<String> strings = new List();


  void _incrementList() {
    final wordPair = new WordPair.random();
    setState(() {
      strings.add(wordPair.asPascalCase);
    });
  } 


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Names Generator'),
        ),
        body: 
        new ListView(
        children:
        strings.map((String string) {
          return new Row(
            children: [
              new Text(string)
            ],
          );
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementList,
        tooltip: 'Add new weight entry',
        child: new Icon(Icons.add),
      ),
      );
  }