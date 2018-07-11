import 'package:flutter/material.dart';

class TagManagementPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          leading: new Icon(Icons.keyboard_arrow_left),
          title: new Text('关注标签'),
        ),
        body: new FocusTag(),
      ),
    );
  }
}

class FocusTag extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[
      ],
    );
  }
}