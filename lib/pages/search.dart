import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../utils/countTime.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  String searchContent;
  List searchResult;
  Widget resultPage;

  Future search(String query) async {
    final String url =
        'https://search-merger-ms.juejin.im/v1/search?query=$query&page=0&raw_result=false&src=web';
    final response = await http.get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      setState(() {
        searchResult = json.decode(response.body)['d'];
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

  final TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: new Color.fromRGBO(244, 245, 245, 1.0),
      child: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            pinned: true,
            leading: new IconButton(
                icon: new Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: new Text(
              '搜索',
              style: new TextStyle(
                  fontWeight: FontWeight.normal),
            ),
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.blue),
            backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
          ),
          new SliverList(
              delegate: new SliverChildBuilderDelegate((context, index) {
            return new Container(
              color: Colors.white,
              padding: new EdgeInsets.all(5.0),
              child: new Card(
                  color: new Color.fromRGBO(243, 243, 243, 0.6),
                  child: new Padding(
                    padding: new EdgeInsets.all(5.0),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Expanded(
                          child: new TextField(
                            autofocus: true,
                            style: new TextStyle(
                                fontSize: 14.0, color: Colors.black),
                            decoration: new InputDecoration(
                              contentPadding: new EdgeInsets.all(0.0),
                              border: InputBorder.none,
                              hintText: '搜索',
                              prefixIcon: new Icon(
                                Icons.search,
                                size: 16.0,
                                color: Colors.grey,
                              ),
                            ),
                            onChanged: (String content){
                              setState(() {
                                searchContent = content;
                              });
                            },
                            onSubmitted: (String content) {
                              search(content);
                            },
                            controller: controller,
                          ),
                        ),
                        searchContent == null
                            ? new Container(
                                height: 0.0,
                                width: 0.0,
                              )
                            : new IconButton(
                                padding: new EdgeInsets.all(0.0),
                                iconSize: 16.0,
                                icon: new Icon(
                                  Icons.close,
                                ),
                                onPressed: () {
                                  setState(() {
                                    searchContent = '';
                                    controller.text = '';
                                  });
                                })
                      ],
                    ),
                  )),
            );
          }, childCount: 1)),
          searchResult == null
              ? new SliverList(
                  delegate: new SliverChildBuilderDelegate((context, index) {
                  return new Container(
                    width: 0.0,
                    height: 0.0,
                  );
                }, childCount: 0))
              : new SliverList(
                  delegate: new SliverChildBuilderDelegate((context, index) {
                  var resultInfo = searchResult[index];
                  return showResult(resultInfo);
                }, childCount: searchResult.length))
        ],
      ),
    );
  }

  Widget showResult(resultInfo) {
    var publicTime = countTime(resultInfo['updatedAt']);
    return new Container(
      alignment: Alignment.centerLeft,
      padding: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
              bottom: new BorderSide(width: 0.2, color: Colors.grey))),
      child: new FlatButton(
          onPressed: null,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text(
                resultInfo['title'],
                style: new TextStyle(color: Colors.black),
              ),
              new Text(
                '${resultInfo['collectionCount']}人喜欢 · ${resultInfo['user']['username']} · $publicTime',
                textAlign: TextAlign.left,
                style: new TextStyle(color: Colors.grey, fontSize: 12.0),
                softWrap: true,
              )
            ],
          )),
    );
  }
}
