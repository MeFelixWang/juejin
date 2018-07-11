import 'package:flutter/material.dart';

class ShareArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.keyboard_arrow_left), onPressed: () {
            Navigator.pop(context);
          }),
          title: new Text('分享文章'),
          centerTitle: true,
          backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
          textTheme: new TextTheme(title: new TextStyle(color: Colors.black)),
          iconTheme: new IconThemeData(color: Colors.blue),
          actions: <Widget>[
            new FlatButton(onPressed: null, child: new Text('发布'))
          ],
        ),
        body: new Form(
            child: new ListView(
              children: <Widget>[
                new Container(
                  child: new ListTile(
                    leading: new Icon(Icons.map),
//                title: new FormField(builder: null),
                  ),
                  decoration: const BoxDecoration(
                      border: const Border(
                        bottom: const BorderSide(
                            width: 1.0, color: const Color(0xE3E3E3FF)),
                      )),
                ),
                new Container(
                  child: new ListTile(
                    leading: new Icon(Icons.title),
//                title: new FormField(builder: null),
                  ),
                  decoration: const BoxDecoration(
                      border: const Border(
                        bottom: const BorderSide(
                            width: 1.0, color: const Color(0xE3E3E3FF)),
                      )),
                ),
                new Container(
                  child: new ListTile(
                    leading: new Icon(Icons.text_fields),
//                title: new FormField(builder: null),
                  ),
                  decoration: const BoxDecoration(
                      border: const Border(
                        bottom: const BorderSide(
                            width: 1.0, color: const Color(0xE3E3E3FF)),
                      )),
                ),
                new Container(
                  child: new ListTile(
                    leading: new Icon(Icons.widgets),
                    title: new Text('选择分类'),
                    subtitle: new Row(
                      children: <Widget>[
                        new RaisedButton(
                          onPressed: null,
                          child: new Text('阅读'),
                        )
                      ],
                    ),
                  ),
                  decoration: const BoxDecoration(
                      border: const Border(
                        bottom: const BorderSide(
                            width: 1.0, color: const Color(0xE3E3E3FF)),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
