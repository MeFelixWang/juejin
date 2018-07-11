import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/hintSign.dart';

class BookPage extends StatefulWidget {
  @override
  BookPageState createState() => new BookPageState();
}

class BookPageState extends State<BookPage> {
  List books;
  int currentIndex = 0;

  Future getBooks() async {
    final response = await http.get(Uri.encodeFull(
        'https://xiaoce-timeline-api-ms.juejin.im/v1/getListByLastTime?uid=59120a711b69e6006865dd7b&client_id=1530247539258&token=eyJhY2Nlc3NfdG9rZW4iOiI3WnFya3prZnFFcmpzNkFRIiwicmVmcmVzaF90b2tlbiI6InJla0I1SllpMGZTME1SbFEiLCJ0b2tlbl90eXBlIjoibWFjIiwiZXhwaXJlX2luIjoyNTkyMDAwfQ%3D%3D&src=web&pageNum=1'));
    this.setState(() {
      books = json.decode(response.body)['d'];
      print(books);
    });
  }

  @override
  void initState() {
    super.initState();
    this.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(
            leading: new IconButton(
                icon: new Icon(Icons.chevron_left),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: new Text('掘金小册'),
            centerTitle: true,
            backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
          ),
          bottomNavigationBar: new BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              items: [
                new BottomNavigationBarItem(
                    icon: new Icon(Icons.book), title: new Text('全部小册')),
                new BottomNavigationBarItem(
                    icon: new Icon(Icons.local_grocery_store),
                    title: new Text('已购'))
              ]),
          body: currentIndex == 0
              ? new CustomScrollView(
                  slivers: <Widget>[
                    new SliverFixedExtentList(
                        delegate:
                            new SliverChildBuilderDelegate((context, index) {
                          var itemInfo = books[index];
                          return createItem(itemInfo);
                        }, childCount: books == null ? 0 : books.length),
                        itemExtent: 120.0)
                  ],
                )
              : new HintSign(),
        ));
  }

  Widget createItem(itemInfo) {
    return new Container(
      padding: new EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      decoration: new BoxDecoration(
        color: Colors.white,
          border: new Border(
              bottom: new BorderSide(width: 0.2, color: Colors.grey))),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Image.network(itemInfo['img']),
          new Expanded(
              child: new Padding(
            padding: new EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  itemInfo['title'],
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: new TextStyle(fontSize: 16.0),
                ),
                new Text(itemInfo['userData']['username']),
                new Text(
                  '${itemInfo['section'].length +
                          1}小姐·${itemInfo['buyCount']}人已购买',
                  style: new TextStyle(
                      fontSize: 12.0, color: Colors.grey, letterSpacing: 2.0),
                )
              ],
            ),
          )),
          new ActionChip(
            label: new Text(
              '￥${itemInfo['price']}',
              style: new TextStyle(color: Colors.blueAccent),
            ),
            backgroundColor: new Color.fromARGB(1, 225, 225, 225),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
