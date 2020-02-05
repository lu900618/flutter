import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Demo Home Page')),
        body: CustomScrollView(
          slivers: <Widget>[ // slivers: CustomScrollView 的列表项，只能以Sliver开头的一系列Widget，例如SliverList，SliverFixedExtentList，SliverGrid，SliverPadding，SliverAppBar
            const SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('demo'),
              ),
            ),
//            SliverGrid(
//              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                maxCrossAxisExtent: 200.0,
//                mainAxisSpacing: 10.0,
//                crossAxisSpacing: 10.0,
//                childAspectRatio: 4.0,
//              ),
//              delegate: SliverChildBuilderDelegate(
//                  (BuildContext context, int index) => Container(
//                        alignment: Alignment.center,
//                        color: Colors.teal[100 * (index % 9)],
//                        child: Text('grid item $index'),
//                      )),
//            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Container(
                        alignment: Alignment.center,
                        color: Colors.lightBlue[100 * (index % 9)],
                        child: Text('grid fixed item $index'),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
