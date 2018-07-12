import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../config/httpHeaders.dart';

class ArticleDetail extends StatefulWidget {
  final String objectId;
  final Map articleInfo;

  @override
  ArticleDetail({Key key, this.objectId, this.articleInfo}) : super(key: key);

  @override
  ArticleDetailState createState() => new ArticleDetailState();
}

class ArticleDetailState extends State<ArticleDetail> {
  Map content;

  Future getContent() async {
    final String url =
        'https://post-storage-api-ms.juejin.im/v1/getDetailData?uid=${httpHeaders['X-Juejin-Src']}&device_id=${httpHeaders['X-Juejin-Client']}&token=${httpHeaders['X-Juejin-Token']}&src=${httpHeaders['X-Juejin-Src']}&type=entryView&postId=${widget
        .objectId}';
    final response = await http.get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      return json.decode(response.body)['d'];
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var articleInfo = widget.articleInfo;
    return new FutureBuilder(
        future: getContent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return new Scaffold(
                appBar: new AppBar(
                  backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
                  leading: new IconButton(
                      padding: new EdgeInsets.all(0.0),
                      icon: new Icon(
                        Icons.chevron_left,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  title: new Row(
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            articleInfo['user']['avatarLarge']),
                      ),
                      new Padding(padding: new EdgeInsets.only(right: 5.0)),
                      new Text(articleInfo['user']['username'])
                    ],
                  ),
                  actions: <Widget>[
                    new IconButton(
                        icon: new Icon(
                          Icons.file_upload,
                          color: Colors.blue,
                        ),
                        onPressed: null)
                  ],
                ),
                bottomNavigationBar: new Container(
                  height: 50.0,
                  padding: new EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: new BoxDecoration(
                      color: new Color.fromRGBO(244, 245, 245, 1.0),
                      border: new Border(
                          top: new BorderSide(width: 0.2, color: Colors.grey))),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Icon(
                            Icons.favorite_border,
                            color: Colors.green,
                            size: 24.0,
                          ),
                          new Padding(
                              padding: new EdgeInsets.only(right: 20.0)),
                          new Icon(
                            Icons.message,
                            color: Colors.grey,
                            size: 24.0,
                          ),
                          new Padding(
                              padding: new EdgeInsets.only(right: 20.0)),
                          new Icon(
                            Icons.playlist_add,
                            color: Colors.grey,
                            size: 24.0,
                          )
                        ],
                      ),
                      new Text(
                          '喜欢 ${articleInfo['collectionCount']} · 评论 ${articleInfo['commentsCount']}')
                    ],
                  ),
                ),
                body: new Container(
                  child: new Text(snapshot.data.toString()),
                ));
          } else if (snapshot.hasError) {
            return new Container(
              color: Colors.white,
              child: new Text("error2>>>>>>>>>>>>>>>:${snapshot.error}"),
            );
          }
          return new Container(
            color: new Color.fromRGBO(244, 245, 245, 1.0),
            child: new CupertinoActivityIndicator(),
          );
        });
  }
}
