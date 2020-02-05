import 'package:flutter/material.dart';

void main() => runApp(MyApp('Hello World'));

class MyApp extends StatefulWidget {
  String content;

  MyApp(this.content);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  void increment() {
    setState(() {
      widget.content += 'd';
    });
  }

  @override
  Widget build(BuildContext context) {
    Paint paint = Paint();
    paint.color = Colors.green;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Box Constraints'),
        ),
        body: Container(
//          constraints: BoxConstraints.tight(Size(100, 100)), // Container添加严格约束 当Widget是tight时，他的宽高是固定的
//          constraints: BoxConstraints.loose(Size(100, 100)), // Container添加松散约束（具体值） 当Widget是有child时，它的宽高是child的高度；反之是最大高度
//          constraints: BoxConstraints.tightFor(), //最大值为infinity：当Widget是有child时，它的宽高是child的高度；反之是铺满全屏
//          constraints: BoxConstraints(minWidth: 10, maxWidth: 300, minHeight: 0, maxHeight: 300), // Container添加有界约束 当Widget是有child时，它的宽高是child与min比较；反之是max值
//          constraints: BoxConstraints(minWidth: 10, maxWidth: double.infinity, minHeight: 100, maxHeight: double.infinity), // Container添加无界约束 当Widget是有child时，它的宽高是child与min比较；反之是全屏
          constraints: BoxConstraints.expand(), // Container添加无限约束
          color: Colors.red,
          child: Text(
            'Hello World!',
            style: TextStyle(background: paint),
          ),
        ),
      ),
    );
  }
}
