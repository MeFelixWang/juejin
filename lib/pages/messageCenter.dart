import 'package:flutter/material.dart';

class MessageCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
            leading: new BackButton(color: Colors.blue),
            title: new TabBar(tabs: [
              new Tab(text: '用户消息'),
              new Tab(text: '系统消息'),
            ], labelColor: Colors.blue, indicatorColor: Colors.blue),
          ),
          body: new TabBarView(
            children: [new UserMessage(), new SystemMessage()],
          ),
        ),
      ),
    );
  }
}

class UserMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[],
    );
  }
}

class SystemMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[],
    );
  }
}
