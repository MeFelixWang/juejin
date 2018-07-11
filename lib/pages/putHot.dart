import 'package:flutter/material.dart';

class PutHotPage extends StatefulWidget {
  @override
  createState() => new PutHotPageState();
}

class PutHotPageState extends State<PutHotPage> {
  final isOpen = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: new Text('发沸点'),
          actions: <Widget>[new Icon(Icons.edit)],
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.blue),
          textTheme: new TextTheme(title: new TextStyle(color: Colors.black)),
          bottom: new PreferredSize(
              child: new Row(
                children: <Widget>[
                  new Icon(Icons.image),
                  new Icon(Icons.link),
                  new Icon(Icons.face)
                ],
              ),
              preferredSize: new Size(100.0, 40.0)),
        ),
        body: new Form(child: new Container()),
      ),
    );
  }
}
