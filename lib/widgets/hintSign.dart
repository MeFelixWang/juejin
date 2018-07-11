import 'package:flutter/material.dart';

class HintSign extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Container(
      color: Colors.white,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Icon(
            Icons.insert_drive_file,
            size: 40.0,
            color: Colors.blue,
          ),
          new Text(
            '登录/注册后使用更多功能',
            style: new TextStyle(color: Colors.grey),
          ),
          new OutlineButton(
            borderSide: new BorderSide(
              color: Colors.blue,
            ),
            onPressed: null,
            child: new Text(
              '登录/注册',
              style: new TextStyle(color: Colors.blue, height: 1.0),
            ),
            padding: new EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}