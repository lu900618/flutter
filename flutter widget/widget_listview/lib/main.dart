import 'package:flutter/material.dart';

void main() => runApp(MyApp(
      items: List<String>.generate(10000, (i) => "Item $i"),
    ));

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('widget ListView'),
        ),
//        body: ListView.builder(
//          itemBuilder: (context, index) => ListTile(
//            title: Text('${items[index]}'),
//          ),
//          itemCount: items.length,
//        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text('${items[index]}'),
                ),
            separatorBuilder: (context, index) => Container(
                  constraints: BoxConstraints.tightFor(height: 1),
                  color: Colors.grey,
                ),
            itemCount: items.length),
      ),
    );
  }
}

//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: Scaffold(
//        appBar: AppBar(title: Text('widget ListView'),),
//        body: ListView(
//          children: <Widget>[
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//            ListTile(title: Text('title1'),),
//          ],
//        ),
//      ),
//    );
//  }
//}
