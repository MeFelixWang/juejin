import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/countTime.dart';
import '../config/httpHeaders.dart';

class ActivitiesPage extends StatefulWidget {
  @override
  ActivitiesPageState createState() => new ActivitiesPageState();
}

class ActivitiesPageState extends State<ActivitiesPage> {
  Future getCities() async {
    final response = await http.get(Uri.encodeFull(
        'https://event-storage-api-ms.juejin.im/v1/getCityList?uid=&client_id=&token=&src=web'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new FutureBuilder(
      future: getCities(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var tabList = snapshot.data['d'];
          return new CreatePage(
            tabList: tabList,
          );
        } else if (snapshot.hasError) {
          return Text("error1>>>>>>>>>>>>>>>:${snapshot.error}");
        }
        return new Container(
          color: new Color.fromRGBO(244, 245, 245, 1.0),
          child: new CupertinoActivityIndicator(),
        );
      },
    );
  }
}

class CreatePage extends StatefulWidget {
  final List tabList;

  @override
  CreatePage({Key key, this.tabList}) : super(key: key);

  @override
  CreatePageState createState() => new CreatePageState();
}

class CreatePageState extends State<CreatePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
        length: widget.tabList.length,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
            leading: new IconButton(
                icon: new Icon(
                  Icons.chevron_left,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: new Text(
              '活动',
              style: new TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            bottom: new TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: widget.tabList.map((tab) {
                  return new Tab(text: tab['cityName']);
                }).toList()),
          ),
          body: new TabBarView(
              children: widget.tabList.map((cate) {
            return ActivitiesLists(
              categories: cate,
            );
          }).toList()),
        ));
  }
}

class ActivitiesLists extends StatefulWidget {
  final Map categories;

  @override
  ActivitiesLists({Key key, this.categories}) : super(key: key);

  ActivitiesListsState createState() => new ActivitiesListsState();
}

class ActivitiesListsState extends State<ActivitiesLists> {
  List activitiesList;

  Future getActivities(
      {int pageSize = 20,
      int pageNum = 1,
      String cityAlias = '',
      String orderType = 'startTime'}) async {
    final response = await http.get(Uri.encodeFull(
        'https://event-storage-api-ms.juejin.im/v2/getEventList?uid=&client_id=&token=&src=${httpHeaders['X-Juejin-Src']}&orderType=$orderType&cityAlias=$cityAlias&pageNum=$pageNum&pageSize=$pageSize'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new FutureBuilder(
        future: getActivities(cityAlias: widget.categories['cityAlias']),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            activitiesList = snapshot.data['d'];
            return new ListView.builder(
                itemCount: activitiesList.length,
                itemBuilder: (context, index) {
                  var item = activitiesList[index];
                  return createItem(item);
                });
          } else if (snapshot.hasError) {
            return new Center(
              child: new Text("error2>>>>>>>>>>>>>>>:${snapshot.error}"),
            );
          }
          return new CupertinoActivityIndicator();
        });
  }

  Widget createItem(itemInfo) {
    return new Container(
      margin: new EdgeInsets.only(top: 10.0),
        child: new Column(
      children: <Widget>[
        new Image.network(itemInfo['screenshot']),
        new Container(
          margin: new EdgeInsets.only(bottom: 10.0),
          color: Colors.white,
          padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(itemInfo['title'],
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.left),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Icon(Icons.date_range),
                  new Padding(padding: new EdgeInsets.only(right: 5.0)),
                  new Text(countTime(itemInfo['endTime']))
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.location_on),
                      new Padding(padding: new EdgeInsets.only(right: 5.0)),
                      new Text(itemInfo['city'])
                    ],
                  ),
                  new ActionChip(
                    label: new Text(
                      '报名参加',
                      style: new TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      return null;
                    },
                    backgroundColor: Colors.blue,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
