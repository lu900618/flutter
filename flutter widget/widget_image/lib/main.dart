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
          appBar: AppBar(title: Text("widget: 图片和icon")),
//          body: Image.asset( // 使用资源文件图片需要在 pubspec.yml 中配置图片信息
//            "images/flutter.png",
//            fit: BoxFit.cover,
//          ),
//          body: Image.network(// 使用网络图片
//              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557781801455&di=17f9f2fc3ded4efb7214d2d8314e8426&imgtype=0&src=http%3A%2F%2Fimg2.mukewang.com%2F5b4c075b000198c216000586.jpg"),
          body: Icon(
            Icons.android,
            size: 72,
            color: Colors.greenAccent,
          ),
        ));
  }
}
