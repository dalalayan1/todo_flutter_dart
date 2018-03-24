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

// class ScaffoldGenerator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Names Generator'),
//         ),
//         body: new Center(
//           child: new RandomWords(),
//         ),
//       );
//   }
// }

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

  Widget _buildListView() {
    return new ListView(
                children: <Widget>[
                  new ListTile(
                    leading: new Icon(Icons.map),
                    title: new Text('Map'),
                  ),
                  new ListTile(
                    leading: new Icon(Icons.photo_album),
                    title: new Text('Album'),
                  ),
                  new ListTile(
                    leading: new Icon(Icons.phone),
                    title: new Text('Phone'),
                  ),
                ],
              );
  }
}