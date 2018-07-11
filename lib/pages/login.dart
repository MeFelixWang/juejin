import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: new Text('登录'),
          centerTitle: true,
          backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
        ),
        backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
        body: new Column(
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(top: 40.0, bottom: 40.0)
            )
          ],
        ));
  }
}
