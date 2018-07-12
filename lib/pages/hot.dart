import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/countTime.dart';
import '../widgets/hintSign.dart';

class HotPage extends StatefulWidget {
  @override
  HotPageState createState() => new HotPageState();
}

class HotPageState extends State<HotPage> {
  List recommend;
  List shareItems=[{'icon':''}];

  Future getRecommend() async {
    final String url =
        'https://short-msg-ms.juejin.im/v1/pinList/recommend?uid=59120a711b69e6006865dd7b&device_id=1530247539258&token=eyJhY2Nlc3NfdG9rZW4iOiI3WnFya3prZnFFcmpzNkFRIiwicmVmcmVzaF90b2tlbiI6InJla0I1SllpMGZTME1SbFEiLCJ0b2tlbl90eXBlIjoibWFjIiwiZXhwaXJlX2luIjoyNTkyMDAwfQ%3D%3D&src=web&before&limit=30';
    final response = await http.get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          trailing: new IconButton(
            icon: new Icon(Icons.edit),
            onPressed: () {
             Navigator.pushNamed(context, '/putHot');
            },
          ),
          middle: new TabBar(
            tabs: [
//                  new Tab(text: '话题'),
              new Tab(text: '推荐'),
              new Tab(text: '动态')
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        body: new TabBarView(children: [
          new Container(
              child: new FutureBuilder(
                  future: getRecommend(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var itemList = snapshot.data['d']['list'];
                      return new ListView.builder(
                          itemCount: itemList.length,
                          itemBuilder: (context, index) {
                            return createItem(itemList[index]);
                          });
                    } else if (snapshot.hasError) {
                      return new Center(
                        child:
                            new Text("error>>>>>>>>>>>>>>>:${snapshot.data}"),
                      );
                    }
                    return new CupertinoActivityIndicator();
                  })),
          new HintSign(),
        ]),
      ),
    );
  }

  Widget createItem(itemInfo) {
    return new Container(
      color: Colors.white,
      padding: new EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      margin: new EdgeInsets.only(bottom: 10.0),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new FlatButton(
                  onPressed: null,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundImage:
                            new NetworkImage(itemInfo['user']['avatarLarge']),
                      ),
                      new Padding(padding: new EdgeInsets.only(right: 5.0)),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            itemInfo['user']['username'],
                            style: new TextStyle(color: Colors.black),
                          ),
                          new Text(
                            countTime(itemInfo['createdAt']),
                            style: new TextStyle(fontSize: 12.0),
                          )
                        ],
                      )
                    ],
                  )),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new OutlineButton(
                    onPressed: null,
                    child: new Text('关注'),
                    padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                  ),
                  new Icon(Icons.more_horiz)
                ],
              )
            ],
          ),
          new Container(
            alignment: Alignment.centerLeft,
            padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Text(
              itemInfo['content'],
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new FlatButton(
                  onPressed: () {},
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        child: new Icon(
                          Icons.thumb_up,
                          color: Colors.grey,
                          size: 18.0,
                        ),
                        margin: new EdgeInsets.only(right: 5.0),
                      ),
                      new Text(itemInfo['likedCount'].toString()),
                    ],
                  ),
                ),
                new FlatButton(
                  onPressed: () {},
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        child: new Icon(
                          Icons.message,
                          color: Colors.grey,
                          size: 18.0,
                        ),
                        margin: new EdgeInsets.only(right: 5.0),
                      ),
                      new Text(itemInfo['commentCount'].toString())
                    ],
                  ),
                ),
                new IconButton(
                    icon: new Icon(
                      Icons.share,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return createShareMenu();
                            /*  return new Container(
                              padding: new EdgeInsets.all(10.0),
                              child: new Row(
                                children: <Widget>[
                                  new FlatButton(
                                      onPressed: null,
                                      child: new Column(
                                        children: <Widget>[
                                          new Icon(Icons.more_horiz),
                                          new Text('其他')
                                        ],
                                      )),
                                  new FlatButton(
                                      onPressed: null,
                                      child: new Column(
                                        children: <Widget>[
                                          new Icon(Icons.link),
                                          new Text('复制链接')
                                        ],
                                      )),
                                  new FlatButton(
                                      onPressed: null,
                                      child: new Column(
                                        children: <Widget>[
                                          new Icon(Icons.explore),
                                          new Text('Safari打开')
                                        ],
                                      ))
                                ],
                              ),
                            );*/
                          });
                    })
              ],
            ),
            decoration: new BoxDecoration(
                border: new Border(
                    top: new BorderSide(color: Colors.grey, width: 0.2))),
          )
        ],
      ),
    );
  }

  Widget createShareMenu() {
    return new GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 5,
      children: <Widget>[
        const Text('He\'d have you all unravel at the'),
        const Text('Heed not the rabble'),
        const Text('Sound of screams but the'),
        const Text('Who scream'),
        const Text('Revolution is coming...'),
        const Text('Revolution, they...'),
      ],
    );
  }
}
