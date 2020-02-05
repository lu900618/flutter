import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// SnackBar 需要使用 Scaffold.of(context).showSnackBar() 来显示
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      /// 使用 Builder，Builder 是一个闭包，将 Scaffold 的 context 传递给 子Widget，这样 SnackBar 使用的 context 就是 Scaffold 的 context。
//      home: Scaffold(
//        appBar: AppBar(title: Text('widget snakeBar'),),
//        body: Builder(builder: (context) => RaisedButton(
//          child: Text('show'),
//          onPressed: () {
//            Scaffold.of(context).showSnackBar(SnackBar(
//              content: Text('snakeBar is showing'),
//              duration: Duration(seconds: 5),
//            ));
//          },
//        )),
//      ),
      /// 将Widget单独拆分出来
      home: Scaffold(
        appBar: AppBar(
          title: Text('widget snakeBar'),
        ),
        body: SnackBarWidget(),
      ),
    );
  }
}

/// 抽取方法
class SnackBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('show'),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('snakeBar is showing'),
          duration: Duration(seconds: 5),
        ));
      },
    );
  }
}
