import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'messageCenter.dart';
import 'settings.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new Scaffold(
          appBar: new CupertinoNavigationBar(
            middle: new Text('我',style: new TextStyle(fontWeight: FontWeight.normal),),
          ),
          body: new ListView(children: <Widget>[
            new Container(
              child: new ListTile(
                leading: new CircleAvatar(
                  child: new Icon(Icons.person,color: Colors.white),
                  backgroundColor: Colors.grey,
                ),
                title: new Text('登录/注册'),
                enabled: true,
                trailing: new Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.pushNamed(context, '/login');
                },
              ),
              padding: new EdgeInsets.only(top: 15.0, bottom: 15.0),
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              decoration: const BoxDecoration(
                  border: const Border(
                    top: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                    bottom: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                  ),
                  color: Colors.white),
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(
                  Icons.notifications,
                  color: Colors.blue,
                ),
                title: new Text('消息中心'),
                enabled: true,
                onTap: () {},
              ),
              decoration: const BoxDecoration(
                  border: const Border(
                    top: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                    bottom: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                  ),
                  color: Colors.white),
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(
                  Icons.favorite,
                  color: Colors.green,
                ),
                title: new Text('我喜欢的'),
                enabled: true,
                onTap: () {
                  print('active2');
                },
              ),
              decoration: const BoxDecoration(
                  border: const Border(
                    bottom: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                  ),
                  color: Colors.white),
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(
                  Icons.collections,
                  color: Colors.blue,
                ),
                title: new Text('收藏集'),
                enabled: true,
                onTap: () {
                  print('active3');
                },
              ),
              decoration: const BoxDecoration(
                  border: const Border(
                    bottom: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                  ),
                  color: Colors.white),
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(
                  Icons.shop,
                  color: Colors.orange,
                ),
                title: new Text('已购'),
                enabled: true,
                onTap: () {
                  print('active2');
                },
              ),
              decoration: const BoxDecoration(
                  border: const Border(
                    bottom: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                  ),
                  color: Colors.white),
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                ),
                title: new Text('赞过的沸点'),
                enabled: true,
                onTap: () {
                  print('active2');
                },
              ),
              decoration: const BoxDecoration(
                  border: const Border(
                    bottom: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                  ),
                  color: Colors.white),
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.remove_red_eye),
                title: new Text('阅读过的文章'),
                enabled: true,
                onTap: () {
                  print('active2');
                },
              ),
              decoration: const BoxDecoration(
                  border: const Border(
                    bottom: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                  ),
                  color: Colors.white),
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.local_offer),
                title: new Text('我喜欢的'),
                enabled: true,
                onTap: () {
                  print('active2');
                },
              ),
              decoration: const BoxDecoration(
                  border: const Border(
                    bottom: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                  ),
                  color: Colors.white),
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.feedback),
                title: new Text('意见反馈'),
                enabled: true,
                onTap: () {},
              ),
              margin: const EdgeInsets.only(top: 20.0),
              decoration: const BoxDecoration(
                  border: const Border(
                    top: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                    bottom: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                  ),
                  color: Colors.white),
            ),
            new Container(
              child: new ListTile(
                leading: new Icon(Icons.settings),
                title: new Text('设置'),
                enabled: true,
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new SettingPage();
                  }));
                },
              ),
              margin: const EdgeInsets.only(bottom: 20.0),
              decoration: const BoxDecoration(
                  border: const Border(
                    bottom: const BorderSide(
                        width: 1.0,
                        color: const Color.fromRGBO(215, 217, 220, 1.0)),
                  ),
                  color: Colors.white),
            )
          ])),
    );
  }
}
