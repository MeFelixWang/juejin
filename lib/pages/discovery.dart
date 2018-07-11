import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/countTime.dart';
import '../config/httpHeaders.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  DiscoveryPageState createState() => new DiscoveryPageState();
}

class DiscoveryPageState extends State<DiscoveryPage> {
  List hotArticles;

  Future getHotArticles() async {
    final response = await http.get(Uri.encodeFull(
        'https://timeline-merger-ms.juejin.im/v1/get_entry_by_rank?src=web&uid=59120a711b69e6006865dd7b&device_id=1531286592293&token=eyJhY2Nlc3NfdG9rZW4iOiJuU2ZVQ05tVlZ6VlNUUUNtIiwicmVmcmVzaF90b2tlbiI6ImVSUE52RTN1ODlwZVZ1TXYiLCJ0b2tlbl90eXBlIjoibWFjIiwiZXhwaXJlX2luIjoyNTkyMDAwfQ%3D%3D&limit=20&category=all&recomment=1'));
    if (response.statusCode == 200) {
      setState(() {
        hotArticles = json.decode(response.body)['d']['entrylist'];
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    this.getHotArticles();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          pinned: true,
          title: new Card(
              color: new Color.fromRGBO(240, 240, 240, 0.6),
              child: new FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    new Padding(padding: new EdgeInsets.only(right: 5.0)),
                    new Text('搜索')
                  ],
                ),
              )),
          titleSpacing: 5.0,
          backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
        ),
        new SliverList(
            delegate: new SliverChildBuilderDelegate((context, index) {
          return new Container(
            color: Colors.white,
            padding: new EdgeInsets.all(5.0),
            margin: new EdgeInsets.only(bottom: 20.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/books');
                    },
                    child: new Column(
                      children: <Widget>[
                        new Icon(
                          Icons.book,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                        new Text('小册')
                      ],
                    )),
                new FlatButton(
                    onPressed: null,
                    child: new Column(
                      children: <Widget>[
                        new Icon(
                          Icons.whatshot,
                          color: Colors.red,
                          size: 30.0,
                        ),
                        new Text('本周最热')
                      ],
                    )),
                new FlatButton(
                    onPressed: null,
                    child: new Column(
                      children: <Widget>[
                        new Icon(
                          Icons.collections,
                          color: Colors.green,
                          size: 30.0,
                        ),
                        new Text('收藏集')
                      ],
                    )),
                new FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/activities');
                    },
                    child: new Column(
                      children: <Widget>[
                        new Icon(
                          Icons.toys,
                          color: Colors.yellow,
                          size: 30.0,
                        ),
                        new Text('活动')
                      ],
                    )),
              ],
            ),
          );
        }, childCount: 1)),
        new SliverList(
            delegate: new SliverChildBuilderDelegate((context, index) {
          return new Container(
            padding: new EdgeInsets.all(5.0),
            decoration: new BoxDecoration(
                border: new Border(
                    bottom: new BorderSide(width: 0.2, color: Colors.grey)),
                color: Colors.white),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Icon(
                      Icons.whatshot,
                      color: Colors.red,
                    ),
                    new Padding(padding: new EdgeInsets.only(right: 5.0)),
                    new Text(
                      '热门文章',
                      style: new TextStyle(fontSize: 14.0),
                    )
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                    new Padding(padding: new EdgeInsets.only(right: 5.0)),
                    new Text(
                      '定制热门',
                      style: new TextStyle(fontSize: 14.0, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          );
        }, childCount: 1)),
        new SliverList(
            delegate: new SliverChildBuilderDelegate((context, index) {},
                childCount: 1)),
        new SliverFixedExtentList(
            itemExtent: 90.0,
            delegate: new SliverChildBuilderDelegate((context, index) {
              var itemInfo = hotArticles[index];
              return createItem(itemInfo);
            }, childCount: hotArticles == null ? 0 : hotArticles.length)),
      ],
    );
  }

  Widget createItem(itemInfo) {
    var publicTime = countTime(itemInfo['updatedAt']);
    return new Container(
      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
              bottom: new BorderSide(width: 0.2, color: Colors.grey))),
      child: new FlatButton(
          onPressed: null,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      itemInfo['title'],
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    new Text(
                      '${itemInfo['collectionCount']}人喜欢 · ${itemInfo['user']['username']} · $publicTime',
                      textAlign: TextAlign.left,
                      style: new TextStyle(color: Colors.grey, fontSize: 12.0),
                      softWrap: true,
                    )
                  ],
                ),
              ),
              itemInfo['screenshot'] != null
                  ? new Image.network(
                      itemInfo['screenshot'],
                      width: 70.0,
                    )
                  : new Container(
                      width: 0.0,
                      height: 0.0,
                    )
            ],
          )),
    );
  }
}
