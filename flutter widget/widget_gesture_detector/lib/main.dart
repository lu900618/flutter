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
        appBar: AppBar(title: Text('widget 手势识别'),),
        body: GestureDetector(
          child: Text('手势识别'),
          onTap: () {
            print('点击');
          },
          onDoubleTap: () {
            print('双击');
          },
          onLongPress: () {
            print('长按');
          },
          onHorizontalDragStart: (DragStartDetails details) {
            print('水平滑动' + details.toString());
          },
        ),
      ),
    );
  }
}
