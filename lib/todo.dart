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

  final TextEditingController _textController = new TextEditingController();


  void _handleSubmitted(String text) {
    var myText = _textController.text;
    setState(() {
      strings.add(myText);
    });
    _textController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Names Generator'),
        ),
        body: _layoutBuilder(),
      );
  }

  Widget _layoutBuilder() {
    return new Stack(
          children: <Widget>[
            _buildList(),
            _buildTextComposer(),
          ],
        );
  }

  Widget _buildList() {
    return new ListView(
        padding: const EdgeInsets.all(16.0),
        children:
        strings.map((String string) {
          return new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Text(string, style: new TextStyle(color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold)),
              new Divider(),
            ],
          );
        }).toList(),
      );
  }

  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Column( 
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Flexible(
            child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: new InputDecoration.collapsed(
                hintText: "Add a task",
                ),
            ),
          ),
          new FloatingActionButton(
            onPressed: () => _handleSubmitted(_textController.text),
            child: new Icon(Icons.add),
          ),
        ], 
      ), 
    );
  }

}