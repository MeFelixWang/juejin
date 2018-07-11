import 'package:flutter/material.dart';
import 'pages/index.dart';
import 'pages/shareArticle.dart';
import 'pages/putHot.dart';
import 'pages/book.dart';
import 'pages/activities.dart';
import 'pages/search.dart';
import 'pages/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new IndexPage(),
      theme: ThemeData(
          bottomAppBarColor: new Color.fromRGBO(244, 245, 245, 1.0),
          scaffoldBackgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
          backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
          primaryIconTheme: new IconThemeData(color: Colors.blue),
          indicatorColor: Colors.blue,
          iconTheme: new IconThemeData(size: 18.0),
          primaryTextTheme:
              new TextTheme(title: new TextStyle(color: Colors.black,fontSize: 16.0))),
      routes: <String, WidgetBuilder>{
        '/search': (BuildContext context) => SearchPage(),
        '/shareArticle': (BuildContext context) => ShareArticlePage(),
        '/putHot': (BuildContext context) => PutHotPage(),
        '/books': (BuildContext context) => BookPage(),
        '/activities': (BuildContext context) => ActivitiesPage(),
        '/login': (BuildContext context) => LoginPage(),
      },
    );
  }
}
