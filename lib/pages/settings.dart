import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final bindWebo = false;
  final bindWechat = false;
  final bindGitHub = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('设置'),
          leading: new Icon(Icons.keyboard_arrow_left),
          centerTitle: true,
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
              child: new ListTile(
                title: new Text('手机'),
                onTap: () {},
                enabled: true,
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              margin: const EdgeInsets.only(top: 20.0),
              decoration: const BoxDecoration(
                  border: const Border(
                top: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
                bottom: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
              )),
            ),
            new Container(
              child: new ListTile(
                title: new Text('邮箱'),
                onTap: () {},
                enabled: true,
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              decoration: const BoxDecoration(
                  border: const Border(
                bottom: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
              )),
            ),
            new Container(
              child: new ListTile(
                title: new Text('修改账户密码'),
                onTap: () {},
                enabled: true,
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              margin: const EdgeInsets.only(bottom: 20.0),
              decoration: const BoxDecoration(
                  border: const Border(
                bottom: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
              )),
            ),
            new Container(
              child: new SwitchListTile(
                value: bindWebo,
                onChanged: null,
                title: new Text('绑定微博'),
              ),
              decoration: const BoxDecoration(
                  border: const Border(
                top: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
                bottom: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
              )),
            ),
            new Container(
              child: new SwitchListTile(
                title: new Text('绑定微信'),
                onChanged: null,
                value: bindWechat,
              ),
              decoration: const BoxDecoration(
                  border: const Border(
                bottom: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
              )),
            ),
            new Container(
              child: new SwitchListTile(
                title: new Text('绑定GitHub'),
                onChanged: null,
                value: bindGitHub,
              ),
              margin: const EdgeInsets.only(bottom: 20.0),
              decoration: const BoxDecoration(
                  border: const Border(
                bottom: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
              )),
            ),
            new Container(
              child: new ListTile(
                title: new Text('清理缓存'),
                onTap: () {},
                enabled: true,
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              margin: const EdgeInsets.only(top: 20.0),
              decoration: const BoxDecoration(
                  border: const Border(
                top: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
                bottom: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
              )),
            ),
            new Container(
              child: new ListTile(
                title: new Text('设置新消息通知'),
                onTap: () {},
                enabled: true,
                trailing: new Icon(Icons.keyboard_arrow_right),
              ),
              margin: const EdgeInsets.only(bottom: 20.0),
              decoration: const BoxDecoration(
                  border: const Border(
                bottom: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
              )),
            ),
            new Container(
              child: new ListTile(
                title: new Center(child: new Text('退出账号')),
                onTap: () {},
                enabled: true,
              ),
              decoration: const BoxDecoration(
                  border: const Border(
                top: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
                bottom: const BorderSide(
                    width: 1.0, color: const Color(0xE3E3E3FF)),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
